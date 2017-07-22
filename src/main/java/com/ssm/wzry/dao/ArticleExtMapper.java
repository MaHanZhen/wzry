package com.ssm.wzry.dao;

import com.ssm.wzry.po.ArticleCustom;
import com.ssm.wzry.po.ArticleSelectVo;

import java.util.List;

public interface ArticleExtMapper extends ArticleMapper{

    public Integer insertArticle(ArticleSelectVo articleSelectVo) throws Exception;

    public List<ArticleCustom> selectArticleByZoneId(ArticleSelectVo articleSelectVo) throws Exception;

    public Integer selectArticleCountByZoneId(Integer zoneId) throws Exception;
}
