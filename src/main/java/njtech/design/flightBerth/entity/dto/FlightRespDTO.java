package njtech.design.flightBerth.entity.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Data
public class FlightRespDTO {

    private int id;
    //航空公司名称
    private String airCompanyName;
    //航班号
    private String flightNum;
    //起始日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date flightDate;

    //商务舱空位
    private int redundantBusinessClass;
    //头等舱空位
    private int redundantFirstClass;
}
