package njtech.design.flightBerth.service.impl;

import com.mysql.cj.util.StringUtils;
import lombok.extern.slf4j.Slf4j;
import njtech.design.flightBerth.dao.UserMapper;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean findUser(String phone, String psd) {
        int count = userMapper.findUser(phone,psd);
        if (count==1){
            return true;
        }
        return false;
    }

    @Override
    public boolean userIsRemark(String phone) {
        String remark = userMapper.userIsRemark(phone);
        if ("未认证".equals(remark)){
            return false;
        }
        return true;
    }

    @Override
    public int userInfoSupplement(String phone, String realName, String identity, String sex) {
        int count = userMapper.userInfoSupplement(phone,realName,identity,sex);

        return count;
    }

    @Override
    public UserInfo getUser(String phone) {
        UserInfo userInfo = userMapper.getUser(phone);
        return userInfo;
    }

    @Override
    public int register(UserInfo user) {
        return userMapper.register(user);
    }

    @Override
    public UserInfo login(String phone, String password) {
        return userMapper.login(phone,password);
    }


}
