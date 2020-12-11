package global;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import utils.MailUtil;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

@Service("sendMailService")
public class SendMailService{
    @Autowired
    @Qualifier("MailUtil")
    MailUtil mailUtil;

    @Autowired@Qualifier("taskExecutor")
    Executor taskExecutor;

    public void asyncSend(String recipients, String title, String content){
        taskExecutor.execute(() -> {
            try {
                System.out.println("發送MAIL: "+recipients+"===========>"+mailUtil.sendEmail(recipients, title, content).get());
            } catch (InterruptedException | ExecutionException e) {
                e.printStackTrace();
            }
        });
    }

}
