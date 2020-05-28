package njtech.design.flightBerth.controller;

import njtech.design.flightBerth.entity.AuthInfo;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.TicketDTO;
import njtech.design.flightBerth.enums.AuthorityEnum;
import njtech.design.flightBerth.enums.BerthClass;
import njtech.design.flightBerth.enums.TicketRemarkEnum;
import njtech.design.flightBerth.security.DuplicateData;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.service.TicketService;
import njtech.design.flightBerth.service.UserService;
import njtech.design.flightBerth.utils.Authentication;
import njtech.design.flightBerth.utils.DateConverters;
import njtech.design.flightBerth.utils.EmailCheck;
import njtech.design.flightBerth.utils.CheckUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserInfoController {

    @Autowired
    private UserService userService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private TicketService ticketService;

    //身份认证 (从查询页面)
    @RequestMapping(value = "/auth",method = RequestMethod.POST)
    public String authentication(AuthInfo authInfo,HttpSession session) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException {
        // 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //请先登录 转到登录主页
        }

        //名字是否满足要求
//        boolean numberFlag=authInfo.getRealName().matches("[0-9]+");
        boolean isChinese = CheckUtils.isChinese(authInfo.getRealName());
        if (!isChinese || authInfo.getRealName().length()<2){
            session.setAttribute("authInfo","姓名格式错误");
            return "redirect:/userAuth.jsp";
        }

        //是否为18位
        int len = authInfo.getIdentity().length();
        char[] array = authInfo.getIdentity().toCharArray();
        String sign = "";
        if (!CheckUtils.isChinese(authInfo.getIdentity())){
            for (int i = 0 ; i<len;i++){
                String s = String.valueOf(array[i]);
                if (s.matches("[0-9]+")){
                    sign = authInfo.getIdentity().substring(i);
                    break;
                }
            }
        }else {
            session.setAttribute("authInfo","身份证格式不对，请重新认证");
            return "redirect:/authentication.jsp";
        }

        if (sign.length()!=18){
            session.setAttribute("authInfo","身份证格式不对，请重新认证");
            return "redirect:/authentication.jsp";
        }

        int row = userService.findIdentity(sign);
        if (row!=0){
            session.setAttribute("authInfo","此身份信息已被注册");
            return "redirect:/authentication.jsp";
        }




        String result = Authentication.get(sign,authInfo.getRealName());
        if (result.contains("false")){
            //认证失败
            System.out.println(result);
            session.setAttribute("info","身份信息错误，请重新填写");
            return "redirect:/authentication.jsp";
        }
        // 认证成功
        //补充身份信息
        int sexIndex = result.indexOf("sex");
        String sex = result.substring(sexIndex+6,sexIndex+7);
        int count = userService.userInfoSupplement(phone,authInfo.getRealName(),sign,sex);
        if (count!=1){
            session.setAttribute("info","后台错误，请重新输入");
            return "redirect:/authentication.jsp";
        }


        //进入竞价页面
        //获取点击的flightid
        int flightId = (int) session.getAttribute("selectedFlight");
        Flight flight = flightService.findAccurateFlight(flightId);

        session.setAttribute("accurateFlight",flight);
        return "redirect:/bidding.jsp";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping("/register")
    @DuplicateData
    public String register(
            @RequestParam(value = "password",required = false) String password,
            @RequestParam(value = "repassword",required = false)String repassword,
            @RequestParam(value = "phone",required = false) String phone,
            @RequestParam("email")String email,
            HttpSession session)
    {
        boolean isMobile = CheckUtils.isMobileNO(phone);
        if (!isMobile){
            session.setAttribute("registerMsg", "手机格式不对");
            return "redirect:/register.jsp";
        }

        //验证手机号是否被注册过
        int count = userService.findPhone(phone);
        if (count!=0){
            session.setAttribute("registerMsg","该手机号已被注册");
            return "redirect:/register.jsp";
        }

        //验证邮箱是否被注册过
        int emailCount = userService.findEmail(email);
        if (emailCount!=0){
            session.setAttribute("registerMsg","该邮箱已被注册");
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
            // todo 检测邮箱是否有效
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
    @DuplicateData
    public String loign(@RequestParam(value = "phone") String phone, @RequestParam(value = "password") String password,
                        HttpSession session){

        UserInfo user = userService.login(phone,password);
        session.setAttribute("loginMsg",null);
        session.setAttribute("psdMsg",null);
        if (user != null && user.getAuthority()==AuthorityEnum.MEMBER.getAuthorityCode()){
//            session.setAttribute("loginMsg","登录成功");
            System.out.println(phone+"用户 登陆成功!");
            session.setAttribute("phone",phone);
            return "redirect:/success.jsp";
        }else if (user!=null && user.getAuthority()==AuthorityEnum.MANAGER.getAuthorityCode()){
            System.out.println(phone+"管理员 登陆成功!");
            //session.setAttribute("phone",phone);
            return "redirect:/adminSuccess.jsp";
        }
        else {
            session.setAttribute("loginMsg","密码或手机号不正确");
            return "redirect:/index.jsp";
        }
    }

    @RequestMapping(value = "/addTicket",method = RequestMethod.POST)
    public String addTicket(TicketDTO ticketDTO, HttpSession session){
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            // 请先登录 转到登录主页
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
        if (ticketDTO.getBerthClass().equalsIgnoreCase(BerthClass.BUSINESSCLASS.getBerthClass())){
            ticket.setBerthName(BerthClass.BUSINESSCLASS.getBerthName());
        }else if (ticketDTO.getBerthClass().equalsIgnoreCase(BerthClass.ECONOMYCLASS.getBerthClass())){
            ticket.setBerthName(BerthClass.ECONOMYCLASS.getBerthName());
        }else {
            ticket.setBerthName(BerthClass.FISRTCLASS.getBerthName());
        }
        ticket.setAirCompanyName(ticketDTO.getAirCompanyName());
        ticket.setBuyWay(1);
        ticket.setFlightNum(ticketDTO.getFlightNum());

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = simpleDateFormat.format(ticketDTO.getFlightDate());
        StringBuffer dateTime = new StringBuffer();
        dateTime.append(date+" ");
        //判断小时数是否为两位，不是则补齐
        if (DateConverters.lengthNum(ticketDTO.getFlightHour())==1){
            StringBuffer sb1 = new StringBuffer();
            sb1.append("0");
            sb1.append(ticketDTO.getFlightHour());
            dateTime.append(sb1.toString()+":");
        }else {
            dateTime.append(ticketDTO.getFlightHour()+":");
        }

        if (DateConverters.lengthNum(ticketDTO.getFlightMin())==1){
            StringBuffer sb1 = new StringBuffer();
            sb1.append("0");
            sb1.append(ticketDTO.getFlightMin());
            dateTime.append(sb1.toString());
        }else {
            dateTime.append(ticketDTO.getFlightMin());
        }


        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            ticket.setFlightTime(sdf1.parse(dateTime.toString()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("起飞时间"+dateTime.toString());
        System.out.println("起飞日期"+ticketDTO.getFlightDate());

        ticket.setFlightDate(ticketDTO.getFlightDate());

        ticket.setStart(ticketDTO.getStart());
        ticket.setDestination(ticketDTO.getDestination());
        ticket.setGateNum(null);
        ticket.setSeatNum(null);
        ticket.setIdentity(userInfo.getIdentity());
        ticket.setUserName(userInfo.getUserName());

        //假设调查询接口
        int rd=Math.random()>0.5?1:0;
        System.out.println(rd);
        if (rd==0){

            session.setAttribute("addTicketInfo","查询不到您的购票记录,请重试");
            return "redirect:/addTicket.jsp";
        }

        int row = ticketService.insertTicket(ticket);
        if (row!=0){
            session.setAttribute("addTicketInfo","添加机票成功");
            return "redirect:/success.jsp";
        }
        session.setAttribute("addTicketInfo","后台错误，请重试");
        return "redirect:/addTicket.jsp";
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.setAttribute("phone",null);
        return "redirect:/index.jsp";
    }

    //查看是否认证过
    @RequestMapping("/checkAuth")
    public String checkAuth(HttpSession session){
        // 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            // 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        boolean isRemark = userService.userIsRemark(phone);
        if (isRemark){
            System.out.println("您已认证");
            session.setAttribute("authInfo","您已认证");
            return "redirect:/success.jsp";
        }
        return "redirect:/userAuth.jsp";
    }

    //验证身份信息
    @RequestMapping("/userAuth")
    public String userAuth(AuthInfo authInfo,HttpSession session){
        // 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            // 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }



        boolean isRemark = userService.userIsRemark(phone);
        if (isRemark){
            System.out.println("您已认证");
            session.setAttribute("authInfo","您已认证");
            return "redirect:/success.jsp";
        }

        //名字是否满足要求
//        boolean numberFlag=authInfo.getRealName().matches("[0-9]+");
        boolean isChinese = CheckUtils.isChinese(authInfo.getRealName());
        if (!isChinese || authInfo.getRealName().length()<2){
            session.setAttribute("authInfo","姓名格式错误");
            return "redirect:/userAuth.jsp";
        }

        //是否为18位
        int len = authInfo.getIdentity().length();
        char[] array = authInfo.getIdentity().toCharArray();
        String sign = "";
        if (!CheckUtils.isChinese(authInfo.getIdentity())){
            for (int i = 0 ; i<len;i++){
                String s = String.valueOf(array[i]);
                if (s.matches("[0-9]+")){
                    sign = authInfo.getIdentity().substring(i);
                    break;
                }
            }
        }else {
            session.setAttribute("authInfo","身份证格式不对，请重新认证");
            return "redirect:/userAuth.jsp";
        }

        if (sign.length()!=18){
            session.setAttribute("authInfo","身份证格式不对，请重新认证");
            return "redirect:/userAuth.jsp";
        }

        int row = userService.findIdentity(sign);
        if (row!=0){
            session.setAttribute("authInfo","此身份信息已被注册");
            return "redirect:/userAuth.jsp";
        }



        String result = null;
        try {
            result = Authentication.get(sign,authInfo.getRealName());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        if (result.contains("false")){
            //认证失败
            System.out.println(result);
            session.setAttribute("authInfo","身份信息不匹配，请重新填写");
            return "redirect:/userAuth.jsp";
        }else {
            // 认证成功
            //补充身份信息
            int sexIndex = result.indexOf("sex");
            String sex = result.substring(sexIndex+6,sexIndex+7);
            int count = userService.userInfoSupplement(phone,authInfo.getRealName(),sign,sex);
            if (count!=1){
                session.setAttribute("authInfo","后台错误，请重新输入");
                return "redirect:/userAuth.jsp";
            }
            System.out.println("认证成功");
            session.setAttribute("authInfo","认证成功，不可更改");
            return "redirect:/success.jsp";
        }
    }


    //用户界面的机票信息
    @RequestMapping("/ticket")
    public String getTicket(HttpSession session){
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        UserInfo userInfo = userService.getUser(phone);

        List<Ticket> tickets = ticketService.getTicket(userInfo.getIdentity(),userInfo.getUserName());
        session.setAttribute("allTickets",tickets);
        return "redirect:/showTicket.jsp";
    }

    //查询是否认证 （从添加机票界面竞价前的认证）
    @RequestMapping(value = "/checkAdd",method = RequestMethod.GET)
    public String checkAdd( HttpSession session){
        //TODO 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        boolean isRemark = userService.userIsRemark(phone);

        if (!isRemark){
            session.setAttribute("authInfo","您需要进行身份认证，才能进行下一步操作");
            return "redirect:/userAuth.jsp";
        }
        //已认证
        return "redirect:/addTicket.jsp";
    }

    //查询是否认证 （从显示机票界面竞价前的认证）
    @RequestMapping(value = "/checkTicket",method = RequestMethod.GET)
    public String checkTicket (HttpSession session, HttpServletRequest request){
        //TODO 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        //phone = "15850725308";
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        boolean isRemark = userService.userIsRemark(phone);

        if (!isRemark){
            session.setAttribute("authInfo","您需要进行身份认证，才能进行下一步操作");
            return "redirect:/userAuth.jsp";
        }
        return "forward:/user/ticket";
    }

    @RequestMapping("/bid")
    public String bid(@RequestParam("ticketId")int ticketId, HttpSession session){
        // 需要在登录的时候存session中的登录账户
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            // 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        if (String.valueOf(ticketId)!=null){

            //从显示机票界面进来的
            //通过ticketID得到这个航班
            Ticket ticket = ticketService.findTicket(ticketId);
            if (ticket==null){
                session.setAttribute("ticketBidInfo","机票不存在或已过期");
                return "redirect:/showTicket.jsp";
            }
            Flight flight = flightService.getFlight(ticket.getAirCompanyName(),ticket.getFlightNum(),
                    ticket.getStart(),ticket.getDestination(),ticket.getFlightTime());
            if (flight==null){
                //该机票没有对应可以升舱的航班
                session.setAttribute("ticketBidInfo","该航班无法进行升舱操作");
                return "redirect:/showTicket.jsp";
            }
            session.setAttribute("flight",flight.getId());

            return "forward:/bid/check?flight="+flight.getId();
        }

        return "redirect:/showTicket.jsp";
    }

    @RequestMapping("/modify")
    public String modify(
            @RequestParam(value = "usercode",required = false) String usercode,
            @RequestParam(value = "sex",required = false)String sex,
            @RequestParam(value = "age",required = false) int age,
            HttpSession session)
    {
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        UserInfo user = new UserInfo();
        user.setUserCode(usercode);
//        user.setUserSex(sex);
        user.setUserAge(age);

        boolean flag = userService.modify(user,phone);
        if (flag = true) {
            session.setAttribute("changeMsg", "修改成功");
            return "redirect:/modify.jsp";
        } else {
            session.setAttribute("changeMsg", "修改失败");
            return "redirect:/modify.jsp";
        }
    }

    @RequestMapping("/changePsd")
    public String changePsd(
            @RequestParam(value = "password",required = false) String password,
            @RequestParam(value = "repassword",required = false)String repassword,
            HttpSession session)
    {
        String phone = (String) session.getAttribute("phone");

        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }

        if (password.equals(repassword)) {
            boolean flag = userService.changePassword(password,phone);
            if (flag) {
                session.setAttribute("psdMsg", "密码修改成功");
                return "redirect:/index.jsp";
            } else {
                session.setAttribute("psdMsg", "修改失败");
                return "redirect:/changePsd.jsp";
            }
        } else {
            session.setAttribute("psdMsg", "密码不一致");
            return "redirect:/changePsd.jsp";
        }
    }

    @RequestMapping("/finishCheck")
    public String finishCheck(HttpSession session){
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        UserInfo userInfo = userService.getUser(phone);
        session.setAttribute("userInfoCheck",userInfo);
        return "redirect:/finishCheck.jsp";
    }

    //注销账户
    @RequestMapping("/finish")
    public String finish(HttpSession session){
        String phone = (String) session.getAttribute("phone");
        if (StringUtils.isEmpty(phone)){
            //TODO 请先登录 转到登录主页
            return "redirect:/index.jsp";
        }
        userService.deleteUser(phone);
        session.setAttribute("finish","注销成功");
        return "redirect:/index.jsp";

    }

}
