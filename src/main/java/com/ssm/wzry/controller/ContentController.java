package com.ssm.wzry.controller;

import com.ssm.wzry.po.*;
import com.ssm.wzry.service.ArticleService;
import com.ssm.wzry.service.UserService;
import com.ssm.wzry.service.ZoneService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ContentController {


    @Autowired
    private ZoneService zoneService;


    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    private static Logger logger = Logger.getLogger(ContentController.class);

    @RequestMapping("index")
    public String index(IndexSelectVo indexSelectVo, Model model) throws Exception {

        List<ZoneCustom> zoneCustoms = zoneService.queryAllZone();

        if (indexSelectVo.getZoneId() == null) {
            indexSelectVo.setZoneId(zoneCustoms.get(0).getZoneid());
        }


        indexSelectVo.setPageCount(articleService.getPageCount(indexSelectVo));

        Integer page = indexSelectVo.getPage();
        if (page == null || page == 0) {
            indexSelectVo.setPage(1);
            indexSelectVo.setPageNow(1);
            indexSelectVo.setBegin(0);
        } else {
            indexSelectVo.setBegin((page-1) * IndexSelectVo.A_PAGE_LENGTH);
            indexSelectVo.setPageNow(page);
        }

        indexSelectVo.setArticleCount(articleService.getArticleCount());

        indexSelectVo.setTodayArticleCount(articleService.getTodayArticleCount());

        logger.debug(indexSelectVo);
        List<ArticleCustom> articleCustoms = articleService.queryArticleByZoneId(indexSelectVo);

        List<UserCustom> onLineUsers = userService.queryLoginStatusUser();

        model.addAttribute("zones", zoneCustoms);
        model.addAttribute("articleCustoms", articleCustoms);
        model.addAttribute("select", indexSelectVo);
        model.addAttribute("onLineUsers",onLineUsers);
        return "index";
    }

    @RequestMapping("detail")
    public String detail(int articleId, Model model) throws Exception{

        articleService.updateArticleReadCountByArticleId(articleId);

        ArticleCustom articleCustom = articleService.queryArticleDetailByArticleId(articleId);
        List<CommentCustom> commentCustoms = articleService.queryCommentByArticleId(articleId);
        List<CommentReplyCustom> commentReplyCustoms = articleService.queryCommentReplyByArticleId(articleId);

        model.addAttribute("comments",commentCustoms);
        model.addAttribute("article",articleCustom);
        model.addAttribute("commentReplies",commentReplyCustoms);
        return "article_detail";
    }

    @RequestMapping("userInfo")
    public String userInfo() throws Exception{
        return "user_info";
    }

    @RequestMapping("userPwd")
    public String userPwd() throws Exception{
        return "user_pwd";
    }
}
