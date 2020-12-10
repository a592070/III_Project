package global;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping({"/admin/index","/admin"})
    public String welcomePage(){
        return "index";
    }
    @RequestMapping(path = {"/FunTaiwan", "/", "/index", "/*"})
    public String UserIndex(){
        return "UserIndex";
    }
}
