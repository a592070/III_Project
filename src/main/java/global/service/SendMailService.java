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
     * @param title         信件內容標題，可以使用html標籤，ex. <strong>title</strong>
     * @param content       信件內容，可以使用html標籤，ex. <p>content</p>
     * @param urlDisplay    url 顯示名稱
     * @param url           url
     */
    public void asyncSend(String recipients, String title, String content, String urlDisplay, String url, HttpSession session){
        String mailHtml = mailUtil.generateMailHtml(title, content, urlDisplay, url);
        asyncSend(recipients, mailHtml, session);
    }
    public void asyncSend(String recipients, String title, String content, HttpSession session){
        String mailHtml = mailUtil.generateMailHtml(title, content);
        asyncSend(recipients, mailHtml, session);
    }
    public void asyncSend(String recipients, String mailTemplate, HttpSession session){
        taskExecutor.execute(() -> {
            try {
                System.out.println("發送MAIL: "+recipients+"===========>"+mailUtil.sendEmail(recipients, mailTemplate).get());
                notifyService.addSingleNotify(successNotify, NotifyUtil.notifyUserName(session));
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        });
    }

}
