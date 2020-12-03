package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.pojo.TravelSetDO;
import a592070.pojo.TravelSetVO;
import a592070.service.AttractionService;
import a592070.service.TravelSetService;
import com.fasterxml.jackson.databind.ObjectMapper;
import global.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import utils.PageSupport;
import utils.StringUtil;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static a592070.service.TravelSetService.*;

@RestController
@Lazy
public class TravelSetController {
    @Autowired
    private ServletContext context;
    private static final int PAGE_SIZE = 10;

    @Autowired@Qualifier("travelSetService")
    private TravelSetService service;


    @RequestMapping("/admin/travelSet/list/{page}")
    public Map<String, Object> getTravelSetList(@PathVariable("page") Integer page){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalSize(service.getSize());
        pageSupport.setCurrentPage(page);

        List<TravelSetVO> list = service.listByRownum(pageSupport.getCurrentPage(), pageSupport.getPageSize());
        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }

    @RequestMapping("/admin/travelSet/list/{page}/{identity}/{keywords}")
    public Map<String, Object> getTravelSetListByKeywords(@PathVariable("page") Integer page,
                                                          @PathVariable(name="identity", required = false) Integer identity,
                                                          @PathVariable(name="keywords", required = false) String keywords,
                                                           @RequestParam(name="sortColumn", required = false) String sortColumn,
                                                           @RequestParam(name = "order", required = false) String order){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List<TravelSetVO> list;

        if(StringUtil.isEmpty(sortColumn) || "sn".equals(sortColumn)) {
            sortColumn = SN;
        }else if("name".equals(sortColumn)){
            sortColumn = NAME;
        }else if("createdUser".equals(sortColumn)){
            sortColumn = CREATED_USER;
        }else if("createdTime".equals(sortColumn)){
            sortColumn = CREATED_TIME;
        }else if("updateTime".equals(sortColumn)){
            sortColumn = UPDATE_TIME;
        }else if("priority".equals(sortColumn)){
            sortColumn = PRIORITY;
        }else if("status".equals(sortColumn)){
            sortColumn = AVAILABLE;
        }

        boolean desc;
        if(StringUtil.isEmpty(order) || "ascending".equals(order)){
            desc = false;
        }else{
            desc = true;
        }


        pageSupport.setTotalSize(service.getSizeBySelect(identity, keywords));

        list = service.listBySelect(pageSupport.getCurrentPage(), pageSupport.getPageSize(), identity, keywords, sortColumn, desc);

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }

    @RequestMapping("/admin/travelSet/entity/{id}")
    public Map<String, Object> getTravelSet(@PathVariable(name = "id") Integer id) {
        TravelSetDO travelSetDO = service.getEle(id, true);

        Map<String, Object> map = new HashMap<>();
        map.put("travelSetData", travelSetDO);
        map.put("travelSetAttractions", travelSetDO.getTravelAttractions());
        map.put("travelSetCars", travelSetDO.getTravelCars());
        map.put("travelSetHotels", travelSetDO.getTravelHotels());
        map.put("travelSetRestaurants", travelSetDO.getTravelRestaurants());

        return map;
    }

    @PostMapping({"/admin/travelSet/save/{id}", "/admin/travelSet/save/", "/admin/travelSet/save"})
    public Map<String, Object> save(@PathVariable(name = "id", required = false) Integer id,
                                    @RequestParam(name="travelSetData", required = false)String travelSetData) {
        Map<String, Object> map = new HashMap<>();
        try {
            ObjectMapper mapper = new ObjectMapper();
            TravelSetDO travelSetDO = mapper.readValue(travelSetData, TravelSetDO.class);

            if(id == null || id.intValue() == 0) {
                travelSetDO = service.addTravelSet(travelSetDO);
            }else{
                travelSetDO = service.updateTravelSet(travelSetDO);
            }


            map.put("travelSetData", travelSetDO);
            map.put("message", true);

            return map;
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", false);
        }
        return map;
    }


    @PutMapping("/admin/travelSet/status/{id}")
    public boolean switchStatus(@PathVariable(name = "id") Integer id){
        boolean flag = false;
        try {
            service.switchTravelSetAvailable(id);

            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }


    @DeleteMapping("/admin/travelSet/delete/{id}")
    public boolean delete(@PathVariable(name = "id") Integer id){
        boolean flag = false;
        try{
            flag = service.deleteTravelSet(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
