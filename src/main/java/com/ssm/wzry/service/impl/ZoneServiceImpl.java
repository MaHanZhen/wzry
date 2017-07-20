package com.ssm.wzry.service.impl;

import com.ssm.wzry.dao.ZoneExtMapper;
import com.ssm.wzry.po.ZoneCustom;
import com.ssm.wzry.service.ZoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZoneServiceImpl implements ZoneService {

    @Autowired
    private ZoneExtMapper zoneExtMapper;

    public List<ZoneCustom> queryAllZone() throws Exception {
//        List<ZoneCustom> zoneCustoms;

        return zoneExtMapper.selectAllZone();
//        return null;
    }

}
