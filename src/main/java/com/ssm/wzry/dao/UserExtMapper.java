package com.ssm.wzry.dao;

import com.ssm.wzry.po.UserCustom;
import com.ssm.wzry.po.UserSelectVo;

import java.util.List;

public interface UserExtMapper extends UserMapper {

    public Integer selectCountByUserName(UserSelectVo user) throws Exception;

    public Integer insertUserByUserSelectVo(UserSelectVo user) throws Exception;

    public UserCustom queryUserByNameAndPass(UserSelectVo user) throws Exception;

    public Integer updateStatusByUserId(UserSelectVo user) throws Exception;

    public Integer updateUser(UserSelectVo user) throws Exception;


    public List<UserCustom> queryUserByLoginStatus() throws Exception;
}
