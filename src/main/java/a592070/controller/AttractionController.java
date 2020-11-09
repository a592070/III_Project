package a592070.controller;

import a592070.pojo.AttractionDO;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<AttractionVO> getAttractionListByRegion(@PathVariable("page") int page,
                                                        @PathVariable("region") String region){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalSize(viewService.getSizeByRegion(region));
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list = viewService.listByRegion(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region);
        return list;
    }
    @RequestMapping("/admin/attraction/list/{page}/{region}/{keywords}")
    public Map<String, Object> getAttractionListByKeywords(@PathVariable("page") int page,
                                                          @PathVariable("region") String region,
                                                          @PathVariable("keywords") String keywords){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list;

        if(StringUtil.isEmpty(keywords)){
            if(StringUtil.isEmpty(region)){
                pageSupport.setTotalSize(viewService.getSize());
                list = viewService.list(pageSupport.getCurrentPage(), pageSupport.getPageSize());
            }else{
                pageSupport.setTotalSize(viewService.getSizeByRegion(region));
                list = viewService.listByRegion(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region);
            }
        }else{
            if(StringUtil.isEmpty(region)){
                pageSupport.setTotalSize(viewService.getSizeByKeyWords(keywords));
                list = viewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords);
            }else{
                pageSupport.setTotalSize(viewService.getSizeByKeyWords(keywords, region));
                list = viewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords, region);
            }

        }

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }
    @RequestMapping("/admin/attraction/entity/{id}")
    public AttractionDO getAttraction(@PathVariable(name = "id") int id){
        AttractionDO ele = service.getEle(id);
        return ele;
    }


    @GetMapping("/admin/attraction/pic/{id}")
    public ResponseEntity<byte[]> getPicture(@PathVariable(name = "id") int id){
        byte[] picture = viewService.getPicture(id);

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_JPEG);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity(picture, httpHeaders, HttpStatus.OK);

        return responseEntity;
    }

    @PostMapping("/admin/attraction/update/{id}")
    public boolean update(@PathVariable(name = "id") int id,
                              @RequestParam(name="file", required=false)MultipartFile multipartFile,
                              @RequestParam(name="attractionData", required = false)String attractionData) {
        boolean flag = false;
        try {
//            System.out.println(attractionData);
            ObjectMapper mapper = new ObjectMapper();
            AttractionDO attractionDO = mapper.readValue(attractionData, AttractionDO.class);

//            String filename;
            if(multipartFile != null){
//                filename = multipartFile.getOriginalFilename();
//                String savePath = "C:\\JavaCourse\\IntelliJWorkSpace\\III_Project\\target\\III_Project-1.0-SNAPSHOT\\assets\\" + id + "\\" + filename;
//                System.out.println(savePath);
//                multipartFile.transferTo(new File(savePath));
                attractionDO.setPicture(multipartFile.getBytes());
                System.out.println("saveFile success");
            }
            service.update(attractionDO);

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
