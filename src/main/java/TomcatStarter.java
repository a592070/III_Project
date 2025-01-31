import ch.qos.logback.classic.servlet.LogbackServletContextListener;
import ch.qos.logback.classic.spi.LoggerContextListener;
import ch.qos.logback.ext.spring.web.LogbackConfigListener;
import org.apache.catalina.ContainerListener;
import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.LifecycleListener;
import org.apache.catalina.connector.Connector;
import org.apache.catalina.startup.ContextConfig;
import org.apache.catalina.startup.Tomcat;
import org.apache.tomcat.util.descriptor.web.ApplicationParameter;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;

import javax.persistence.Embedded;
import javax.servlet.ServletException;
import java.io.File;

public class TomcatStarter {

    private static int port = 80;
    private static String contextPath = "/";

    public static void start() throws LifecycleException, ServletException {
        Tomcat tomcat = new Tomcat();

//        String basedDir = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        String basedDir = TomcatStarter.class.getProtectionDomain().getCodeSource().getLocation().getPath();
//        System.out.println(basedDir);
        String tmp = basedDir+"/";
        tomcat.setBaseDir(tmp);
        tomcat.setPort(port);

        tomcat.getServer();
        tomcat.getService();
        tomcat.getConnector();
        tomcat.getEngine();
        tomcat.getHost().setAppBase(tmp);

        Context context = tomcat.addWebapp(contextPath, tmp);
        context.setResponseCharacterEncoding("UTF-8");
        context.setRequestCharacterEncoding("UTF-8");


        ApplicationParameter parameter = new ApplicationParameter();
        parameter.setName("logbackConfigLocation");
        parameter.setValue("classpath:logback.xml");
        context.addApplicationParameter(parameter);
        context.addApplicationListener(LogbackConfigListener.class.getName());

//        System.out.println(LogbackConfigListener.class.getName());
//        context.addApplicationListener(ContextLoaderListener.class.getName());
//        System.out.println(ContextLoaderListener.class.getName());
//        context.addApplicationListener(RequestContextListener.class.getName());
//        System.out.println(RequestContextListener.class.getName());


        tomcat.enableNaming();
        Connector connector = tomcat.getConnector();
        connector.setURIEncoding("UTF-8");

        try{
            tomcat.start();
        }catch (Exception e){
            e.printStackTrace();
        }
        // 啟動線程進入等待狀態
        tomcat.getServer().await();
    }

    public static void main(String[] args) throws LifecycleException, ServletException, ClassNotFoundException {
        start();
    }

}
