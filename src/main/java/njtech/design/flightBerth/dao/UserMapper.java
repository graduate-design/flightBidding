package njtech.design.flightBerth.dao;

import njtech.design.flightBerth.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;


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

    int findPhone(@Param("phone")String phone);

    int findEmail(@Param("email")String email);

    UserInfo findIdentity(@Param("identity") String identity);

    int modify(UserInfo user,@Param("phone") String phone);
    //修改密码
    int changePassword(@Param("password") String password,@Param("phone") String phone);

    int deleteUser(@Param("phone") String phone);



    /**
     * 管理员
     */
    /**
     * 根据主键删除一条用户数据
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);
    /**
     * 插入一条用户数据 ，可以不完整
     * @param record
     * @return
     */
    int insertSelective(UserInfo record);
    /**
     * 根据主键查询一条用户数据
     * @param id
     * @return
     */
    UserInfo selectByPrimaryKey(@Param("id") Integer id);

    /**
     * 根据主键更新一条用户数据，可以不完整 -
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(UserInfo record);

    /**
     * 查询所有用户数据
     * @return
     */
    List<UserInfo> selectUserList();
    /**
     * 查询用户记录总数
     * @return
     */
    int selectCount();
    /**
     * 分页操作，调用findByPage limit分页方法
     * @param map
     * @return
     */
    List<UserInfo> findByPage(HashMap<String,Object> map);
}
