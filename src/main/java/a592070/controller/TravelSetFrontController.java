package a592070.controller;

import a592070.pojo.*;
import a592070.service.TravelSetService;
import a592070.service.ViewService;
import global.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import utils.BeanConvertUtils;
import utils.IOUtils;
import utils.PageSupport;
import utils.StringUtil;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Lazy
public class TravelSetFrontController {
    @Autowired
    private ServletContext context;
    private static final int PAGE_SIZE = 30;

    @Autowired@Qualifier("travelSetService")
    private TravelSetService service;

    @Autowired@Qualifier("attractionViewService")
    private ViewService<AttractionVO> attractionViewService;
    @Autowired@Qualifier("carViewService")
    private ViewService<CarVO> carViewService;
    @Autowired@Qualifier("hotelViewService")
    private ViewService<HotelVO> hotelViewService;
    @Autowired@Qualifier("restaurantViewService")
    private ViewService<RestaurantVO> restaurantViewService;



    @GetMapping("/travelSet/entity/{id}")
    public TravelSetFrontVO getTravelSet(@PathVariable("id") Integer id){

        TravelSetDO ele = service.getEle(id, true);

        return BeanConvertUtils.convertToTravelSetFrontVO(ele);
    }


    /*
    type {
     0: attraction
     1: restaurant
     2: hotel
     3: car(no use)
     }
     */
    @GetMapping({"/travelSet/{type}/{page}/{region}/{keywords}", "/travelSet/{type}/{page}/{region}", "/travelSet/{type}/{page}"})
    public Map<String, Object> listTravelSetAttraction(
            @PathVariable("type") int type,
            @PathVariable("page") int page,
            @PathVariable(name = "region", required = false) String region,
            @PathVariable(name="keywords", required = false) String keywords){

        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List list = new ArrayList();

        if(StringUtil.isEmpty(region) || "all".equals(region)) {
            region = "";
        }else{
            region = region.substring(0,2);
        }

        if(type == 0){
            pageSupport.setTotalSize(attractionViewService.getSizeBySelectWithStatus(region, keywords, true));
            list = attractionViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
        }else if(type == 1){
            region = region.replace('臺', '台');
            pageSupport.setTotalSize(restaurantViewService.getSizeBySelectWithStatus(region, keywords, true));
            list = restaurantViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
        }else if(type == 2){
            pageSupport.setTotalSize(hotelViewService.getSizeBySelectWithStatus(region, keywords, true));
            list = hotelViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
        }
//        else if(type == 3){
//            pageSupport.setTotalSize(carViewService.getSizeByKeyWords(keywords));
//            list = carViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
//        }

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }

    @GetMapping("/travelSet/pic/{type}/{id}")
    public ResponseEntity<byte[]> getPicture(@PathVariable(name = "id") Integer id,
                                             @PathVariable(name = "type") int type){
        byte[] bytes = null;

        // 從資料庫抓圖片
        if(type == 1){
            RestaurantVO ele = restaurantViewService.getEle(id, true);
            bytes = ele.getImage();
        }else if(type == 2){
            HotelVO ele = hotelViewService.getEle(id, true);
            bytes = ele.getImage();
        }

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.IMAGE_JPEG);
        httpHeaders.setCacheControl(CacheControl.noCache());
        ResponseEntity<byte[]> responseEntity = new ResponseEntity(bytes, httpHeaders, HttpStatus.OK);
        return responseEntity;
    }
}
