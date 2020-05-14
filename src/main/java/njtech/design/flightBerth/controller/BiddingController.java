package njtech.design.flightBerth.controller;


import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.dto.FlightDTO;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.utils.DateConverters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/bidding")
public class BiddingController {

    @Autowired
    private FlightService flightService;

    @RequestMapping("/toFind")
    public String toFind(HttpServletRequest request){
        return "findFlight";
    }

    //查询该航班是否可参与竞价
    @RequestMapping(value = "/findFlight",method = RequestMethod.POST)
    public String findFlight(FlightDTO flightDTO,  Model model){
        System.out.println(flightDTO.getStartDate());

        List<Flight> flights = flightService.findFlight(flightDTO.getAirCompanyName(), flightDTO.getFlightNum(), DateConverters.dateConverter(flightDTO.getStartDate()));
        if (CollectionUtils.isEmpty(flights)){
            model.addAttribute("msg","您输入的航班信息没有相应的可升舱要求");
            return "findFlight";
        }
        model.addAttribute("flights",flights);

        for (Flight flight:flights){
            System.out.println(flight.getId()+flight.getAirCompanyName()+flight.getFlightNum()+flight.getFlightDate());
        }
        return "flight";
    }


    //显示所有航班信息
    @RequestMapping("/flights")
    public String findFlights(/*@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,*/ HttpSession session){

//        SimpleDateFormat sdf = new SimpleDateFormat("");
//        List<Flight> flights = flightService.findAll(date);
        List<Flight> flights = flightService.findAll(null);
        session.setAttribute("allFlights",flights);
        for (Flight flight:flights)
            System.out.println(flight.getAirCompanyName()+" "+flight.getFlightNum());
        return "showFlight";
    }

}
