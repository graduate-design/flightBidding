package njtech.design.flightBerth.service;

import njtech.design.flightBerth.entity.UserInfo;

public interface UserService {
    boolean findUser(String phone,String psd);

    boolean userIsRemark(String phone);

    int userInfoSupplement(String phone,String realName,String identity,String sex);

    UserInfo getUser(String phone);

     int register(UserInfo user);

     UserInfo login(String username,String password);
}
