package com.ssm.wzry.dao;

import com.ssm.wzry.po.Zone;

public interface ZoneMapper {
    int deleteByPrimaryKey(Integer zoneid);

    int insert(Zone record);

    int insertSelective(Zone record);

    Zone selectByPrimaryKey(Integer zoneid);

    int updateByPrimaryKeySelective(Zone record);

    int updateByPrimaryKey(Zone record);
}