package a592070.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import global.SendMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.MailUtil;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

@Controller@Lazy
public class DispatcherController {
    @RequestMapping("/admin/attraction")
    public String attractionMain(){
        return "a592070/attractionInfo";
    }
    @RequestMapping({"/admin/attraction/detail/{id}", "/admin/attraction/detail"})
    public String attractionDetail(@PathVariable(value = "id", required = false) Integer id, Model model) {
        if(id != null && id.intValue() != 0) model.addAttribute("id", id);
        return "a592070/attractionDetail";
    }

    @RequestMapping({"/admin/travelSet"})
    public String test() {
        return "a592070/travelSetInfo02";
    }



    @RequestMapping("/attraction/index")
    public String fontIndex(){
        return "a592070/font/attractionInfo";
    }



    @Autowired@Qualifier("sendMailService")
    SendMailService sendMailService;

    @RequestMapping("/testmail")
    @ResponseBody
    public String send() throws ExecutionException, InterruptedException {
        String recipients = "a592070@gmail.com";
        String title = "TEST MAIL";
        String content = "hihi 你好";
        System.out.println(Thread.currentThread().getName());

        // 異步發送MAIL
        sendMailService.asyncSend(recipients, title, content);

        return "checked your email";
    }
}
