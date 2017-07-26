package com.ssm.wzry.po;

public class IndexSelectVo {

    public static final int A_PAGE_LENGTH = 5;

    private Integer zoneId;

    private Integer page;

    private Integer pageNow;

    private int pageCount;

    private int begin;

    private String title;


    private int articleCount;

    private int todayArticleCount;


    public int getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(int articleCount) {
        this.articleCount = articleCount;
    }

    public int getTodayArticleCount() {
        return todayArticleCount;
    }

    public void setTodayArticleCount(int todayArticleCount) {
        this.todayArticleCount = todayArticleCount;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getZoneId() {
        return zoneId;
    }

    public void setZoneId(Integer zoneId) {
        this.zoneId = zoneId;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }
}
