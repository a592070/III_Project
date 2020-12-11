package config;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
//@ImportResource
@ImportResource({"classpath:springmvc.servlet.xml"})
@EnableWebMvc
public class AppConfig {

    @Bean
    public ApplicationContextAware applicationContextAware(ApplicationContext context){
        return applicationContext -> {
            /**
             System.err.println("beans:");
             String[] beanNames = ctx.getBeanDefinitionNames();
             //Arrays.sort(beanNames);
             for (String beanName : beanNames) {
             System.err.println("---> " + beanName);
             }
             */
            System.out.println("Beans: " + context.getBeanDefinitionCount());
            System.out.println("==========- 啟動完成 -==========");
        };
    }

}
