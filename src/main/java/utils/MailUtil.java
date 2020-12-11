package utils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Component;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Future;

@Component("MailUtil")
public class MailUtil{

    @Autowired@Qualifier("templateEngine")
    private TemplateEngine templateEngine;
    @Autowired@Qualifier("javaMailSender")
    private JavaMailSender emailSender;


    public String generateMailHtml(String title, String content) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("mailtitle", title);
        variables.put("mailtext", content);

        final String templateFileName = "mail"; //Name of the template file without extension

        String output = this.templateEngine.process(templateFileName, new Context(Locale.CHINESE, variables));
        return output;
    }

    @Async
    public Future<Boolean> sendEmail(String recipients, String title, String content){
        try {
            MimeMessage mimeMessage = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
            helper.setTo(recipients);
            helper.setSubject("Simple mail template");
            helper.setText(generateMailHtml(title, content), true);

            System.out.println(Thread.currentThread().getName());
            emailSender.send(mimeMessage);
            return new AsyncResult<Boolean>(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AsyncResult<Boolean>(false);
    }

}
