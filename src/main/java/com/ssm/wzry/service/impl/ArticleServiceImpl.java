package com.ssm.wzry.service.impl;

import com.ssm.wzry.Utils;
import com.ssm.wzry.dao.ArticleExtMapper;
import com.ssm.wzry.dao.CommentMapper;
import com.ssm.wzry.dao.CommentReplyMapper;
import com.ssm.wzry.dao.UserArticleLikeMapper;
import com.ssm.wzry.po.*;
import com.ssm.wzry.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleExtMapper articleExtMapper;

    @Autowired
    UserArticleLikeMapper userArticleLikeMapper;

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    CommentReplyMapper commentReplyMapper;

    public int insertArticle(ArticleSelectVo articleSelectVo) throws Exception {
        return articleExtMapper.insertArticle(articleSelectVo);
    }

    public List<ArticleCustom> queryArticleByZoneId(IndexSelectVo indexSelectVo) throws Exception {
        return articleExtMapper.selectArticleByZoneId(indexSelectVo);
    }

    public Integer getPageCount(IndexSelectVo indexSelectVo) throws Exception {

        int count = articleExtMapper.selectArticleCountByZoneIdAndTitle(indexSelectVo);
        int pageCount;
        if (count <= IndexSelectVo.A_PAGE_LENGTH) {
            pageCount = 1;
        } else {
            pageCount = count / IndexSelectVo.A_PAGE_LENGTH + 1;
        }

        return pageCount;
    }

    public int getArticleCount() throws Exception {
        return articleExtMapper.getArticleCount(null);
    }

    public int getTodayArticleCount() throws Exception {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String date = format.format(new Date());
        return articleExtMapper.getArticleCount(date);
    }

    public int updateArticleReadCountByArticleId(int articleId) throws Exception {
        return articleExtMapper.updateArticleReadCountByArticleId(articleId);
    }

    public ArticleCustom queryArticleDetailByArticleId(int articleId) throws Exception {

        return articleExtMapper.queryArticleDetailByArticleId(articleId);
    }

    public int updateLikeCountByArticleId(int articleId,int userId) throws Exception {

        UserArticleLike userArticleLike = new UserArticleLike();
        userArticleLike.setArticleid(articleId);
        userArticleLike.setLiketime(new Date());
        userArticleLike.setUserid(userId);
        userArticleLikeMapper.insert(userArticleLike);

        return articleExtMapper.updateLikeCountByArticleId(articleId);
    }

    public List<CommentCustom> queryCommentByArticleId(int articleId) throws Exception {
        return articleExtMapper.queryCommentByArticleId(articleId);
    }

    public List<CommentReplyCustom> queryCommentReplyByArticleId(int articleId) throws Exception {
        return articleExtMapper.queryCommentReplyByArticleId(articleId);
    }

    public int insertComment(Comment comment) throws Exception {
        return commentMapper.insert(comment);
    }

    public int insertCommentReply(CommentReply commentReply) throws Exception {
        return commentReplyMapper.insert(commentReply);
    }

    public int updateArticleCommentCountByArticleId(int articleId) throws Exception {
        return articleExtMapper.updateArticleCommentCountByArticleId(articleId);
    }

}
