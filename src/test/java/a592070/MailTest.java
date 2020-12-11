package a592070;

import config.AppConfig;
import config.WebApplicationInitializer;
import global.SendMailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import utils.MailUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitConfig(classes = AppConfig.class)
public class MailTest {

    @Autowired@Qualifier("sendMailService")
    SendMailService sendMailService;

    @Test
    public void testMail(){
        String target = "410011233@gms.ndhu.edu.tw";
        String title = "TEST MAIL";
        String content = "hihi 你好";

        sendMailService.asyncSend(target, title, content);

    }
}
