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
}
