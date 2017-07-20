package com.ssm.wzry.service;

import com.ssm.wzry.po.Zone;
import com.ssm.wzry.po.ZoneCustom;

import java.util.List;

public interface ZoneService {

    public List<ZoneCustom> queryAllZone() throws Exception;

}
