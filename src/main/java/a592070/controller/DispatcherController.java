package a592070.controller;

import config.StompPrincipal;
import global.Constant;
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
import utils.SpringBeanUtil;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Map;
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
    public String fontAttractionIndex(){
        return "a592070/font/attractionInfo";
    }

    @RequestMapping("/travelSet/index")
    public String fontTravelSetIndex(){
        return "a592070/font/travelSetInfo";
    }
    @RequestMapping({"/travelSet/detail/{id}", "/travelSet/detail"})
    public String fontTravelSetIndex(@PathVariable(value = "id", required = false) Integer id, Model model){
        if(id != null && id.intValue() != 0) model.addAttribute("id", id);
        return "a592070/font/travelSetDetail";
    }


    @RequestMapping("/admin/broadcastMessage")
    public String backBroadcastMessage(){
        return "a592070/broadcastMessage";
    }






    @Autowired@Qualifier("sendMailService")
    SendMailService sendMailService;

    @RequestMapping("/testmail")
    public String send(HttpSession session, HttpServletRequest request) throws ExecutionException, InterruptedException, UnknownHostException {
        String recipients = "a592070@gmail.com";
        String title = "TEST MAIL";
        String content = "<table>" +
                "<tr><th>123</th><th>456</th></tr>" +
                "<tr><td>qwe</td><td>abc</td></tr>" +
                "</table>";
        String urlDisplay = "景點內容";
        String url = "/attraction/index";
        System.out.println(Thread.currentThread().getName());

        // 異步發送MAIL
        sendMailService.asyncSend(recipients, title, content, urlDisplay, url, session);

        return "UserIndex";
    }
    @RequestMapping("/testmail2")
    public String send2(HttpSession session, HttpServletRequest request) throws ExecutionException, InterruptedException, UnknownHostException {
        String recipients = "a592070@gmail.com";
        String title = "TEST MAIL";
        String content = "<table>" +
                "<tr><th>123</th><th>456</th></tr>" +
                "<tr><td>qwe</td><td>abc</td></tr>" +
                "</table>";
        String urlDisplay = "景點內容";
        String url = "/attraction/index";
        System.out.println(Thread.currentThread().getName());

//        System.out.println(InetAddress.getLoopbackAddress().getHostAddress());
//        System.out.println(InetAddress.getLoopbackAddress().getHostName());
//        System.out.println(InetAddress.getLoopbackAddress().getCanonicalHostName());
//        System.out.println(InetAddress.getLocalHost().getHostAddress());
//        System.out.println(InetAddress.getLocalHost().getHostName());
//        System.out.println(InetAddress.getLocalHost().getCanonicalHostName());

        // 異步發送MAIL
//        sendMailService.asyncSend(recipients, title, content, urlDisplay, url, session);

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
    public String notifyTest2(HttpSession session, HttpServletRequest request){
        notifyService.addSingleNotify(new NotifyVO(NotifyVO.STATUS_SUCCESS, "test2", "content2"), NotifyUtil.notifyUserName(session));
        return "發送個人消息";
    }
    @Autowired
    private ServletContext context;
    @RequestMapping("/testnotify3")
    public String notifyTest3(HttpSession session, HttpServletRequest request){
//        ServletContext servletContext = SpringBeanUtil.getServletContext();
        Map<String, StompPrincipal> users = (Map<String, StompPrincipal>) context.getAttribute(Constant.STOMP_USERS);
        if(users != null) users.forEach((k, v) -> System.out.println(k+"======>"+v));
        return "UserIndex";
    }
}
