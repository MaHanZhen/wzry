package com.ssm.wzry.po;

import java.util.Date;

public class UserArticleLike {
    private Integer likeid;

    private Integer articleid;

    private Integer userid;

    private Date liketime;

    public Integer getLikeid() {
        return likeid;
    }

    public void setLikeid(Integer likeid) {
        this.likeid = likeid;
    }

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Date getLiketime() {
        return liketime;
    }

    public void setLiketime(Date liketime) {
        this.liketime = liketime;
    }
}