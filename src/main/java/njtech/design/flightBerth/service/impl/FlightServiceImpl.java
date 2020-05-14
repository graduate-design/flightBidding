package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.FlightMapper;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightMapper flightMapper;

    @Override
    public List<Flight> findFlight(String airCompanyName, String flightNum,  Date startDate) {
        List<Flight> flights = flightMapper.findFlight(airCompanyName, flightNum, startDate);
        return flights;
    }

    @Override
    public List<Flight> findAll(Date date) {
        List<Flight> flights = flightMapper.findFlight(null, null, date);

        return flights;
    }
}
