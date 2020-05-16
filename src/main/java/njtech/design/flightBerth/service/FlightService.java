package njtech.design.flightBerth.service;

import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.dto.FlightRespDTO;
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
    List<FlightRespDTO> findFlight(String airCompanyName, String flightNum,  Date startDate);

    /**
     * 查询所有航班信息
     * @param date
     * @return
     */
    List<FlightRespDTO> findAll(Date date);

    /**
     * 根据id查找具体航班
     * @param id
     * @return
     */
    Flight findAccurateFlight(int id);

    int getFlightAndTicket(String identity,String flightNum,String startPlace,String targetPlace,Date flightDate);
}
