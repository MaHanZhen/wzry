package com.ssm.wzry.dao;

import com.ssm.wzry.po.CommentReply;

public interface CommentReplyMapper {
    int deleteByPrimaryKey(Integer replyid);

    int insert(CommentReply record);

    int insertSelective(CommentReply record);

    CommentReply selectByPrimaryKey(Integer replyid);

    int updateByPrimaryKeySelective(CommentReply record);

    int updateByPrimaryKey(CommentReply record);
}