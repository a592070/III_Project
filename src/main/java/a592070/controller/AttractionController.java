package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;
import a592070.pojo.AttractionVO;
import a592070.service.AttractionService;
import a592070.service.ViewService;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import global.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import utils.IOUtils;
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
    public Map<String, Object> getAttraction(@PathVariable(name = "id") int id) {
        AttractionDO attractionDO = service.getEle(id);
        Map<String, Object> map = new HashMap<>();
        map.put("attractionData", attractionDO);
        // /assets/attraction/xxx
        String destPrefix = Constant.ATTRACTION_PIC_URL + File.separator +attractionDO.getSn();
        map.put("attractionPic", service.listPictureDest(attractionDO, destPrefix, context));

        return map;
    }


    @GetMapping("/attraction/pic/{id}/{fileName}")
    public ResponseEntity<byte[]> getPicture(@PathVariable(name = "id") Integer id,
                                             @PathVariable(name = "fileName") String fileName){
//        List<AttractionPictureDO> picture = (List<AttractionPictureDO>)viewService.getPictures(id);

        String path = Constant.ATTRACTION_PIC_PATH + File.separator + id + File.separator + fileName + ".jpg";
        String realPath = context.getRealPath(path);
        byte[] bytes = null;
        try {
            bytes = IOUtils.pathToByteArray(realPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_JPEG);
        httpHeaders.setCacheControl(CacheControl.noCache());
        ResponseEntity<byte[]> responseEntity = new ResponseEntity(bytes, httpHeaders, HttpStatus.OK);
        return responseEntity;
    }

    @PostMapping({"/admin/attraction/save/{id}", "/admin/attraction/save/", "/admin/attraction/save"})
    public Map<String, Object> save(@PathVariable(name = "id", required = false) Integer id,
                              @RequestParam(name="file", required=false)MultipartFile[] multipartFile,
                              @RequestParam(name="removePicId", required = false) String removePicId,
                              @RequestParam(name="attractionData", required = false)String attractionData) {
        Map<String, Object> map = new HashMap<>();
        try {
            ObjectMapper mapper = new ObjectMapper();
            AttractionDO attractionDO = mapper.readValue(attractionData, AttractionDO.class);
//            AttractionDO attractionDO = attractionData;
            if(id == null || id.intValue() == 0) {
                attractionDO.setSn(null);
            }else{
                // find from Persistence
                AttractionDO originDo = service.getEle(attractionDO.getSn(), true);
                if(originDo != null) attractionDO.setAttractionPic(originDo.getAttractionPic());
            }

            if(multipartFile != null || multipartFile.length!=0){
                for (MultipartFile file : multipartFile) {
                    service.addPicture(attractionDO, file.getBytes());
                }
            }

            Integer[] pics = mapper.readValue(removePicId, Integer[].class);
            for (Integer i : pics) {
                service.removePicture(attractionDO, i, context);
//                attractionDO.getAttractionPic().removeIf(ele -> ele.getId() == i);
            }

            attractionDO = service.save(attractionDO);

            System.out.println(attractionDO.getSn());

            map.put("attractionData", attractionDO);
            // /assets/attraction/xxx
            String destPrefix = Constant.ATTRACTION_PIC_URL + File.separator +attractionDO.getSn();
            map.put("attractionPic", service.listPictureDest(attractionDO, destPrefix, context));
            map.put("message", true);

            return map;
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", false);
        }
        return map;
    }


    @PutMapping("/admin/attraction/status/{id}")
    public boolean switchStatus(@PathVariable(name = "id") int id){
        boolean flag = false;
        try {
            AttractionDO ele = service.getEle(id);
            ele.setStatus(!ele.getStatus());
            service.save(ele);

            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }


    @DeleteMapping("/admin/attraction/delete/{id}")
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
