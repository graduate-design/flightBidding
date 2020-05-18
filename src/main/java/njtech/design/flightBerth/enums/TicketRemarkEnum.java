package njtech.design.flightBerth.enums;

public enum  TicketRemarkEnum {
    BIDDING("进行中"),//ticket / price ：竞价中的
    EXPIRED("已过期"),//ticket / price ：航班竞价关闭并且没有竞价成功的
    SUCCEED("升舱后"),//ticket ：升舱后的购票信息
    SUCCESS("已升舱");// ticket ：以前的购票变为已升舱  price ：竞价中remark变为已升舱

    private String remark;

    TicketRemarkEnum(String remark){
        this.remark = remark;
    }

    public String getRemark(){
        return remark;
    }
}
