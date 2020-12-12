package global.service;

import global.pojo.NotifyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Service;

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

    private int i;

    private List<NotifyVO> broadcastNotifies = Collections.synchronizedList(new LinkedList<>());
    private List<NotifyVO> singleNotifies = Collections.synchronizedList(new LinkedList<>());
//    private List<NotifyVO> broadcastNotifies = new LinkedList<>();
//    private List<NotifyVO> singleNotifies = new LinkedList<>();


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
                    iterator.remove();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
    public void sendSingleNotifies(String userName){
        taskExecutor.execute(() -> {
            try {
                Thread.sleep(3000);
                Iterator<NotifyVO> iterator = singleNotifies.iterator();
                while (iterator.hasNext()){
                    NotifyVO next = iterator.next();
                    next.setDate(new Date());
                    simpMessagingTemplate.convertAndSendToUser(userName, "/topic/notify", next);
                    iterator.remove();
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
