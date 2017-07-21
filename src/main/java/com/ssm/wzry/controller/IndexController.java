package com.ssm.wzry.controller;

import com.ssm.wzry.po.ZoneCustom;
import com.ssm.wzry.po.ZoneSelectVo;
import com.ssm.wzry.service.ZoneService;
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

    @RequestMapping("index")
    public String index(ZoneSelectVo zoneSelectVo, Model model) throws Exception {

        List<ZoneCustom> zoneCustoms = zoneService.queryAllZone();

        ZoneCustom zoneCustom = zoneSelectVo.getZoneCustom();
        Integer zoneId;
        if (zoneCustom ==null ||zoneCustom.getZoneid() == null) {
            zoneId = zoneCustoms.get(0).getZoneid();
        }else{
            zoneId = zoneCustom.getZoneid();
        }

        model.addAttribute("zoneId",zoneId);
        model.addAttribute("zones",zoneCustoms);
        return "index";
    }
}
