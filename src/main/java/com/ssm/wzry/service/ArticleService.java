package com.ssm.wzry.service;

import com.ssm.wzry.po.*;

import java.util.List;

public interface ArticleService  {

    public int insertArticle(ArticleSelectVo articleSelectVo) throws Exception;

    public List<ArticleCustom> queryArticleByZoneId(IndexSelectVo indexSelectVo) throws Exception;

    public Integer getPageCount(IndexSelectVo indexSelectVo) throws Exception;

    public int getArticleCount() throws Exception;

    public int getTodayArticleCount() throws Exception;

    public int updateArticleReadCountByArticleId(int articleId) throws Exception;

    public ArticleCustom queryArticleDetailByArticleId(int articleId) throws Exception;

    public int updateLikeCountByArticleId(int articleId,int userId) throws Exception;

    public List<CommentCustom> queryCommentByArticleId(int articleId) throws Exception;

    public List<CommentReplyCustom> queryCommentReplyByArticleId(int articleId) throws Exception;

    public int insertComment(Comment comment) throws Exception;

    public int insertCommentReply(CommentReply commentReply) throws Exception;

    public int updateArticleCommentCountByArticleId(int articleId) throws Exception;
}
