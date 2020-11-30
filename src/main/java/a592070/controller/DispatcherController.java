package a592070.controller;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String travelSetMain(){
        return "a592070/travelSetInfo";
    }
}
