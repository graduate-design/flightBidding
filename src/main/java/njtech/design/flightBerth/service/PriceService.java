package njtech.design.flightBerth.service;

import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.PageBean;
import njtech.design.flightBerth.entity.Price;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.PriceDTO;

import java.util.List;

public interface PriceService {

    /**
     * 添加竞价信息,并返回排名
     * @param bidClass
     * @param price
     * @param flight
     * @param userInfo
     * @return
     */
    PriceDTO insertPrice(String bidClass, int price, Flight flight, UserInfo userInfo);

    int rank(String phone,String bidClass,String flightCode);

    PriceDTO updatePrice(String bidClass, int price, String flightCode, UserInfo userInfo);

    /**
     * 得到最终竞价成功的排名
     * @param flights
     */
    void getEventualRank(Flight flights);

    /**
     * 退出竞价
     * @param flight
     * @param userInfo
     */
    int removePrice(Flight flight,UserInfo userInfo);

    PriceDTO findPriceAndRank(String phone ,String flightCode);


    /**
     * 管理员
     */

    int deleteByPrimaryKey(Integer id);

    int insertSelective(Price record);

    Price selectByPrimaryKey(Integer id);


    List<Price> selectPriceList();

    int selectCount();

    int updateByPrimaryKeySelective(Price record);

    PageBean<Price> findByPage(int currentPage);

}
