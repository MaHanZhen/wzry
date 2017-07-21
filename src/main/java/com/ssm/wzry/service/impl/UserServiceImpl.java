package com.ssm.wzry.service.impl;

import com.ssm.wzry.dao.UserExtMapper;
import com.ssm.wzry.exception.CustomException;
import com.ssm.wzry.po.User;
import com.ssm.wzry.po.UserCustom;
import com.ssm.wzry.po.UserSelectVo;
import com.ssm.wzry.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserExtMapper userExtMapper;
    public Integer insertUser(UserSelectVo user) throws Exception {

        Integer count = userExtMapper.selectCountByUserName(user);
        if(count>0){
            return 0;
        }

        //开始注册
        return userExtMapper.insertUserByUserSelectVo(user);

    }

    public UserCustom queryUserAndUpdateUserStatus(UserSelectVo userSelectVo) throws Exception {

        UserCustom userCustom =  userExtMapper.queryUserByNameAndPass(userSelectVo);
        if(userCustom==null){
            return null;
        }

        userCustom.setLoginstatus(1);

        userSelectVo.setUserCustom(userCustom);
        userExtMapper.updateStatusByUserId(userSelectVo);

        return userCustom;

    }

    public Integer updateUserStatus(UserCustom userCustom) throws Exception {

        UserSelectVo userSelectVo = new UserSelectVo();
        userCustom.setLoginstatus(0);
        userSelectVo.setUserCustom(userCustom);
        userExtMapper.updateStatusByUserId(userSelectVo);
        return null;
    }
}
