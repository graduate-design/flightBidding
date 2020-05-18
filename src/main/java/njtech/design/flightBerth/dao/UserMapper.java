package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.UserInfo;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {
    /**
     * 查询是否存在该用户
     * @param phone
     * @param psd
     * @return
     */
    int findUser(@Param("phone") String phone , @Param("psd")String psd);

    /**
     * 通过手机号查找用户是否认证身份信息，返回认证标记
     * @param p
     * @return
     */
    String userIsRemark(@Param("phone")String p);

    /**
     * 进行身份认证后增加个人信息
     * @param phone
     * @param realName
     * @param identity
     * @param sex
     * /*@param email
     * @return
     */
    int userInfoSupplement(@Param("phone") String phone,@Param("userName") String realName,@Param("identity") String identity,
                           @Param("sex") String sex/* ,@Param("email") String email*/);

    UserInfo getUser(@Param("phone")String phone);


    //注册
     int register(UserInfo user);
    //登录
    UserInfo login(@Param("phone") String phone, @Param("password") String password);



}
