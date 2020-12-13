package global.aspect;


import ch.qos.logback.classic.LoggerContext;
import global.pojo.NotifyVO;
import global.service.NotifyService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.thymeleaf.spring5.util.SpringSelectedValueComparator;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;

@Component
@Aspect
public class NotifyAspect {

//    LoggerContext loggerFactory = (LoggerContext) LoggerFactory.getILoggerFactory();
    Logger logger = LoggerFactory.getLogger(NotifyAspect.class);

    @Pointcut(value = "execution(* global.service.NotifyService.addBroadcastNotify(global.pojo.NotifyVO)) && args(value)")
    private void addBroadcastNotifyMethod(NotifyVO value){}

    @Pointcut(value = "execution(* global.service.NotifyService.addSingleNotify(global.pojo.NotifyVO, String)) && args(value, userName)")
    private void addSingleNotifyMethod(NotifyVO value, String userName){}

    @Pointcut("bean(notifyService)")
    private void isNotifyService(){}

    @Before("addBroadcastNotifyMethod(value) && isNotifyService()")
    public void beforeNotify(JoinPoint joinPoint, NotifyVO value) {
        logger.info("BroadcastNotifies收到通知: "+value);
    }
    /**
     * Signature getSignature();	獲取封裝了署名信息的對象,在該對像中可以獲取到目標方法名,所屬類的Class等信息
     * Object[] getArgs();	獲取傳入目標方法的參數對象
     * Object getTarget();	獲取被代理的對象
     * Object getThis();	獲取代理對象
     *
     * @param joinPoint
     * @param value
     */
//    @After("execution(* global.service.NotifyService.addNotify(global.pojo.NotifyVO)) && args(value)")
    @After("addBroadcastNotifyMethod(value) && isNotifyService()")
    public void afterAdviceBroadcastNotifies(JoinPoint joinPoint, NotifyVO value) {
        NotifyService notifyService = (NotifyService) joinPoint.getTarget();

        notifyService.sendBroadcastNotifies();

        logger.info("BroadcastNotifies已發送通知: "+value.toString());
    }
    @After("addSingleNotifyMethod(value, userName) && isNotifyService()")
    public void afterAdviceSingleNotifies(JoinPoint joinPoint, NotifyVO value, String userName) {
        NotifyService notifyService = (NotifyService) joinPoint.getTarget();

        notifyService.sendSingleNotifies(userName);

        logger.info("SingleNotifies已發送通知: "+userName+"==>"+value.toString());
    }
}
