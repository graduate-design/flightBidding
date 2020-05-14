package njtech.design.flightBerth.entity.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class FlightDTO {
    //航空公司名称
    private String airCompanyName;
    //航班号
    private String flightNum;
    //起始日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date startDate;


    //截至日期
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private Date endDate;
}
