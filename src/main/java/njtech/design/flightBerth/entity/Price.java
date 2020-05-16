package njtech.design.flightBerth.entity;

import lombok.Data;

@Data
public class Price {
    //id
    private int id;
    //出价号
    private String priceCode;
    //出价价格
    private double price;
    //竞价的舱位(berth里面的code ：BusinessClass  和 FirstClass)
    private String berthClass;
    //出价人
    private String userCode;
    //出价人姓名
    private String userName;
    //航班信息id
    private String flightCode;
    //出价时间
    private String createTime;
    //备注
    private String remark;
    //是否删除
    private boolean delFlag;
}
