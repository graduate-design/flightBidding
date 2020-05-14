package njtech.design.flightBerth.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.regex.Pattern;

@Data
public class Flight{
    //id
    private int id;
    //航班信息编码
    private String flightCode;
    //航空公司编码
    private String airCompanyCode;

    //航空公司名称
    private String airCompanyName;

    //航班号
    private String flightNum;
    //起飞日期
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date flightDate;
    //商务舱空位
    private int redundantBusinessClass;
    //头等舱空位
    private int redundantFirstClass;

    private short delFlag;


}
