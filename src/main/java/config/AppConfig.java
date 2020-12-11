package config;

import freemarker.template.TemplateExceptionHandler;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

import java.io.File;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

@Configuration
//@ImportResource
@ImportResource({"classpath:springmvc.servlet.xml"})
@EnableWebMvc
@EnableAsync
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


    @Bean
    public ITemplateResolver templateResolver()
    {
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("templates/");
        templateResolver.setSuffix(".html");
        templateResolver.setTemplateMode(TemplateMode.HTML);

        return templateResolver;
    }
    @Bean
    public TemplateEngine templateEngine()
    {
        TemplateEngine templateEngine = new TemplateEngine();
        templateEngine.setTemplateResolver(this.templateResolver());

        return templateEngine;
    }

    @Bean
    public JavaMailSender javaMailSender() {
        String userMail = "funtaiwanproject@gmail.com";
        String password = "FunTaiwanProject!0";

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(userMail);
        mailSender.setPassword(password);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        return mailSender;
    }


    public Executor taskExecutor () {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        // 核心线程数3：线程池创建时候初始化的线程数
        executor.setCorePoolSize(3);
        // 最大线程数5：线程池最大的线程数，只有在缓冲队列满了之后才会申请超过核心线程数的线程
        executor.setMaxPoolSize(5);
        // 缓冲队列50：用来缓冲执行任务的队列
        executor.setQueueCapacity(50);
        // 允许线程的空闲时间60秒：当超过了核心线程数之外的线程在空闲时间到达之后会被销毁
        executor.setKeepAliveSeconds(60);
        // 线程池名的前缀：设置好了之后可以方便定位处理任务所在的线程池
        executor.setThreadNamePrefix("taskExecutor-");
        /*
        线程池对拒绝任务的处理策略：这里采用了CallerRunsPolicy策略，
        当线程池没有处理能力的时候，该策略会直接在 execute 方法的调用线程中运行被拒绝的任务；
        如果执行程序已关闭，则会丢弃该任务
         */
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        // 设置线程池关闭的时候等待所有任务都完成再继续销毁其他的Bean
        executor.setWaitForTasksToCompleteOnShutdown(true);
        // 设置线程池中任务的等待时间，如果超过这个时候还没有销毁就强制销毁，以确保应用最后能够被关闭，而不是阻塞住。
        executor.setAwaitTerminationSeconds(600);
        return executor;
    }

}
