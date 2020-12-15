package a592070.controller;

import config.StompPrincipal;
import global.pojo.NotifyVO;
import global.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import utils.NotifyUtil;
import utils.StringUtil;

import java.util.Map;
import java.util.Set;

@RestController
public class BroadcastController {

    @Autowired@Qualifier("notifyService")
    private NotifyService notifyService;

    @RequestMapping("/broadcast/users")
    public Set<StompPrincipal>  getBroadcastUsers(){
        Set<StompPrincipal> broadcastUsers = notifyService.getBroadcastUsers();
        return broadcastUsers;
    }

    @PostMapping({"/broadcast/publish/{user}", "/broadcast/publish"})
    public boolean publishMessage(
            @PathVariable(value = "user", required = false) String user,
            @RequestBody Map<String,Object> params){

        Integer status = (Integer) params.get("status");
        String title = (String) params.get("title");
        String message = (String) params.get("message");

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
            notifyService.addSingleNotify(NotifyUtil.setNotify(sStatus, title, message), user);
        }else{
            notifyService.addBroadcastNotify(NotifyUtil.setNotify(sStatus, title, message));
        }
        return true;
    }



}
