package utils;

import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;

public class SpringBeanUtil {

    @Autowired
    private ServletContext context;

    public ServletContext getServletContext(){
        return context;
    }

}
