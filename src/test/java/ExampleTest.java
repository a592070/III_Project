import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import example.service.UserService;

public class ExampleTest {
    private static ApplicationContext beans;
    @BeforeClass
    public static void init(){
        beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");
    }
    @AfterClass
    public static void close(){
        ((ConfigurableApplicationContext)beans).close();
    }

    @Test
    public void test2(){
        UserService service = beans.getBean("userService", UserService.class);
        service.doSomething();
    }
}
