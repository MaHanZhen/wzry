package com.ssm.wzry.controller;

import com.ssm.wzry.po.ArticleCustom;
import com.ssm.wzry.po.ArticleSelectVo;
import com.ssm.wzry.po.ZoneCustom;
import com.ssm.wzry.po.ZoneSelectVo;
import com.ssm.wzry.service.ArticleService;
import com.ssm.wzry.service.ZoneService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.awt.*;
import java.util.List;

@Controller
public class IndexController {


    @Autowired
    private ZoneService zoneService;


    @Autowired
    private ArticleService articleService;

    private static Logger logger=Logger.getLogger(IndexController.class);

    @RequestMapping("index")
    public String index(ArticleSelectVo articleSelectVo, Model model) throws Exception {

        List<ZoneCustom> zoneCustoms = zoneService.queryAllZone();

        Integer zoneId ;
        ArticleCustom articleCustom = articleSelectVo.getArticleCustom();
        if (articleCustom ==null || articleCustom.getZoneid() == null) {
            zoneId = zoneCustoms.get(0).getZoneid();

            articleCustom = new ArticleCustom();
            articleCustom.setZoneid(zoneId);
            articleSelectVo.setArticleCustom(articleCustom);

        }else{
            zoneId = articleCustom.getZoneid();
        }

        int pageCount = articleService.getPageCount(articleCustom.getZoneid());

        if( articleSelectVo.getPage() ==0){
            articleSelectVo.setPage(1);
        }

        logger.debug(articleSelectVo);

        List<ArticleCustom> articleCustoms = articleService.queryArticleByZoneId(articleSelectVo);


        model.addAttribute("articleCustoms",articleCustoms);
        model.addAttribute("pageNo",articleSelectVo.getPageNo());
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("zoneId",zoneId);
        model.addAttribute("zones",zoneCustoms);
        return "index";
    }
}
