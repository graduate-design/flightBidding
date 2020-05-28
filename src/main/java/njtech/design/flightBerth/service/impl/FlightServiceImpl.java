package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.AirCompanyMapper;
import njtech.design.flightBerth.dao.FlightMapper;
import njtech.design.flightBerth.dao.PriceMapper;
import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Price;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.FlightDTO;
import njtech.design.flightBerth.entity.dto.FlightRespDTO;
import njtech.design.flightBerth.entity.dto.ShowBidDTO;
import njtech.design.flightBerth.entity.dto.SuccessRank;
import njtech.design.flightBerth.enums.TicketRemarkEnum;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;

    @Autowired
    private TicketMapper ticketMapper;

    @Autowired
    private PriceService priceService;

    @Autowired
    private PriceMapper priceMapper;

    @Autowired
    private AirCompanyMapper airCompanyMapper;

    @Override
    public List<FlightRespDTO> findFlight(String airCompanyName, String flightNum,  Date startDate) {
        List<Flight> flights = flightMapper.findFlight(airCompanyName, flightNum, startDate);
        List<FlightRespDTO> flightRespDTOS = new ArrayList<>();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (Flight flight:flights){
            FlightRespDTO flightRespDTO = new FlightRespDTO();
            flightRespDTO.setId(flight.getId());
            flightRespDTO.setAirCompanyName(flight.getAirCompanyName());
            flightRespDTO.setFlightNum(flight.getFlightNum());
            flightRespDTO.setFlightDate(flight.getFlightDate());
            flightRespDTO.setRedundantBusinessClass(flight.getRedundantBusinessClass());
            flightRespDTO.setRedundantFirstClass(flight.getRedundantFirstClass());
            flightRespDTOS.add(flightRespDTO);
        }
        return flightRespDTOS;
    }

    @Override
    public List<FlightRespDTO> findAll(Date date) {
        List<Flight> flights = flightMapper.findFlight(null, null, date);
        List<FlightRespDTO> flightRespDTOS = new ArrayList<>();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (Flight flight:flights){
            FlightRespDTO flightRespDTO = new FlightRespDTO();
            flightRespDTO.setId(flight.getId());
            flightRespDTO.setAirCompanyName(flight.getAirCompanyName());
            flightRespDTO.setFlightNum(flight.getFlightNum());
            flightRespDTO.setFlightDate(flight.getFlightDate());
            flightRespDTO.setRedundantBusinessClass(flight.getRedundantBusinessClass());
            flightRespDTO.setRedundantFirstClass(flight.getRedundantFirstClass());
            flightRespDTOS.add(flightRespDTO);
        }
        return flightRespDTOS;
    }

    @Override
    public Flight findAccurateFlight(int id) {
        Flight flight = flightMapper.findAccurateFlight(id);
        return flight;
    }

    @Override
    public int getFlightAndTicket(String identity, String flightNum, String startPlace, String targetPlace, Date flightDate) {
        Ticket ticket = ticketMapper.getFlightAndTicket(identity,flightNum,startPlace,targetPlace,flightDate, TicketRemarkEnum.BIDDING.getRemark());
        if (ticket==null){
            return 0;
        }
        return 1;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public List solveExpiredFlight() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -1); //得到前一天的当前时间
        Date date = calendar.getTime();
        List<Flight> flights = flightMapper.getExpiredFlight(date);
        //System.out.println("过期航班有"+flights.size()+"个");
        //将这些delFlag置为0
        for (Flight flight:flights){
            flightMapper.expireFlight(flight.getId());
            priceService.getEventualRank(flight);
            //System.out.println("航班"+flight.getFlightNum()+"完成竞价升舱");
        }

        return flights;
    }

    @Override
    public List<String> getAirCompany() {
        List<String> airCompanys = airCompanyMapper.getAirCompany();
        return airCompanys;
    }

    @Override
    public Flight getFlight(String  airCompanyName,String flightNum, String startPlace, String targetPlace, Date flightDate) {
        Flight id = flightMapper.getFlight(airCompanyName,flightNum,startPlace,targetPlace,flightDate);
        return id;
    }

    @Override
    public List<ShowBidDTO> showBid(UserInfo userInfo) {
        //通过phone找ticket信息
        List<Ticket> tickets = ticketMapper.getTicket(userInfo.getIdentity(),userInfo.getUserName());

        List<Flight> flights = new ArrayList<>();
        List<Price> prices = new ArrayList<>();
        List<ShowBidDTO> showBidDTOS = new ArrayList<>();
        for (Ticket ticket:tickets){
            //通过ticket找航班
            Flight flight = flightMapper.getFlight(ticket.getAirCompanyName(),ticket.getFlightNum(),ticket.getStart(),ticket.getDestination(),ticket.getFlightTime());
            if (flight!=null){
//                flights.add(flight);
                //得到航班信息后 通过flightCode 和用户信息得到所有的竞价信息
                Price price = priceMapper.findPrice(null,flight.getFlightCode(),userInfo.getPhone());
                if (price!=null){
//                    prices.add(price);
                    ShowBidDTO showBidDTO = new ShowBidDTO();
                    showBidDTO.setBidClass(price.getBerthClass());
                    showBidDTO.setFlight(flight);
                    showBidDTO.setPrice(price.getPrice());
                    showBidDTO.setRank(priceService.rank(userInfo.getPhone(),price.getBerthClass(),flight.getFlightCode()));
                    showBidDTOS.add(showBidDTO);
                }
            }
        }

        return showBidDTOS;
    }


}
