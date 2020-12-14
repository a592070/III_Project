package a592070.controller;

import a592070.pojo.RegionDO;
import a592070.service.RegionService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@Lazy
public class RegionController {
    @Autowired@Qualifier("regionService")
    private RegionService service;

    @RequestMapping({"/admin/list.Region", "/list.Region"})
    public List<String> listRegion(){
        List<RegionDO> list = service.list();
        List<String> regions = new ArrayList<>();
        list.forEach(ele -> regions.add(ele.getRegion()));

        return regions;
    }
}
