package njtech.design.flightBerth.enums;

public enum AuthorityEnum {
    MANAGER(1,"管理员"),
    VIP(2,"VIP"),
    MEMBER(3,"会员");

    int authorityCode;
    String authorityName;

    AuthorityEnum(int a,String authorityName){
        this.authorityCode = a;
        this.authorityName = authorityName;
    }

    public String getAuthorityName(){
        return authorityName;
    }

    public int getAuthorityCode(){
        return authorityCode;
    }

}
