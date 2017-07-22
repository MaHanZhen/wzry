package com.ssm.wzry.service;

import com.ssm.wzry.po.ArticleCustom;
import com.ssm.wzry.po.ArticleSelectVo;

import java.util.List;

public interface ArticleService  {

    public int insertArticle(ArticleSelectVo articleSelectVo) throws Exception;

    public List<ArticleCustom> queryArticleByZoneId(ArticleSelectVo articleSelectVo) throws Exception;

    public Integer getPageCount(Integer zoneId) throws Exception;
}
