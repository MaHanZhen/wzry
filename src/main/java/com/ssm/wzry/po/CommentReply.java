package com.ssm.wzry.po;

import java.util.Date;

public class CommentReply {
    private Integer replyid;

    private Integer userid;

    private Integer commentid;

    private String replycontent;

    private Date replytime;

    private String replyername;

    public Integer getReplyid() {
        return replyid;
    }

    public void setReplyid(Integer replyid) {
        this.replyid = replyid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getReplycontent() {
        return replycontent;
    }

    public void setReplycontent(String replycontent) {
        this.replycontent = replycontent == null ? null : replycontent.trim();
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    public String getReplyername() {
        return replyername;
    }

    public void setReplyername(String replyername) {
        this.replyername = replyername == null ? null : replyername.trim();
    }
}