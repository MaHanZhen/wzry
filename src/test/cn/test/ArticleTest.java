package cn.test;

import com.ssm.wzry.dao.ArticleExtMapper;
import com.ssm.wzry.po.ArticleCustom;
import com.ssm.wzry.po.ArticleSelectVo;
import com.ssm.wzry.po.UserCustom;
import com.ssm.wzry.po.UserSelectVo;
import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;
import java.util.List;

//使用Spring的测试
@RunWith(SpringJUnit4ClassRunner.class)
//得到webapplication的ioc容器
@WebAppConfiguration
//加入mvc和spring的配置文件
@ContextConfiguration(locations = {"classpath:config/spring/application-*.xml", "classpath:config/spring/Springmvc.xml"})

public class ArticleTest {
    static Logger logger = Logger.getLogger(UserTest.class);

    private static ArticleSelectVo articleSelectVo;

    private static UserCustom userCustom;

    private static ArticleCustom articleCustom;

    @Autowired
    private ArticleExtMapper articleExtMapper;

    @Before
    public void testBefore() throws Exception{
        articleSelectVo = new ArticleSelectVo();

        userCustom = new UserCustom();

        articleCustom = new ArticleCustom();

        articleSelectVo.setArticleCustom(articleCustom);
        articleSelectVo.setUserCustom(userCustom);
    }

//    @Test
    public void testInsertArticle() throws Exception{
//        `userId`, `posterName`, `zoneId`, `title`, `content`, `postTime`
        userCustom.setUserid(9);
        userCustom.setUsername("test");

        articleCustom.setZoneid(1);
        articleCustom.setTitle("this is title");
        articleCustom.setContent("duang duang duang");
        articleCustom.setPosttime(new Date());

        articleExtMapper.insertArticle(articleSelectVo);

        logger.debug("success");
    }

    @Test
    public void testSelectArticleByZoneId() throws Exception{


        articleCustom.setZoneid(1);


        List<ArticleCustom> articleCustoms = articleExtMapper.selectArticleByZoneId(articleSelectVo);

        logger.debug(articleCustoms);
    }
}
