package njtech.design.flightBerth.service;

import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.PageBean;
import njtech.design.flightBerth.entity.Ticket;

import java.util.List;

public interface TicketService {

    int insertTicket(Ticket ticket);

    List<Ticket> getTicket(String identity,String userName);

    Ticket findTicket(int id);

    /**
     * 为了没有从接口中得到数据的机票信息 ，设置过期
     *
     * @return
     */
    int solveExpiredTicket();


    /***
     * 管理员
     */
    int deleteByPrimaryKey(Integer id);

    int insertSelective(Ticket record);

    Ticket selectByPrimaryKey(Integer id);


    List<Ticket> selectTicketList();

    int selectCount();

    int updateByPrimaryKeySelective(Ticket record);

    PageBean<Ticket> findByPage(int currentPage);
}
