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

@Controller@Lazy@Scope("session")
public class NotifyController {

    @Autowired
    private TaskScheduler taskScheduler;
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    private List<NotifyVO> notifies = new ArrayList<>();

    public NotifyController() {
        notifies.add(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test success", "content success"));
        notifies.add(new NotifyVO(NotifyVO.STATUS_WARNING, "test warning", "content warning"));
        notifies.add(new NotifyVO(NotifyVO.STATUS_ERROR, "test error", "content error"));
        notifies.add(new NotifyVO(NotifyVO.STATUS_OTHER, "test other", "content other"));
    }

    @PostConstruct
    private void broadcastTimePeriodically(){

        taskScheduler.scheduleAtFixedRate(new Runnable() {
            @Override
            public void run() {
                int i = 0;
                broadcastNotifies();
                notifies.remove(0);
                notifies.add(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test other"+i, "content other"+i));
                i++;
            }
        }, 5000);
    }

    private void broadcastNotifies(){
        notifies.forEach(ele -> {
            ele.setDate(new Date());
        });
        simpMessagingTemplate.convertAndSend("/topic/notify", notifies);
    }

}
