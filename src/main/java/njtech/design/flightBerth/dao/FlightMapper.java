package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.Flight;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FlightMapper {

    /**
     * 根据航班已有信息查询所有信息
     * @param airCompanyName
     * @param flightNum
     * @param flightDate
     * @return
     */
    List<Flight> findFlight(@Param("airCompanyName")String airCompanyName, @Param("flightNum") String flightNum,
                            @Param("startDate")Date flightDate);

    /**
     * 查询所有没过期的可竞价航班
     * @return
     */
//    List<Flight> findAll();

    Flight findAccurateFlight(@Param("flightId") int id);

    List<Flight> getExpiredFlight(@Param("date") Date date);

    void expireFlight(@Param("id") int flight);

    /**
     * 返回flight的id
     * @param airCompanyName
     * @param flightNum
     * @param startPlace
     * @param targetPlace
     * @param flightDate
     * @return
     */
    Flight getFlight(@Param("airCompanyName")String airCompanyName,@Param("flightNum")String flightNum,
                  @Param("startPlace") String startPlace,@Param("targetPlace") String targetPlace,@Param("flightDate") Date flightDate);
}
