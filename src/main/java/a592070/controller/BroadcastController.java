package a592070.controller;

import config.StompPrincipal;
import global.pojo.NotifyVO;
import global.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import utils.NotifyUtil;
import utils.StringUtil;

import java.util.Map;

@RestController
public class BroadcastController {

    @Autowired@Qualifier("notifyService")
    private NotifyService notifyService;

    @RequestMapping("/broadcast/users")
    public Map<String, StompPrincipal>  getBroadcastUsers(){
        Map<String, StompPrincipal> broadcastUsers = notifyService.getBroadcastUsers();
        return broadcastUsers;
    }

    @PostMapping({"/broadcast/receive/{user}", "/broadcast/receive/"})
    public boolean receiveMessage(@PathVariable(value = "user", required = false) String user, Integer status, String title, String content){
        String sStatus;
        switch (status){
            case 1:
                sStatus = NotifyVO.STATUS_SUCCESS;
                break;
            case 2:
                sStatus = NotifyVO.STATUS_WARNING;
                break;
            case 3:
                sStatus = NotifyVO.STATUS_ERROR;
                break;
            default:
                sStatus = NotifyVO.STATUS_OTHER;
                break;
        }

        if(!StringUtil.isEmpty(user)){
            notifyService.addSingleNotify(NotifyUtil.setNotify(sStatus, title, content), user);
        }else{
            notifyService.addBroadcastNotify(NotifyUtil.setNotify(sStatus, title, content));
        }
        return true;
    }



}
