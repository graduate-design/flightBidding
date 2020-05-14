package njtech.design.flightBerth.controller;

import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/index")
public class UserInfoController {

    @Autowired
    private UserService userService;

    //登录验证
    @RequestMapping("/login")
    public String login(UserInfo userInfo, Model model){
        System.out.println(userInfo.getPhone()+"  "+ userInfo.getPassword());
        boolean isExist = userService.findUser(userInfo.getPhone(), userInfo.getPassword());
        if (isExist){
            return "success";
        }
        model.addAttribute("msg","用户名或密码不正确！");
        return "index";
    }

    //查看自己的竞价排名
    @RequestMapping("/rank")
    public String getRank(HttpSession session){
        String name = (String) session.getAttribute("username");
        return null;
    }
}
