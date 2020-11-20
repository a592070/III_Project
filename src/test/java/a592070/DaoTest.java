package a592070;

import a592070.dao.AttractionViewDAOImpl;
import a592070.dao.ViewDAO;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.service.AttractionViewServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:springmvc.servlet.xml")
public class DaoTest {
    private static ApplicationContext beans;


    @Test
    public void test1(){
        beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");
        AttractionViewServiceImpl service = beans.getBean("attractionViewService", AttractionViewServiceImpl.class);
        int sizeByKeywords = service.getSizeByKeyWords("5390");
        System.out.println(sizeByKeywords);
    }
}
