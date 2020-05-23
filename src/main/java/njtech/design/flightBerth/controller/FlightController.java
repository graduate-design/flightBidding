package njtech.design.flightBerth.controller;


import com.google.gson.JsonObject;
import com.sun.net.httpserver.HttpContext;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/flight")
public class FlightController {

    @Autowired
    private FlightService flightService;

    @ResponseBody
    @RequestMapping(value = "/getAirCompany",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public List<String> getAirCompany(){
        List<String> airCompanyNames = flightService.getAirCompany();
        //String result = JsonUtils.toJson(airCompanyNames);
        System.out.println("航空公司数量"+airCompanyNames.size());
        return airCompanyNames;
    }

    @ResponseBody
    @RequestMapping(value = "/getBerth",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public List<String> getBerth(){
        String[] strings = {"商务舱","头等舱"};
        List<String> stringList = Arrays.asList(strings);
        return stringList;
    }

    @ResponseBody
    @RequestMapping(value = "/getCity",method = RequestMethod.GET,produces = "application/json;charset=utf-8")
    public List<String> getCity(){
        String[] list = {"北京","天津","石家庄","邯郸","唐山","秦皇岛","张家口","太原","运城","长治","大同","呼和浩特","包头","鄂尔多斯", "满洲里","乌兰浩特",
                "额济纳旗","阿拉善右旗","大连","沈阳","长春","哈尔滨","齐齐哈尔","漠河","南京","无锡","徐州","南通","扬州","连云港","盐城",
                "杭州","温州","义乌","台州","舟山","合肥","黄山","厦门","福州","泉州","南昌","宜春","九江","青岛","济南","烟台","威海","潍坊","郑州","洛阳","武汉","宜昌","襄阳",
                "恩施","长沙","张家界",
                "常德","衡阳","广州","深圳","珠海","揭阳","湛江","梅州","南宁","桂林","北海","柳州","三亚","海口","重庆","成都","宜宾","南充","西昌","达州","攀枝花","稻城","康定",
                "贵阳","遵义","荔波","六盘水","昆明","丽江","腾冲","香格里拉","临沧","拉萨","林芝","日喀则","西安",
                "兰州","敦煌","嘉峪关","庆阳","西宁","格尔木","玉树","乌鲁木齐","喀什","伊宁","吐鲁番"};
        String[] strings = {"北京","成都","杭州","重庆","武汉","西安","苏州","天津","南京","长沙","郑州","东莞","青岛","沈阳","宁波","昆明"};
        List<String> stringList = Arrays.asList(list);
        return stringList;
    }


}
