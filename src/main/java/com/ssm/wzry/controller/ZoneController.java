package com.ssm.wzry.controller;

import com.ssm.wzry.service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZoneController {


    @Autowired
    private ZoneService zoneService;

    @RequestMapping("index")
    public String index(Model model) throws Exception{
       model.addAttribute("zones",zoneService.queryAllZone());
       return "index";
    }
}
