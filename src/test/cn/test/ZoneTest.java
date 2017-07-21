package cn.test;


import com.ssm.wzry.dao.ZoneExtMapper;
import com.ssm.wzry.po.ZoneCustom;
import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

//使用Spring的测试
@RunWith(SpringJUnit4ClassRunner.class)
//得到webapplication的ioc容器
@WebAppConfiguration
//加入mvc和spring的配置文件
@ContextConfiguration(locations = {"classpath:config/spring/application-*.xml", "classpath:config/spring/Springmvc.xml"})

public class ZoneTest {
    static Logger logger = Logger.getLogger(ZoneTest.class);

    @Autowired
    private ZoneExtMapper zoneExtMapper;

//    @Test
    public void test() throws Exception{

       List<ZoneCustom> zoneCustoms= zoneExtMapper.selectAllZone();
        logger.debug(zoneCustoms);
//        Zone zone = zoneExtMapper.selectByPrimaryKey(1);
//        logger.debug(zone);
    }
}
