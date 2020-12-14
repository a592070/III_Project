package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import static a592070.fieldenum.AttractionFiledName.*;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.service.AttractionService;
import a592070.service.ViewService;
import global.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import utils.IOUtils;
import utils.PageSupport;
import utils.StringUtil;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@Lazy
public class AttractionFrontController {
    @Autowired
    private ServletContext servletContext;

    private static final int PAGE_SIZE = 30;

    @Autowired@Qualifier("attractionService")
    private AttractionService service;
    @Autowired@Qualifier("attractionViewService")
    private ViewService<AttractionVO> viewService;


    @RequestMapping("/attraction/list/{page}")
    public Map<String, Object> getAttractionList(@PathVariable("page") int page){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalSize(viewService.getSizeWithStatus(true));
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list = viewService.listWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), true);
        Map<String, Object> map = new HashMap<>();

        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/attraction/list/{page}/{region}")
    public Map<String, Object> getAttractionListByRegion(@PathVariable("page") int page,
                                                         @PathVariable("region") String region,
                                                         @RequestParam(name="sortColumn", required = false) String sortColumn,
                                                         @RequestParam(name = "order", required = false) String order){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        if(StringUtil.isEmpty(sortColumn) || "sn".equals(sortColumn)) {
            sortColumn = ATTRACTION_ID;
        }else if("name".equals(sortColumn)){
            sortColumn = ATTRACTION_NAME;
        }else if("address".equals(sortColumn)){
            sortColumn = ATTRACTION_ADDRESS;
        }

        boolean desc;
        if(StringUtil.isEmpty(order) || "ascending".equals(order)){
            desc = false;
        }else{
            desc = true;
        }
        if(StringUtil.isEmpty(region) || "all".equals(region)) region = "";

        pageSupport.setTotalSize(viewService.getSizeByRegionWithStatus(region, true));
        List<AttractionVO> list = viewService.listByRegionWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, true, sortColumn, desc);

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/attraction/list/{page}/{region}/{keywords}")
    public Map<String, Object> getAttractionListByKeywords(@PathVariable("page") int page,
                                                           @PathVariable(name="region") String region,
                                                           @PathVariable(name="keywords") String keywords,
                                                           @RequestParam(name="sortColumn", required = false) String sortColumn,
                                                           @RequestParam(name = "order", required = false) String order){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list;

        if(StringUtil.isEmpty(sortColumn) || "sn".equals(sortColumn)) {
            sortColumn = ATTRACTION_ID;
        }else if("name".equals(sortColumn)){
            sortColumn = ATTRACTION_NAME;
        }else if("address".equals(sortColumn)){
            sortColumn = ATTRACTION_ADDRESS;
        }

        boolean desc;
        if(StringUtil.isEmpty(order) || "ascending".equals(order)){
            desc = false;
        }else{
            desc = true;
        }

        if(StringUtil.isEmpty(region) || "all".equals(region)) region = "";

        pageSupport.setTotalSize(viewService.getSizeByKeyWordsWithStatus(keywords, region, true));
        list = viewService.listByKeyWordsWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords, true, region, sortColumn, desc);


        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/attraction/entity/{id}")
    public Map<String, Object> getAttraction(@PathVariable(name = "id") Integer id) {
        AttractionDO attractionDO = service.getEleWithStatus(id, true, AttractionService.getFromDatabase, true);

        Map<String, Object> map = new HashMap<>();
        try{
            map.put("attractionData", attractionDO);
            // /assets/attraction/xxx
            String destPrefix = Constant.ATTRACTION_PIC_URL + File.separator +attractionDO.getSn();
            map.put("attractionPic", service.listPictureDest(attractionDO, destPrefix, servletContext));
        }catch (Exception e){
            e.printStackTrace();
        }

        return map;
    }


}
