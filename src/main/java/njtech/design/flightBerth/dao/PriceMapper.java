package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Price;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.SuccessRank;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface PriceMapper {

    int insertPrice(Price price);

    int rank(@Param("user") String user,@Param("berthClass") String bidClass);

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
}
