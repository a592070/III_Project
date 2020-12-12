package a592070.controller;

import global.pojo.NotifyVO;
import global.service.NotifyService;
import global.service.SendMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import utils.NotifyUtil;

import javax.servlet.http.HttpSession;
import java.util.concurrent.ExecutionException;

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
    public String send(HttpSession session) throws ExecutionException, InterruptedException {
        String recipients = "a592070@gmail.com";
        String title = "TEST MAIL";
        String content = "hihi 你好";
        System.out.println(Thread.currentThread().getName());

        // 異步發送MAIL
        sendMailService.asyncSend(recipients, title, content, session);

        return "UserIndex";
    }


    @Autowired
    NotifyService notifyService;

    @RequestMapping("/testnotify")
    @ResponseBody
    public String notifyTest(){
        notifyService.addBroadcastNotify(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test1", "content1"));
        return "發送廣播消息";
    }
    @RequestMapping("/testnotify2")
    @ResponseBody
    public String notifyTest2(HttpSession session){
        notifyService.addSingleNotify(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test2", "content2"), NotifyUtil.notifyUserName(session));
        return "發送個人消息";
    }
}
