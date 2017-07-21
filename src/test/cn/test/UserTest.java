package cn.test;

import com.ssm.wzry.dao.UserExtMapper;
import com.ssm.wzry.po.UserCustom;
import com.ssm.wzry.po.UserSelectVo;
import com.ssm.wzry.service.UserService;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


//使用Spring的测试
@RunWith(SpringJUnit4ClassRunner.class)
//得到webapplication的ioc容器
@WebAppConfiguration
//加入mvc和spring的配置文件
@ContextConfiguration(locations = {"classpath:config/spring/application-*.xml", "classpath:config/spring/Springmvc.xml"})

public class UserTest {

    static Logger logger = Logger.getLogger(UserTest.class);
    @Autowired
    private UserExtMapper userExtMapper;

    private static UserSelectVo userSelectVo;
    private static UserCustom userCustom;

    @Autowired
    private UserService userService;

    @Before
    public void testBefore() throws Exception{
        userSelectVo = new UserSelectVo();
        userCustom = new UserCustom();
        userSelectVo.setUserCustom(userCustom);
    }

//    @Test
    public void testSelectCountByUsername() throws Exception{
        userCustom.setUsername("admin");

        int count = userExtMapper.selectCountByUserName(userSelectVo);

        logger.debug(count);

    }

//    @Test
    public void testInsertUser() throws Exception{
        userCustom.setUsername("hashakikiki");
        userCustom.setUserpass("123");
//        userCustom.setEmail("duang@qq.com");
        userExtMapper.insertUserByUserSelectVo(userSelectVo);

    }

    @Test
    public void testQueryUserAndUpdateUserStatus() throws Exception{
        userCustom.setUsername("hasa");
        userCustom.setUserpass("pass");
        UserCustom custom = userService.queryUserAndUpdateUserStatus(userSelectVo);

        logger.debug(custom);
    }
}
