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

    /**
     * 查询是否有与航班相关的购票信息
     * @param identity
     * @param flightNum
     * @param startPlace
     * @param targetPlace
     * @param flightDate
     * @return
     */
    int getFlightAndTicket(String identity,String flightNum,String startPlace,String targetPlace,Date flightDate);

    /**
     * 设置过期航班
     * @return
     */
    List<Flight> solveExpiredFlight();

    List<String> getAirCompany();


    /**
     * 得到可竞价航班Id
     * @param airCompanyName
     * @param flightNum
     * @param startPlace
     * @param targetPlace
     * @param flightDate
     * @return
     */
    Flight getFlight(String  airCompanyName,String flightNum,String startPlace,String targetPlace,Date flightDate);
}
