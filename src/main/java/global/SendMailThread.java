package global;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import utils.MailUtil;

public class SendMailThread implements Runnable {
    @Autowired
    @Qualifier("MailUtil")
    MailUtil mailUtil;

    @Override
    public void run() {
    }
}
