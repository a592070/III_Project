package utils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class MailUtil {
    private Configuration cfg;

    private TemplateEngine templateEngine;
    private JavaMailSender emailSender;


    public void injectTemplate(String title, String content) throws IOException, TemplateException {
        /* ------------------------------------------------------------------------ */
        /* You should do this ONLY ONCE in the whole application life-cycle:        */

        /* Create and adjust the configuration singleton */
//        Configuration cfg = new Configuration(Configuration.VERSION_2_3_29);
//        cfg.setDirectoryForTemplateLoading(new File("/where/you/store/templates"));
//        // Recommended settings for new projects:
//        cfg.setDefaultEncoding("UTF-8");
//        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
//        cfg.setLogTemplateExceptions(false);
//        cfg.setWrapUncheckedExceptions(true);
//        cfg.setFallbackOnNullLoopVariable(false);

        /* ------------------------------------------------------------------------ */
        /* You usually do these for MULTIPLE TIMES in the application life-cycle:   */

        /* Create a data-model */
        Map root = new HashMap();
        root.put("title", title);
        root.put("content", content);

        /* Get the template (uses cache internally) */
        Template temp = cfg.getTemplate("MailTemplate.html");

        /* Merge data-model with template */
        Writer out = new OutputStreamWriter(System.out);
        temp.process(root, out);
        // Note: Depending on what `out` is, you may need to call `out.close()`.
        // This is usually the case for file output, but not for servlet output.
    }

    public String generateMailHtml(String title, String content) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("mailtitle", title);
        variables.put("mailtext", content);

        final String templateFileName = "MailTemplate"; //Name of the template file without extension
        String output = this.templateEngine.process(templateFileName, new Context(Locale.getDefault(), variables));

        return output;
    }

    public void sendEmail(String recipients, String title, String content){
        MimeMessageHelper helper = new MimeMessageHelper(emailSender.createMimeMessage());

        try {
            helper.setTo(recipients);
            helper.setSubject("Simple mail template");
            helper.setText(generateMailHtml(title, content), true);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
