package njtech.design.flightBerth.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Ticket {
    //id
    private int id;
    //购票信息编码
    private String ticCode;
    //乘客身份信息、姓名
    private String userName;

    private String identity;
    //购票方式 是否为折扣票 1为折扣购票 0e为非折扣购票
    private int buyWay;
    //航空公司名称
    private String airCompanyName;
    //航班号
    private String flightNum;
    //起飞地
    private String start;
    //目的地
    private String destination;
    //预计登机时间
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date flightTime;
    //起飞日期
    @JsonFormat(pattern="yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date flightDate;
    //舱位等级名称
    private String berthName;
    //登机口
    private String gateNum;
    //座位号
    private String seatNum;
    //备注
    private String remark;
}
