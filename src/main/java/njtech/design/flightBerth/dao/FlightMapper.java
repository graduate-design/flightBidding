package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.Flight;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
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
    int insertSelective(Flight record);
    /**
     * 根据主键查询一条用户数据
     * @param id
     * @return
     */
    Flight selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 根据主键更新一条用户数据，可以不完整 -
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Flight record);

    /**
     * 查询所有用户数据
     * @return
     */
    List<Flight> selectFlightList();
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
    List<Flight> findByPage(HashMap<String,Object> map);
}
