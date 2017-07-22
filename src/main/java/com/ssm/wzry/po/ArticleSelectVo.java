package com.ssm.wzry.po;

public class ArticleSelectVo {

    public static final int PAGE_LENGTH=5;

    private ArticleCustom articleCustom;

    private UserCustom userCustom;

    private int page;

    private int begin;

    private int end;

    private int pageNo;

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {

        if(page <= 1){
            // 0,1,2,3,4
            setPageNo(1);
            setBegin(0);
//            setEnd(PAGE_LENGTH);
        }else{
            setPageNo(page);
            setBegin((page-1)*PAGE_LENGTH);
//            setEnd((page)*PAGE_LENGTH);
        }
        this.page = page;
    }

    public static int getPageLength() {
        return PAGE_LENGTH;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public ArticleCustom getArticleCustom() {
        return articleCustom;
    }

    public void setArticleCustom(ArticleCustom articleCustom) {
        this.articleCustom = articleCustom;
    }

    public UserCustom getUserCustom() {
        return userCustom;
    }

    public void setUserCustom(UserCustom userCustom) {
        this.userCustom = userCustom;
    }
}
