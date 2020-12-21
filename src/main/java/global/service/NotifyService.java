package global.service;

import config.StompPrincipal;
import global.Constant;
import global.aspect.NotifyAspect;
import global.pojo.NotifyVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;

@Service("notifyService")
public class NotifyService {
    @Autowired
    private TaskScheduler taskScheduler;
    @Autowired@Qualifier("taskExecutor")
    Executor taskExecutor;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    @Autowired
    private ServletContext context;

    Logger logger = LoggerFactory.getLogger(NotifyAspect.class);

    private int i;

    private List<NotifyVO> broadcastNotifies = Collections.synchronizedList(new LinkedList<>());
    private List<NotifyVO> singleNotifies = Collections.synchronizedList(new LinkedList<>());
//    private List<NotifyVO> broadcastNotifies = new LinkedList<>();
//    private List<NotifyVO> singleNotifies = new LinkedList<>();


    public Set<StompPrincipal> getBroadcastUsers(){
        return (Set<StompPrincipal>)context.getAttribute(Constant.STOMP_USERS);
    }

    /**
     * 增加一筆廣播訊息，添加後會由NotifyAspect實現發送訊息
     * @param notify 訊息
     */
    public void addBroadcastNotify(NotifyVO notify){
        broadcastNotifies.add(notify);
    }

    /**
     * 增加一筆個人廣播訊息，添加後會由NotifyAspect實現發送訊息
     * @param notify    訊息
     * @param userName  使用NotifyUtil.notifyUserName(HttpSession session)的回傳值
     */
    public void addSingleNotify(NotifyVO notify, String userName){
        singleNotifies.add(notify);
    }


    
    public void sendBroadcastNotifies(){
        taskExecutor.execute(() -> {
            try {
                Thread.sleep(3000);

                Iterator<NotifyVO> iterator = broadcastNotifies.iterator();
                while (iterator.hasNext()){
                    NotifyVO next = iterator.next();
                    next.setDate(new Date());
                    simpMessagingTemplate.convertAndSend("/topic/notify", next);
                    logger.info("=======廣播訊息已發送=======:\n"+next);
                    iterator.remove();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
    public void sendSingleNotifies(NotifyVO value, String userName){
        taskExecutor.execute(() -> {
            try {
                long time = System.currentTimeMillis();
                while(true){
                    Object stompUsers = context.getAttribute(Constant.STOMP_USERS);
                    if(stompUsers != null){
                        Set<StompPrincipal> users = ( Set<StompPrincipal>) stompUsers;
                        StompPrincipal stompPrincipal = users.stream().filter(ele -> ele.getName().equals(userName)).findFirst().orElse(null);
                        if(stompPrincipal != null) {
                            value.setDate(new Date());
                            simpMessagingTemplate.convertAndSendToUser(userName, "/topic/notify", value);
                            logger.info("=======私人訊息已發送=======目標:"+userName+"\n"+value);
                            break;
                        }
                    }
                    Thread.sleep(3000);
                    // more than 1 minute giveup send message
                    if(System.currentTimeMillis() > time+(1*60*1000)) {
                        logger.info("=======私人訊息已逾時=======目標:"+userName+"\n"+value);
                        break;
                    }

//                    Iterator<NotifyVO> iterator = singleNotifies.iterator();
//                    while (iterator.hasNext()){
//                        NotifyVO next = iterator.next();
//                        next.setDate(new Date());
//                        simpMessagingTemplate.convertAndSendToUser(userName, "/topic/notify", next);
//                        iterator.remove();
//                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }


    public List<NotifyVO> getBroadcastNotifies() {
        return broadcastNotifies;
    }
    public List<NotifyVO> getSingleNotifies() {
        return singleNotifies;
    }
}
