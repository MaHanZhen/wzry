package com.ssm.wzry.dao;

import com.ssm.wzry.po.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleExtMapper extends ArticleMapper{

    public Integer insertArticle(ArticleSelectVo articleSelectVo) throws Exception;

    public List<ArticleCustom> selectArticleByZoneId(IndexSelectVo indexSelectVo) throws Exception;

    public Integer selectArticleCountByZoneIdAndTitle(IndexSelectVo indexSelectVo) throws Exception;

    public Integer getArticleCount( String date) throws Exception;

    public Integer updateArticleReadCountByArticleId(Integer articleId) throws Exception;


    public ArticleCustom queryArticleDetailByArticleId( Integer articleId) throws Exception;


    public List<CommentCustom> queryCommentByArticleId( Integer articleId) throws Exception;

    public int updateLikeCountByArticleId(int articleId) throws Exception;



    public List<CommentReplyCustom> queryCommentReplyByArticleId(Integer articleId) throws Exception;


    public Integer updateArticleCommentCountByArticleId(Integer articleId) throws Exception;
}
