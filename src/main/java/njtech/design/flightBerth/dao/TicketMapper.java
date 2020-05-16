package njtech.design.flightBerth.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public interface TicketMapper {

    /**
     * 根据身份信息和航班信息查找订票信息
     * @param identity
     * @param flightNum
     * @param startPlace
     * @param targetPlace
     * @param flightDate
     * @return
     */
    int getFlightAndTicket(@Param("identity") String identity, @Param("flightNum") String flightNum,
                           @Param("startPlace") String startPlace,@Param("targetPlace") String targetPlace,@Param("flightDate")@DateTimeFormat(pattern = "yyyy-MM-dd") Date flightDate);

}
