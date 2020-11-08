import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import example.service.UserService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:springmvc.servlet.xml")
public class ExampleTest {
    private static ApplicationContext beans;
//    private Logger logger = Logger.getLogger("org.hibernate.type.descriptor.sql.BasicBinder");
//    @BeforeClass
//    public static void init(){
//        beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");
//    }
//    @AfterClass
//    public static void close(){
//        ((ConfigurableApplicationContext)beans).close();
//    }

    @Autowired
    private UserService service;
    @Test
    public void test2(){
//        UserService service = beans.getBean("userService", UserService.class);
        service.doSomething2(5);
    }
}
