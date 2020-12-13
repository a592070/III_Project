package global;

import global.pojo.NotifyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.stereotype.Controller;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//@Controller
public class NotifyController {

    @Autowired
    private TaskScheduler taskScheduler;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    private int i;

    private List<NotifyVO> notifies = new ArrayList<>();

    public NotifyController() {
        i = 0;
        notifies.add(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test success", "content success"));
        notifies.add(new NotifyVO(NotifyVO.STATUS_WARNING, "test warning", "content warning"));
        notifies.add(new NotifyVO(NotifyVO.STATUS_ERROR, "test error", "content error"));
        notifies.add(new NotifyVO(NotifyVO.STATUS_OTHER, "test other", "content other"));
    }

    public synchronized void addNotify(String title, String content, String status){

    }

    @PostConstruct
    private void broadcastTimePeriodically(){
        taskScheduler.scheduleAtFixedRate(new Runnable() {
            @Override
            public void run() {
                broadcastNotifies();
            }
        }, 5000);
    }

    private void broadcastNotifies(){
        NotifyVO remove = notifies.remove(0);
        simpMessagingTemplate.convertAndSend("/topic/notify", remove);
        notifies.add(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test other"+i, "content other"+i));
        i++;
    }

}
