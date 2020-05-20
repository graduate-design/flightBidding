package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.plaf.synth.SynthScrollBarUI;
import java.util.Calendar;
import java.util.Date;
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
        System.out.print("后台时间为"+date);
        int row = ticketMapper.solveExpiredTicket(date);
        System.out.println("已修改过期机票"+row+"张");
        return row;
    }
}
