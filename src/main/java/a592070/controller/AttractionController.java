package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;
import a592070.pojo.AttractionVO;
import a592070.service.AttractionService;
import a592070.service.ViewService;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import utils.PageSupport;
import utils.StringUtil;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
@Lazy
public class AttractionController {

    @Autowired
    private ServletContext context;

    private static final int PAGE_SIZE = 10;

    @Autowired@Qualifier("attractionService")
    private AttractionService service;
    @Autowired@Qualifier("attractionViewService")
    private ViewService<AttractionVO> viewService;

//    @RequestMapping("/admin/attraction")
//    public void attractionMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/WEB-INF/admin/a592070/attractionInfo02.jsp").forward(request, response);
//    }
//    @RequestMapping("/admin/attraction/detail")
//    public void attractionDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("/WEB-INF/admin/a592070/attractionDetail.jsp").forward(request, response);
//    }
//    @RequestMapping("/admin/attraction/detail/{id}")
//    public AttractionDO attractionDetail(@PathVariable("id") int id) {
//        return service.getEle(id);
//    }


    @RequestMapping("/admin/attraction/list/{page}")
    public Map<String, Object> getAttractionList(@PathVariable("page") int page){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalSize(viewService.getSize());
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list = viewService.list(pageSupport.getCurrentPage(), pageSupport.getPageSize());
        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/admin/attraction/list/{page}/{region}")
    public Map<String, Object> getAttractionListByRegion(@PathVariable("page") int page,
                                                        @PathVariable("region") String region,
                                                        @RequestParam(name="sortColumn", required = false) String sortColumn,
                                                        @RequestParam(name = "order", required = false) String order){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        if(StringUtil.isEmpty(sortColumn) || "sn".equals(sortColumn)) {
            sortColumn = AttractionFiledName.ATTRACTION_ID;
        }else if("name".equals(sortColumn)){
            sortColumn = AttractionFiledName.ATTRACTION_NAME;
        }else if("address".equals(sortColumn)){
            sortColumn = AttractionFiledName.ATTRACTION_ADDRESS;
        }

        boolean desc;
        if(StringUtil.isEmpty(order) || "ascending".equals(order)){
            desc = false;
        }else{
            desc = true;
        }
        if(StringUtil.isEmpty(region) || "all".equals(region)) region = "";

        pageSupport.setTotalSize(viewService.getSizeByRegion(region));
        List<AttractionVO> list = viewService.listByRegion(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, sortColumn, desc);

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/admin/attraction/list/{page}/{region}/{keywords}")
    public Map<String, Object> getAttractionListByKeywords(@PathVariable("page") int page,
                                                           @PathVariable(name="region", required = false) String region,
                                                           @PathVariable(name="keywords", required = false) String keywords,
                                                           @RequestParam(name="sortColumn", required = false) String sortColumn,
                                                           @RequestParam(name = "order", required = false) String order){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list;

        if(StringUtil.isEmpty(sortColumn) || "sn".equals(sortColumn)) {
            sortColumn = AttractionFiledName.ATTRACTION_ID;
        }else if("name".equals(sortColumn)){
            sortColumn = AttractionFiledName.ATTRACTION_NAME;
        }else if("address".equals(sortColumn)){
            sortColumn = AttractionFiledName.ATTRACTION_ADDRESS;
        }

        boolean desc;
        if(StringUtil.isEmpty(order) || "ascending".equals(order)){
            desc = false;
        }else{
            desc = true;
        }

        if(StringUtil.isEmpty(region) || "all".equals(region)) region = "";

        pageSupport.setTotalSize(viewService.getSizeByKeyWords(keywords, region));
        list = viewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords, region, sortColumn, desc);


        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/admin/attraction/entity/{id}")
    public Map<String, Object> getAttraction(@PathVariable(name = "id") int id){
        AttractionDO attractionDO = service.getEle(id);
        Map<String, Object> map = new HashMap<>();
        map.put("attractionData", attractionDO);

//        List<Integer> list = new ArrayList<>();
//        attractionDO.getAttractionPic().forEach(ele -> list.add(ele.getId()));

        map.put("attractionPic", attractionDO.getAttractionPic());
        return map;
    }


    @GetMapping("/admin/attraction/pic/{id}/{index}")
    public ResponseEntity<byte[]> getPicture(@PathVariable(name = "id") int id,
                                             @PathVariable(name = "index") int index){
        List<AttractionPictureDO> picture = (List<AttractionPictureDO>)viewService.getPictures(id);

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_JPEG);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity(picture.get(index).getPicture(), httpHeaders, HttpStatus.OK);

        return responseEntity;
    }

    @PostMapping("/admin/attraction/update/{id}")
    public boolean update(@PathVariable(name = "id") int id,
                              @RequestParam(name="file", required=false)MultipartFile[] multipartFile,
                              @RequestParam(name="removePicId", required = false) String picId,
                              @RequestParam(name="attractionData", required = false)String attractionData) {
        boolean flag = false;
        try {
            ObjectMapper mapper = new ObjectMapper();
            AttractionDO attractionDO = mapper.readValue(attractionData, AttractionDO.class);

            AttractionDO originDo = service.getEle(attractionDO.getSn());
            attractionDO.setAttractionPic(originDo.getAttractionPic());

            if(multipartFile != null || multipartFile.length!=0){
                for (MultipartFile file : multipartFile) {
                    AttractionPictureDO pictureDO = new AttractionPictureDO();
                    pictureDO.setPicture(file.getBytes());
                    pictureDO.setAttraction(attractionDO);

                    attractionDO.addPic(pictureDO);
                }
//                attractionDO.addPic(multipartFile.getBytes());
//                attractionDO.setPicture(multipartFile.getBytes());
                System.out.println("saveFile success");
            }

            int[] pics = mapper.readValue(picId, int[].class);
            for (int i : pics) {
                attractionDO.getAttractionPic().removeIf(ele -> ele.getId() == i);
            }

            service.update(attractionDO);

            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }
    @PostMapping("/admin/attraction/status/{id}")
    public boolean switchStatus(@PathVariable(name = "id") int id){
        boolean flag = false;
        try {
            AttractionDO ele = service.getEle(id);
            ele.setStatus(!ele.getStatus());
            service.update(ele);

            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    @PostMapping("/admin/attraction/delete/{id}")
    public boolean delete(@PathVariable(name = "id") int id){
        boolean flag = false;
        try{
            service.delete(id);
            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }


}
