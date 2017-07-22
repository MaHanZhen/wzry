package com.ssm.wzry.service.impl;

import com.ssm.wzry.dao.ArticleExtMapper;
import com.ssm.wzry.po.ArticleCustom;
import com.ssm.wzry.po.ArticleSelectVo;
import com.ssm.wzry.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleExtMapper articleExtMapper;

    public int insertArticle(ArticleSelectVo articleSelectVo) throws Exception {
        return articleExtMapper.insertArticle(articleSelectVo);
    }

    public List<ArticleCustom> queryArticleByZoneId(ArticleSelectVo articleSelectVo) throws Exception{
        return articleExtMapper.selectArticleByZoneId(articleSelectVo);
    }

    public Integer getPageCount(Integer zoneId) throws Exception{
        int count = articleExtMapper.selectArticleCountByZoneId(zoneId);
        int pageCount ;
        if(count<=ArticleSelectVo.PAGE_LENGTH){
            pageCount = 1;
        }else{
            pageCount = count/ArticleSelectVo.PAGE_LENGTH+1;
        }

        return pageCount;
    }
}
