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

    /**
     * 生成模板，模板路徑resources/templates/
     * ex. templateFileName = mail (templates/mail.html)
     *
     * @param title         信件內容標題，可以使用html標籤，ex. <strong>title</strong>
     * @param content       信件內容，可以使用html標籤，ex. <p>content</p>
     * @param urlDisplay    信件url顯示名稱
     * @param url           信件url
     * @return
     */
    public String generateMailHtml(String title, String content, String urlDisplay, String url) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("mailtitle", title);
        variables.put("mailtext", content);
        variables.put("urlDisplay", urlDisplay);
        variables.put("url", url);

        final String templateFileName = "mail"; //Name of the template file without extension

        String output = this.templateEngine.process(templateFileName, new Context(Locale.CHINESE, variables));
        return output;
    }
    public String generateMailHtml(String title, String content) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("mailtitle", title);
        variables.put("mailtext", content);

        final String templateFileName = "mail"; //Name of the template file without extension

        String output = this.templateEngine.process(templateFileName, new Context(Locale.CHINESE, variables));
        return output;
    }

    /**
     *
     * @param recipients    收件者
     * @param mailTemplate  mail模板，由MailUtil.generateMailHtml()生成，可以另外自定義模板
     * @return
     */
    @Async
    public Future<Boolean> sendEmail(String recipients, String mailTemplate){
        try {
            MimeMessage mimeMessage = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
            helper.setTo(recipients);
            helper.setSubject("Simple mail template");
            helper.setText(mailTemplate, true);

//            System.out.println(Thread.currentThread().getName());
            emailSender.send(mimeMessage);
            return new AsyncResult<Boolean>(true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new AsyncResult<Boolean>(false);
    }

}
