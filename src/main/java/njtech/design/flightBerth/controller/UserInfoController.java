package njtech.design.flightBerth.controller;

import njtech.design.flightBerth.entity.AuthInfo;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.enums.AuthorityEnum;
import njtech.design.flightBerth.enums.BerthClass;
import njtech.design.flightBerth.enums.TicketRemarkEnum;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.service.TicketService;
import njtech.design.flightBerth.service.UserService;
import njtech.design.flightBerth.utils.Authentication;
import njtech.design.flightBerth.utils.EmailCheck;
import njtech.design.flightBerth.utils.PhoneUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
@RequestMapping("/user")
public class UserInfoController {

    @Autowired
    private UserService userService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private TicketService ticketService;

    //身份认证
    @RequestMapping(value = "/auth",method = RequestMethod.POST)
    public String authentication(AuthInfo authInfo,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException {
        //TODO 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
//        phone = "15850725308";
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
        }
        String result = Authentication.get(authInfo.getIdentity(),authInfo.getRealName());
        if (result.contains("false")){
            //认证失败
            System.out.println(result);
            request.setAttribute("info","身份信息错误，请重新填写");
            return "redirect:/authentication.jsp";
        }
        // 认证成功
        //补充身份信息
        int sexIndex = result.indexOf("sex");
        String sex = result.substring(sexIndex+6,sexIndex+7);
        int count = userService.userInfoSupplement(phone,authInfo.getRealName(),authInfo.getIdentity(),sex);
        if (count!=1){
            request.setAttribute("info","后台错误，请重新输入");
            return "redirect:/authentication.jsp";
        }


        //进入竞价页面
        //获取点击的flightid
        int flightId = (int) session.getAttribute("selectedFlight");
        Flight flight = flightService.findAccurateFlight(flightId);

        session.setAttribute("accurateFlight",flight);
        return "redirect:/bidding.jsp";
    }

    @RequestMapping("/register")
    public String register(
            @RequestParam(value = "password",required = false) String password,
            @RequestParam(value = "repassword",required = false)String repassword,
            @RequestParam(value = "phone",required = false) String phone,
            @RequestParam("email")String email,
            HttpServletRequest request,HttpSession session)
    {
        boolean isMobile = PhoneUtils.isMobileNO(phone);
        if (!isMobile){
            session.setAttribute("registerMsg", "手机格式不对");
            return "redirect:/register.jsp";
        }

        if (password.equals(repassword)) {
            UserInfo user = new UserInfo();
            user.setUserCode(phone);
            user.setPassword(password);
            user.setPhone(phone);
            user.setAuthority(AuthorityEnum.MEMBER.getAuthorityCode());
            user.setRemark("未认证");
            user.setEmail(email);
            //检测邮箱是否有效
            boolean isTrue = EmailCheck.checkEmail(email);
            if (!isTrue){
                session.setAttribute("registerMsg", "邮箱无效");
                return "redirect:/register.jsp";
            }
//            System.out.println(user);
            int row = userService.register(user);
            if (row> 0) {
                session.setAttribute("registerMsg", "注册成功");
                return "redirect:/index.jsp";
            } else {
                session.setAttribute("registerMsg", "注册失败");
                return "redirect:/register.jsp";
            }
        } else {
            session.setAttribute("registerMsg", "密码不一致");
            return "redirect:/register.jsp";
        }
    }

    @RequestMapping("/login")
    public String loign(@RequestParam(value = "phone") String phone, @RequestParam(value = "password") String password, HttpServletRequest request ,HttpSession session){

        UserInfo user = userService.login(phone,password);
        if (user != null){
//            session.setAttribute("loginMsg","登录成功");
            System.out.println(phone+"用户 登陆成功!");
            session.setAttribute("phone",phone);
            return "redirect:/success.jsp";
        }else {
            session.setAttribute("loginMsg","登录失败");
            return "redirect:/index.jsp";
        }
    }

    @RequestMapping(value = "/addTicket",method = RequestMethod.GET)
    public String addTicket(@RequestParam(value = "airCompanyName") String airCompanyName,
                            @RequestParam(value = "flightNum")String flightNum,
                            @RequestParam(value = "flightTime")@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") Date flightTime,
                            @RequestParam("start")String start,
                            @RequestParam(value = "destination")String destination,
                            @RequestParam("berthClass") String berthClass,
                            @RequestParam(value = "gateNum") String gateNum,
                            @RequestParam("seatNum")String seatNum,
                            HttpServletRequest request,HttpSession session){
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        UserInfo userInfo = userService.getUser(phone);

        Ticket ticket = new Ticket();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateStr = sdf.format(new Date());
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("TICKET");
        stringBuffer.append(dateStr);
        stringBuffer.append(userInfo.getId());

        ticket.setTicCode(stringBuffer.toString());
        ticket.setRemark(TicketRemarkEnum.BIDDING.getRemark());
        if (berthClass.equalsIgnoreCase(BerthClass.BUSINESSCLASS.getBerthClass())){
            ticket.setBerthName(BerthClass.BUSINESSCLASS.getBerthName());
        }else if (berthClass.equalsIgnoreCase(BerthClass.ECONOMYCLASS.getBerthClass())){
            ticket.setBerthName(BerthClass.ECONOMYCLASS.getBerthName());
        }else {
            ticket.setBerthName(BerthClass.FISRTCLASS.getBerthName());
        }
        ticket.setAirCompanyName(airCompanyName);
        ticket.setBuyWay(1);
        ticket.setFlightNum(flightNum);
        ticket.setFlightTime(flightTime);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String nowdayTime = dateFormat.format(flightTime);
        Date nowDate = null;
        try {
           nowDate  = dateFormat.parse(nowdayTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        ticket.setFlightDate(nowDate);
        ticket.setStart(start);
        ticket.setDestination(destination);
        ticket.setGateNum(gateNum);
        ticket.setSeatNum(seatNum);


        ticket.setIdentity(userInfo.getIdentity());
        ticket.setUserName(userInfo.getUserName());

        int row = ticketService.insertTicket(ticket);

        return "redirect:/success.jsp";
    }

}
