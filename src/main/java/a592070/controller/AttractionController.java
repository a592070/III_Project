package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.service.AttractionService;
import a592070.service.ViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import utils.IOUtils;
import utils.PageSupport;
import utils.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController@Lazy
public class AttractionController {
    private static final int PAGE_SIZE = 10;

    @Autowired@Qualifier("attractionService")
    private AttractionService service;
    @Autowired@Qualifier("attractionViewService")
    private ViewService<AttractionVO> viewService;

    @RequestMapping("/admin/attraction")
    public void attractionMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/admin/a592070/attractionInfo02.jsp").forward(request, response);
    }
    @RequestMapping("/admin/attraction/detail")
    public void attractionDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/admin/a592070/attractionDetail.jsp").forward(request, response);
    }


    @RequestMapping("/admin/attraction/list/{page}")
    public List<AttractionVO> getAttractionList(@PathVariable("page") int page){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalCount(viewService.getSize());
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list = viewService.list(pageSupport.getCurrentPage(), pageSupport.getPageSize());
        return list;
    }
    @RequestMapping("/admin/attraction/list/region/{page}/{region}")
    public List<AttractionVO> getAttractionListByRegion(@PathVariable("page") int page, @PathVariable("region") String region){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalCount(viewService.getSizeByRegion(region));
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list = viewService.listByRegion(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region);
        return list;
    }
    @RequestMapping("/admin/attraction/list/keyword/{page}/{keywords}")
    public List<AttractionVO> getAttractionListByKeywords(@PathVariable("page") int page, @PathVariable("keywords") String keywords){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalCount(viewService.getSizeByKeyWords(keywords));
        pageSupport.setCurrentPage(page);

        List<AttractionVO> list = viewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords);
        return list;
    }
    @RequestMapping("/admin/attraction/entity/{id}")
    public AttractionDO getAttraction(@PathVariable(name = "id") int id){
        AttractionDO ele = service.getEle(id);
        return ele;
    }


    @RequestMapping("/admin/attraction/pic/{id}")
    public ResponseEntity<byte[]> getPicture(@PathVariable(name = "id") int id){
        byte[] picture = viewService.getPicture(id);

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_JPEG);
        ResponseEntity<byte[]> responseEntity = new ResponseEntity(picture, httpHeaders, HttpStatus.OK);

        return responseEntity;
    }


}
