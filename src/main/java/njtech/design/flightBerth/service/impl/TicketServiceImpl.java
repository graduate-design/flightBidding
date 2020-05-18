package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketMapper ticketMapper;


    @Override
    public int insertTicket(Ticket ticket) {
        int row = ticketMapper.insertTicket(ticket);
        return row;
    }
}
