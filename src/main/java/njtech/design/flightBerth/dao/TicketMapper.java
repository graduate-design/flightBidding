package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.Ticket;
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
    Ticket getFlightAndTicket(@Param("identity") String identity, @Param("flightNum") String flightNum,
                              @Param("startPlace") String startPlace, @Param("targetPlace") String targetPlace,
                              @Param("flightDate")@DateTimeFormat(pattern = "yyyy-MM-dd") Date flightDate,@Param("remark")String remark);

    int updateTicketRemarkById(@Param("id")int id,@Param("remark")String remark);

    int insertTicket(Ticket ticket);
}
