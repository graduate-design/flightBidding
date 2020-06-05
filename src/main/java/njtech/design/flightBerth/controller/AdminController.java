package njtech.design.flightBerth.controller;


import njtech.design.flightBerth.dao.PriceMapper;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Price;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.service.PriceService;
import njtech.design.flightBerth.service.TicketService;
import njtech.design.flightBerth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("currentUser")
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private PriceService priceService;
    @Autowired
    private TicketService ticketService;
    @Autowired
    private FlightService flightService;


    /**
     * 跳到编辑页面
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping("/userMain")
    public String  userMain(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", userService.findByPage(currentPage));//回显分页数据
        return "userMain";
    }

    @RequestMapping("/userEdit")
    public String userEdit(@RequestParam("id") int id,Model model){
        UserInfo user =userService.selectByPrimaryKey(id);
        model.addAttribute("returnUser", user);
        return "userEdit";
    }
    /**
     * 保存用户数据
     * @return
     */
    @RequestMapping("/userSave")
    public String userSave(UserInfo user){
        System.out.println(user.toString());
        if(user.getId() <= 0){
            System.out.println("111");
            //id为null是保存
            userService.insertSelective(user);
        }else{
            System.out.println("222");
            //有id值为修改
            userService.updateByPrimaryKeySelective(user);
        }
        return "redirect:userMain";
    }

    /**
     * 删除用户数据
     * @param id
     * @return
     */
    @RequestMapping("/userDelete")
    public String userDelete(@RequestParam("id") int id){
        userService.deleteByPrimaryKey(id);
        return "userMain";
    }
    /**
     * 添加一个用户数据
     * @return
     */
    @RequestMapping("/userAdd")
    public String userAdd(Model model){
        model.addAttribute("returnUser", new UserInfo());
        return "userEdit";
    }

    //查询价格
    /**
     * 跳到编辑页面
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping("/priceMain")
    public String  priceMain(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", priceService.findByPage(currentPage));//回显分页数据
        return "priceMain";
    }

    @RequestMapping("/priceEdit")
    public String priceEdit(@RequestParam("id") int id,Model model){
        Price price =priceService.selectByPrimaryKey(id);
        model.addAttribute("returnPrice", price);
        return "priceEdit";
    }
    /**
     * 保存用户数据
     * @return
     */
    @RequestMapping("/priceSave")
    public String priceSave(Price price){
        System.out.println(price.toString());
        if(price.getId() <= 0){
            //id为null是保存
            priceService.insertSelective(price);
        }else{
            //有id值为修改
            priceService.updateByPrimaryKeySelective(price);
        }
        return "priceMain";
    }

    /**
     * 删除用户数据
     * @param id
     * @return
     */
    @RequestMapping("/priceDelete")
    public String priceDelete(@RequestParam("id") int id){
        priceService.deleteByPrimaryKey(id);
        return "priceMain";
    }
    /**
     * 添加一个用户数据
     * @return
     */
    @RequestMapping("/priceAdd")
    public String priceAdd(Model model){
        model.addAttribute("returnPrice", new Price());
        return "priceEdit";
    }
    //查询机票
    /**
     * 跳到编辑页面
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping("/ticketMain")
    public String  ticketMain(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", ticketService.findByPage(currentPage));//回显分页数据
        return "ticketMain";
    }

    @RequestMapping("/ticketEdit")
    public String ticketEdit(@RequestParam("id") int id,Model model){
        Ticket ticket =ticketService.selectByPrimaryKey(id);
        model.addAttribute("returnTicket", ticket);
        return "ticketEdit";
    }
    /**
     * 保存用户数据
     * @return
     */
    @RequestMapping("/ticketSave")
    public String ticketSave(Ticket ticket){
        System.out.println(ticket.toString());
        if(ticket.getId() <= 0){
            //id为null是保存
            ticketService.insertSelective(ticket);
        }else{
            //有id值为修改
            ticketService.updateByPrimaryKeySelective(ticket);
        }
        return "ticketMain";
    }

    /**
     * 删除用户数据
     * @param id
     * @return
     */
    @RequestMapping("/ticketDelete")
    public String ticketDelete(@RequestParam("id") int id){
        ticketService.deleteByPrimaryKey(id);
        return "ticketMain";
    }
    /**
     * 添加一个用户数据
     * @return
     */
    @RequestMapping("/ticketAdd")
    public String ticketAdd(Model model){
        model.addAttribute("returnTicket", new Ticket());
        return "ticketEdit";
    }

    @RequestMapping("/flightMain")
    public String  flightMain(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", flightService.findByPage(currentPage));//回显分页数据
        return "flightMain";
    }

    @RequestMapping("/flightEdit")
    public String flightEdit(@RequestParam("id") int id,Model model){
        Flight flight = flightService.selectByPrimaryKey(id);
        model.addAttribute("returnFlight", flight);
        return "flightEdit";
    }
    /**
     * 保存用户数据
     * @return
     */
    @RequestMapping("/flightSave")
    public String flightSave(Flight flight){
        System.out.println(flight.toString());
        if(flight.getId() <= 0){
            System.out.println("111");
            //id为null是保存
            flightService.insertSelective(flight);
        }else{
            System.out.println("222");
            //有id值为修改
            flightService.updateByPrimaryKeySelective(flight);
        }
        return "flightMain";
    }

    /**
     * 删除用户数据
     * @param id
     * @return
     */
    @RequestMapping("/flightDelete")
    public String flightDelete(@RequestParam("id") int id){
        flightService.deleteByPrimaryKey(id);
        return "flightMain";
    }
    /**
     * 添加一个用户数据
     * @return
     */
    @RequestMapping("/flightAdd")
    public String flightAdd(Model model){
        model.addAttribute("returnFlight", new Flight());
        return "flightEdit";
    }
}
