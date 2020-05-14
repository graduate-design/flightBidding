package njtech.design.flightBerth.service;

import njtech.design.flightBerth.entity.Flight;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FlightService {
    /**
     * 根据已有信息查询是否是可竞价航班
     * @param airCompanyName
     * @param flightNum
     * @param startDate
     * @return
     */
    List<Flight> findFlight(String airCompanyName, String flightNum,  Date startDate);

    List<Flight> findAll(Date date);
}
