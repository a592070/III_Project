package global.service;

import global.pojo.NotifyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import utils.MailUtil;
import utils.NotifyUtil;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

@Service("sendMailService")
public class SendMailService{
    @Autowired
    @Qualifier("MailUtil")
    MailUtil mailUtil;

    @Autowired@Qualifier("taskExecutor")
    Executor taskExecutor;

    @Autowired
    NotifyService notifyService;

    private NotifyVO successNotify;
    private NotifyVO failedNotify;

    public SendMailService() {
        successNotify = new NotifyVO(NotifyVO.STATUS_SUCCESS, "email通知", "已發送email，請檢查信箱，如果沒發現請檢查垃圾郵件。");
        failedNotify = new NotifyVO(NotifyVO.STATUS_ERROR, "email通知", "未能成功發送email，請確認信箱地址。");
    }

    /**
     * 異步發送mail，並發送結果訊息給前台
     * @param recipients    收件者
     * @param title         標題
     * @param content       內容
     */
    public void asyncSend(String recipients, String title, String content, HttpSession session){
        taskExecutor.execute(() -> {
            try {
                System.out.println("發送MAIL: "+recipients+"===========>"+mailUtil.sendEmail(recipients, title, content).get());
                notifyService.addSingleNotify(successNotify, NotifyUtil.notifyUserName(session));
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        });
    }

}
