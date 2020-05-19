package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
