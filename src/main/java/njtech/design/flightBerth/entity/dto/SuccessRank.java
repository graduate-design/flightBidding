package njtech.design.flightBerth.entity.dto;

import lombok.Data;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

@Data
public class SuccessRank {
    //编号
    private int id;
    //排名
    private int ranking;
    //价格
    private double price;
    //竞价舱位
    private String bidClass;
    //航班号
    private String flightNum;
    //起飞时间
    private Date flightDate;
    //出价人姓名
    private String userName;
    //出价人联系方式
    private String phone;
    //出价人身份证
    private String identity;
    //出价人邮箱
    private String email;
}
