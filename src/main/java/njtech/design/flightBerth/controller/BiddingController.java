package njtech.design.flightBerth.controller;


import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.FlightDTO;
import njtech.design.flightBerth.entity.dto.FlightRespDTO;
import njtech.design.flightBerth.entity.dto.PriceDTO;
import njtech.design.flightBerth.entity.dto.ShowBidDTO;
import njtech.design.flightBerth.enums.BerthClass;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.service.PriceService;
import njtech.design.flightBerth.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/bid")
public class BiddingController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private UserService userService;

    @Autowired
    private PriceService priceService;

    @RequestMapping("/toFind")
    public String toFind() {
        return "redirect:/findFlight.jsp";
    }

    //查询该航班是否可参与竞价
    @RequestMapping(value = "/findFlight", method = RequestMethod.POST)
    public String findFlight(FlightDTO flightDTO, HttpSession session) throws IOException, ServletException {
//        System.out.println(flightDTO.getStartDate());
        session.setAttribute("msg", null);
        List<FlightRespDTO> flights = flightService.findFlight(flightDTO.getAirCompanyName(), flightDTO.getFlightNum(), flightDTO.getStartDate());
        if (CollectionUtils.isEmpty(flights)) {
            session.setAttribute("msg", "您输入的航班信息没有找到相应的可升舱要求的航班");
//             request.getRequestDispatcher("/findFlight.jsp").forward(request,response); ;
            return "forward:/bid/toFind";
        }
//        System.out.println(flights.size());
        session.setAttribute("flights", flights);
        session.setAttribute("flag", "accurate");

        System.out.println(flights.get(0).getFlightDate());
        return "redirect:/flights.jsp";
    }


    //显示所有航班信息
    @RequestMapping("/flights")
    public String findFlights(HttpSession session) {

        List<FlightRespDTO> flights = flightService.findAll(null);
        session.setAttribute("allFlights", flights);
        session.setAttribute("flag", "all");

        return "redirect:/allFlights.jsp";
    }

    //查询是否添加个人信息
    @RequestMapping(value = "/check", method = RequestMethod.GET)
    public String checkInfo(@RequestParam("flight") int flightId, HttpSession session) {
        // 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)) {
            //T请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        boolean isRemark = userService.userIsRemark(phone);

        if (!isRemark) {
            session.setAttribute("selectedFlight", flightId);
            session.setAttribute("info", "您需要进行身份认证，才能进行下一步操作");
            return "redirect:/authentication.jsp";
        }
        //已认证
        //获取点击的航班所有信息
        Flight flight = flightService.findAccurateFlight(flightId);

        session.setAttribute("accurateFlight", flight);
        return "redirect:/bidding.jsp";
    }

    //提交竞价
    @RequestMapping(value = "/subPrice", method = RequestMethod.GET)
    public String submitPrice(@Param("price") int price, HttpSession session, HttpServletRequest request) {
        String bidClass = request.getParameter("class");
        //检查该身份证下是否有订票信息
        Flight flight = (Flight) session.getAttribute("accurateFlight");

        //TODO 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        //phone = "15850725308";
        if (StringUtils.isEmpty(phone)) {
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        UserInfo userInfo = userService.getUser(phone);

        //查看是否有可竞价的舱位
        if (bidClass.equalsIgnoreCase(BerthClass.BUSINESSCLASS.getBerthClass())) {
            if (flight.getRedundantBusinessClass() == 0) {
                session.setAttribute("bidInfo", "您选择的舱位没有可竞价的位置");
                return "redirect:/bidding.jsp";
            }
        } else {
            if (flight.getRedundantFirstClass() == 0) {
                session.setAttribute("bidInfo", "您选择的舱位没有可竞价的位置");
                return "redirect:/bidding.jsp";
            }
        }

        int count = flightService.getFlightAndTicket(userInfo.getIdentity(), flight.getFlightNum(), flight.getStartPlace(), flight.getTargetPlace(), flight.getFlightDate());
        if (count == 0) {
            session.setAttribute("ticketInfo", "未找到您购买本次航班的记录，如确实购买，请转到添加机票页面");
            return "redirect:/success.jsp";
        } else {
            //有订票信息
            //转到竞价成功（添加竞价信息），显示排名界面
            session.setAttribute("ticketInfo", null);
            PriceDTO priceDTO = priceService.insertPrice(bidClass, price, flight, userInfo);
            if (priceDTO.getPriceExist() != null) {
                if (StringUtils.isEmpty(priceDTO.getMsg())) {
                    if (priceDTO.getChangeRow() != 0) {
                        //提交成功 显示目前竞价排名
                        session.setAttribute("bidInfo", null);
                        session.setAttribute("accurateFlight", flight);
                        session.setAttribute("bidClass", bidClass);
                        session.setAttribute("submittedPrice", price);
                        session.setAttribute("presentRank", priceDTO.getRank());
                        return "redirect:/showRank.jsp";
                    } else {
                        session.setAttribute("bidInfo", "提交失败，请重试");
                        return "redirect:/bidding.jsp";
                    }

                } else {
                    //1. 金额不对
                    //2. 存在其他舱位竞价
                    session.setAttribute("bidInfo", priceDTO.getMsg());
                    session.setAttribute("accurateFlight", flight);
                    session.setAttribute("bidClass", priceDTO.getPriceExist().getBerthClass());
                    session.setAttribute("submittedPrice", priceDTO.getPriceExist().getPrice());
                    session.setAttribute("presentRank", priceDTO.getRank());
                    return "redirect:/showRank.jsp";
                }

            } else {
                if (priceDTO.getChangeRow() != 0) {
                    session.setAttribute("bidInfo", null);
                    session.setAttribute("accurateFlight", flight);
                    session.setAttribute("bidClass", bidClass);
                    session.setAttribute("submittedPrice", price);
                    session.setAttribute("presentRank", priceDTO.getRank());
                    return "redirect:/showRank.jsp";
                } else {
                    session.setAttribute("bidInfo", "第一次提交失败，请重试");
                    return "redirect:/bidding.jsp";
                }
            }
        }

    }

    @RequestMapping("/addPrice")
    public String add(@Param("price") int price, HttpSession session, HttpServletRequest request) {
        String bidClass = request.getParameter("class");
        Flight flight = (Flight) session.getAttribute("accurateFlight");

        if (StringUtils.isEmpty(bidClass)) {
            bidClass = (String) session.getAttribute("bidClass");
        }

        //TODO 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)) {
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        UserInfo userInfo = userService.getUser(phone);

        //修改竞价
        PriceDTO priceDTO = priceService.updatePrice(bidClass, price, flight.getFlightCode(), userInfo);

        if (priceDTO.getChangeRow() != 0) {
            //提交成功 显示目前竞价排名
            session.setAttribute("bidInfo", null);
            session.setAttribute("accurateFlight", flight);
            session.setAttribute("bidClass", bidClass);

            session.setAttribute("submittedPrice", price);
            session.setAttribute("presentRank", priceDTO.getRank());
            return "redirect:/showRank.jsp";
        } else {
            session.setAttribute("bidInfo", "提交失败，请重试");
            return "redirect:/showRank.jsp";
        }

    }

    //退出竞价 （显示排名界面进来）
    @RequestMapping("/exit")
    public String exit(HttpSession session) {
        Flight flight = (Flight) session.getAttribute("accurateFlight");

        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)) {
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        UserInfo userInfo = userService.getUser(phone);
        //
        priceService.removePrice(flight, userInfo);
        return "redirect:/success.jsp";
    }


    //用户竞价信息展示
    @RequestMapping("/showBid")
    public String showBid(HttpSession session) {
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)) {
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        UserInfo userInfo = userService.getUser(phone);

        //通过用户的ticket 找航班flight 的code
        //再从flightCode找竞价 返回的是list
        List<ShowBidDTO> showBidDTOList = flightService.showBid(userInfo);
        session.setAttribute("showBid", showBidDTOList);
        return "redirect:/showBid.jsp";
    }

    //竞价信息中 点击增加
    @RequestMapping(value = "/addBid", method = RequestMethod.GET)
    public String addBid(@RequestParam("flightId") int flightId,
                         @RequestParam("flightCode") String flightCode, HttpServletRequest request
            , HttpSession session) {
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)) {
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        Flight flight = flightService.findAccurateFlight(flightId);

        PriceDTO priceDTO = priceService.findPriceAndRank(phone, flightCode);

        session.setAttribute("accurateFlight", flight);
        session.setAttribute("bidClass", priceDTO.getPriceExist().getBerthClass());
        session.setAttribute("submittedPrice", priceDTO.getPriceExist().getPrice());
        session.setAttribute("presentRank", priceDTO.getRank());
        request.setAttribute("class", priceDTO.getPriceExist().getBerthClass());
        return "redirect:/showRank.jsp";
    }


    @RequestMapping(value = "/exitBid", method = RequestMethod.GET)
    public String exitBid(@RequestParam("flightId") int flightId, HttpSession session) {

        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)) {
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        UserInfo userInfo = userService.getUser(phone);
        //

        Flight flight = flightService.findAccurateFlight(flightId);

        priceService.removePrice(flight, userInfo);

        session.setAttribute("accurateFlight", null);
        return "forward:/bid/showBid";
    }
}
