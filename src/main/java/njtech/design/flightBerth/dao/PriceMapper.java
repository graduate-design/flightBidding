package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Price;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.SuccessRank;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface PriceMapper {

    int insertPrice(Price price);

    int rank(@Param("user") String user,@Param("berthClass") String bidClass,@Param("flightCode") String flightCode);

    /**
     * 更改竞价
     * @param bidClass
     * @param price
     * @param flightCode
     * @param date
     * @param phone
     * @return
     */
    int updatePrice(@Param("berthClass")String bidClass, @Param("price")int price, @Param("flightCode")String flightCode, @Param("createDate") Date date, @Param("phone")String phone);

    Price findPrice(@Param("berthClass")String bidClass, @Param("flightCode")String flightCode,@Param("userCode")String phone);

    /**
     * 最终竞价成功的排名
     * @param flightCode
     * @param bidClass
     * @return
     */
    List<SuccessRank> getEventualRank(@Param("flightCode")String flightCode,@Param("bidClass") String bidClass);

    void updatePriceRemarkDelFlag(Price price);

    int removePrice(@Param("flightCode")String flightCode,@Param("phone")String phone,@Param("userName")String userName);


    /**
     * TODO 管理员
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
    int insertSelective(Price record);
    /**
     * 根据主键查询一条用户数据
     * @param id
     * @return
     */
    Price selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 根据主键更新一条用户数据，可以不完整 -
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Price record);

    /**
     * 查询所有用户数据
     * @return
     */
    List<Price> selectPriceList();
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
    List<Price> findByPage(HashMap<String,Object> map);
}
