package com.ssm.wzry.dao;

import com.ssm.wzry.po.Article;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer articleid);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer articleid);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);
}