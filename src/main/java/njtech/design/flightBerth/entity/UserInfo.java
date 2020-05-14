package njtech.design.flightBerth.entity;

import lombok.Data;

@Data
public class UserInfo {
    //ID
    private int id;
    //用户编码
    private String userCode;
    //姓名
    private String userName;
    //性别
    private String userSex;
    //年龄
    private int userAge;


    //联系电话
    private String phone;
    //身份信息
    private String identity;
    //权限等级
    private int authority;
    //备注
    private String remark;
    //密码
    private String password;

    //邮箱
    private String email;

}
