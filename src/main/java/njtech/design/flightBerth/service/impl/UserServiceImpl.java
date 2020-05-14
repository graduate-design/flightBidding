package njtech.design.flightBerth.service.impl;

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
//        System.out.println(phone+ " "+psd);
        int count = userMapper.findUser(phone,psd);
//        System.out.println("-----------------");
        if (count==1){
            return true;
        }
        return false;
    }
}
