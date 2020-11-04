package a592070.controller;

import a592070.pojo.RegionDO;
import a592070.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller@Lazy
public class RegionController {
    @Autowired@Qualifier("regionService")
    private RegionService service;

    @RequestMapping("/admin/list.Region")
    public void listRegion(){
        List<RegionDO> list = service.list();
    }
}
