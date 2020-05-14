package njtech.design.flightBerth.entity;

import lombok.Data;

@Data
public class Berth {
    //id
    private int id;
    //舱位等级编码
    private String berthCode;
    //舱位等级名称
    private String berthName;
}
