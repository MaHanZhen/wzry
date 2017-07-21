package com.ssm.wzry.dao;

import com.ssm.wzry.po.UserArticleLike;

public interface UserArticleLikeMapper {
    int deleteByPrimaryKey(Integer likeid);

    int insert(UserArticleLike record);

    int insertSelective(UserArticleLike record);

    UserArticleLike selectByPrimaryKey(Integer likeid);

    int updateByPrimaryKeySelective(UserArticleLike record);

    int updateByPrimaryKey(UserArticleLike record);
}