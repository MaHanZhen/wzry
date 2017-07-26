package com.ssm.wzry.service;

import com.ssm.wzry.po.UserCustom;
import com.ssm.wzry.po.UserSelectVo;

import java.util.List;

public interface UserService {

    public Integer insertUser(UserSelectVo user) throws Exception;

    public UserCustom queryUserAndUpdateUserStatus(UserSelectVo user) throws Exception;

    public Integer updateUserStatus(UserCustom user) throws Exception;

    public Integer updateUser(UserSelectVo user) throws Exception;

    public List<UserCustom> queryLoginStatusUser() throws Exception;

}
