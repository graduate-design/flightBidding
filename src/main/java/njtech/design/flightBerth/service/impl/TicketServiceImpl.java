package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.PageBean;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.plaf.synth.SynthScrollBarUI;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketMapper ticketMapper;


    @Override
    public int insertTicket(Ticket ticket) {
        int row = ticketMapper.insertTicket(ticket);
        return row;
    }

    @Override
    public List<Ticket> getTicket(String identity, String userName) {
        List<Ticket> tickets = ticketMapper.getTicket(identity,userName);
        return tickets;
    }

    @Override
    public Ticket findTicket(int id) {
        return ticketMapper.findTicket(id);
    }

    @Override
    public int solveExpiredTicket() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -1); //得到前一天的当前时间
        Date date = calendar.getTime();
//        System.out.print("后台时间为"+date);
        int row = ticketMapper.solveExpiredTicket(date);
//        System.out.println("已修改过期机票"+row+"张");
        return row;
    }


    /**
     * 管理
     */
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return ticketMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Ticket record) {

        return ticketMapper.insertSelective(record);
    }

    @Override
    public Ticket selectByPrimaryKey(Integer id) {

        return ticketMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Ticket record) {
        return ticketMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<Ticket> selectTicketList() {

        return ticketMapper.selectTicketList();
    }

    @Override
    public int selectCount() {
        return ticketMapper.selectCount();
    }


    @Override
    public PageBean<Ticket> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Ticket> pageBean = new PageBean<Ticket>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = ticketMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Ticket> lists = ticketMapper.findByPage(map);
        pageBean.setLists(lists);

        return pageBean;
    }

}
