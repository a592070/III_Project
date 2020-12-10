import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.connector.Connector;
import org.apache.catalina.startup.Tomcat;

import javax.servlet.ServletException;

public class TomcatStarter {

    private static int port = 8080;
    private static String contextPath = "/";

    public static void start() throws LifecycleException, ServletException {
        Tomcat tomcat = new Tomcat();

        String basedDir = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        System.out.println(basedDir);
        tomcat.setBaseDir(basedDir);
        tomcat.setPort(port);

        Context context = tomcat.addWebapp(contextPath, basedDir);
        System.out.println(context.getPath());

        tomcat.enableNaming();
        Connector connector = tomcat.getConnector();

        tomcat.start();
        // 啟動線程進入等待狀態
        tomcat.getServer().await();
    }

    public static void main(String[] args) throws LifecycleException, ServletException, ClassNotFoundException {
        System.out.println(Class.forName("org.apache.jasper.servlet.JspServlet").getName());
        start();
    }

}
