package njtech.design.flightBerth.service;

import njtech.design.flightBerth.entity.UserInfo;

public interface UserService {
    boolean findUser(String phone,String psd);

    boolean userIsRemark(String phone);

    int userInfoSupplement(String phone,String realName,String identity,String sex);

    UserInfo getUser(String phone);

     int register(UserInfo user);

     UserInfo login(String username,String password);

    /**
     * 验证手机是否被注册过
     * @param phone
     * @return
     */
     int findPhone(String phone);

    /**
     * 验证邮箱是否被注册过
     * @param email
     * @return
     */
     int findEmail(String email);

     int findIdentity(String identity);

    boolean modify(UserInfo user,String phone);

    boolean changePassword(String password,String phone);

    //注销
    int deleteUser(String phone);
}
