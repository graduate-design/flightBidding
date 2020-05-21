package njtech.design.flightBerth.entity.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Data
public class TicketDTO {
    private String airCompanyName;
    private String flightNum;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date flightDate;
    private int flightHour;
    private int flightMin;
    private String start;
    private String destination;
    private String berthClass;
//    private String gateNum;
//    private String seatNum;
}
