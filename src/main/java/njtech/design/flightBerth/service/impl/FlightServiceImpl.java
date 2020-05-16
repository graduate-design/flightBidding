package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.FlightMapper;
import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.dto.FlightDTO;
import njtech.design.flightBerth.entity.dto.FlightRespDTO;
import njtech.design.flightBerth.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;

    @Autowired
    private TicketMapper ticketMapper;

    @Override
    public List<FlightRespDTO> findFlight(String airCompanyName, String flightNum,  Date startDate) {
        List<Flight> flights = flightMapper.findFlight(airCompanyName, flightNum, startDate);
        List<FlightRespDTO> flightRespDTOS = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Flight flight:flights){
            FlightRespDTO flightRespDTO = new FlightRespDTO();
            flightRespDTO.setId(flight.getId());
            flightRespDTO.setAirCompanyName(flight.getAirCompanyName());
            flightRespDTO.setFlightNum(flight.getFlightNum());
            flightRespDTO.setFlightDate(sdf.format(flight.getFlightDate()));
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for (Flight flight:flights){
            FlightRespDTO flightRespDTO = new FlightRespDTO();
            flightRespDTO.setId(flight.getId());
            flightRespDTO.setAirCompanyName(flight.getAirCompanyName());
            flightRespDTO.setFlightNum(flight.getFlightNum());
            flightRespDTO.setFlightDate(sdf.format(flight.getFlightDate()));
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
        int count = ticketMapper.getFlightAndTicket(identity,flightNum,startPlace,targetPlace,flightDate);
        return count;
    }
}
