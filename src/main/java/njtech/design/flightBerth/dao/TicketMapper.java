package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.Ticket;
import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

    /**
     * 升舱后添加机票信息
     * @param ticket
     * @return
     */
    int insertTicket(Ticket ticket);

    /**
     * 用户机票信息
     * @param identity
     * @param userName
     * @return
     */
    List<Ticket> getTicket(@Param("identity") String identity, @Param("userName") String userName);

    Ticket findTicket(@Param("id")int id);

    int solveExpiredTicket(@Param("flightTime")Date flightTime);


    /**
     * 管理员
     */
    /**
     * 根据主键删除一条用户数据
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);
    /**
     * 插入一条用户数据 ，可以不完整
     * @param record
     * @return
     */
    int insertSelective(Ticket record);
    /**
     * 根据主键查询一条用户数据
     * @param id
     * @return
     */
    Ticket selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 根据主键更新一条用户数据，可以不完整 -
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Ticket record);

    /**
     * 查询所有用户数据
     * @return
     */
    List<Ticket> selectTicketList();
    /**
     * 查询用户记录总数
     * @return
     */
    int selectCount();
    /**
     * 分页操作，调用findByPage limit分页方法
     * @param map
     * @return
     */
    List<Ticket> findByPage(HashMap<String,Object> map);

}
