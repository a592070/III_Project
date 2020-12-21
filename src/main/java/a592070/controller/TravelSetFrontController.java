package a592070.controller;

import a592070.pojo.*;
import a592070.service.TravelSetService;
import a592070.service.ViewService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import global.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import rambo0021.pojo.AccountBean;
import utils.BeanConvertUtils;
import utils.IOUtils;
import utils.PageSupport;
import utils.StringUtil;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.DataInput;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static a592070.service.TravelSetService.*;
import static global.Constant.*;

@RestController
@Lazy
public class TravelSetFrontController {
    @Autowired
    private ServletContext context;

    private static final int ELE_PAGE_SIZE = 30;
    private static final int TRAVEL_SET_PAGE_SIZE = 10;

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


    @RequestMapping("/travelSet/checkLogin")
    public boolean checkLogin(HttpSession session){
        AccountBean user = (AccountBean) session.getAttribute(USER_LOGIN_SESSION);
        return user==null;
    }


    @RequestMapping("/travelSet/list/{page}")
    public Map<String, Object> getTravelSetList(@PathVariable("page") Integer page, HttpSession session){
        AccountBean user = (AccountBean) session.getAttribute(USER_LOGIN_SESSION);

        // delete when deploy
//        AccountBean user = new AccountBean();
//        user.setUserName("system");

        Map<String, Object> map = new HashMap<>();

        if(user != null){
            String userName = user.getUserName();

            try{
                PageSupport pageSupport = new PageSupport();
                pageSupport.setPageSize(TRAVEL_SET_PAGE_SIZE);
                pageSupport.setTotalSize(service.getSizeByUser(userName, true));
                pageSupport.setCurrentPage(page);

                List<TravelSetVO> list = service.listByUserWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), userName, true);
                map.put("tableData", list);
                map.put("pageData", pageSupport);
                map.put("message", true);
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", false);
            }
            map.put("noLogin", false);
        }else{
            map.put("noLogin", true);
        }
        return map;
    }

    @RequestMapping({"/travelSet/list/{page}/{keywords}"})
    public Map<String, Object> getTravelSetListByKeywords(@PathVariable("page") Integer page,
                                                          @PathVariable(name="keywords", required = false) String keywords,
                                                          @RequestParam(name="sortColumn", required = false) String sortColumn,
                                                          @RequestParam(name = "order", required = false) String order,
                                                          HttpSession session){

        AccountBean user = (AccountBean) session.getAttribute(USER_LOGIN_SESSION);

        // delete when deploy
//        AccountBean user = new AccountBean();
//        user.setUserName("system");

        Map<String, Object> map = new HashMap<>();

        if(user != null){
            String userName = user.getUserName();

            try{
                PageSupport pageSupport = new PageSupport();
                pageSupport.setPageSize(TRAVEL_SET_PAGE_SIZE);
                pageSupport.setCurrentPage(page);

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
                }

                boolean desc;
                if(StringUtil.isEmpty(order) || "ascending".equals(order)){
                    desc = false;
                }else{
                    desc = true;
                }

                pageSupport.setTotalSize(service.getSizeByUserSelect(userName, keywords, true));

                List<TravelSetVO> list = service.listByUserSelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), userName, keywords, true, sortColumn, desc);

                map.put("tableData", list);
                map.put("pageData", pageSupport);
                map.put("message", true);
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", false);
            }
            map.put("noLogin", false);
        }else{
            map.put("noLogin", true);
        }
        return map;
    }


    @GetMapping("/travelSet/entity/{id}")
    public Map<String, Object> getTravelSet(@PathVariable("id") Integer id, HttpSession session) {
        AccountBean user = (AccountBean) session.getAttribute(USER_LOGIN_SESSION);

        // delete when deploy
//        AccountBean user = new AccountBean();
//        user.setUserName("system");

        Map<String, Object> map = new HashMap<>();
        if(user != null) {
            String userName = user.getUserName();
            TravelSetDO ele = null;
            try {
                ele = service.getEleByUser(id, userName, true);

                Map<String, Object> origin = new HashMap<>();
                origin.put("travelSetInfo", ele);
                if(ele != null){
                    origin.put("travelSetAttractions", ele.getTravelAttractions());
                    origin.put("travelSetHotels", ele.getTravelHotels());
                    origin.put("travelSetRestaurants", ele.getTravelRestaurants());
                }
                map.put("data", origin);


                TravelSetFrontVO travelSetFrontVO = BeanConvertUtils.convertToTravelSetFrontVO(ele);

                map.put("dataSorted", travelSetFrontVO);
                map.put("sortDate", true);
            }catch (Exception e) {
                e.printStackTrace();
                map.put("sortByDate", false);
            }
            map.put("noLogin", false);
        }else {
            map.put("noLogin", true);
        }
        return map;

//        TravelSetFrontVO travelSetFrontVO = BeanConvertUtils.convertToTravelSetFrontVO(ele);
//        TravelSetDO travelSetDO = BeanConvertUtils.convertToTravelSetDO(travelSetFrontVO);
//
//        Map<String, Object> map = new HashMap<>();
//        map.put("travelSetInfo", travelSetDO);
//        map.put("travelSetAttractions", travelSetDO.getTravelAttractions());
//        map.put("travelSetHotels", travelSetDO.getTravelHotels());
//        map.put("travelSetRestaurants", travelSetDO.getTravelRestaurants());
//        return map;
    }


    @PutMapping("/travelSet/status/{id}")
    public boolean disableTravelSet(@PathVariable(name = "id") Integer id){
        boolean flag = false;
        try {
            service.switchTravelSetAvailable(id, false);
            flag = true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }


    @PutMapping({"/travelSet/save/{id}", "/travelSet/save/", "/travelSet/save"})
    public Map<String, Object> save(@PathVariable(name = "id", required = false) Integer id,
                                    @RequestBody Map<String,String> params,
                                    HttpSession session){
        AccountBean user = (AccountBean) session.getAttribute(USER_LOGIN_SESSION);

        // delete when deploy
//        AccountBean user = new AccountBean();
//        user.setUserName("system");


        Map<String, Object> map = new HashMap<>();
        if(user != null) {
            String userName = user.getUserName();
            TravelSetDO travelSetDO = null;
            try {

                ObjectMapper mapper = new ObjectMapper();

                travelSetDO = mapper.readValue(params.get("travelSetInfo"), TravelSetDO.class);
                List<TravelEleAttractionDO> eleAttractionDOList = mapper.readValue(params.get("travelSetAttractions"), new TypeReference<List<TravelEleAttractionDO>>(){});
                List<TravelEleHotelDO> eleHotelDOList = mapper.readValue(params.get("travelSetHotels"), new TypeReference<List<TravelEleHotelDO>>(){});
                List<TravelEleRestaurantDO> eleRestaurantDOList = mapper.readValue(params.get("travelSetRestaurants"), new TypeReference<List<TravelEleRestaurantDO>>(){});

                travelSetDO.setCreatedUser(userName);
                travelSetDO.setStatus(true);
                travelSetDO.setPriority(0);

                if(id == null || id.intValue() == 0) {
                    travelSetDO.setSn(null);

                    for (TravelEleAttractionDO ele : eleAttractionDOList) {
                        ele.setSn(null);
                        travelSetDO.addTravelAttractions(ele);
                    }
                    for (TravelEleHotelDO ele : eleHotelDOList) {
                        ele.setSn(null);
                        travelSetDO.addTravelHotels(ele);
                    }
                    for (TravelEleRestaurantDO ele : eleRestaurantDOList) {
                        ele.setSn(null);
                        travelSetDO.addTravelRestaurants(ele);
                    }

                    travelSetDO = service.addTravelSet(travelSetDO);
                }else{

                    for (TravelEleAttractionDO ele : eleAttractionDOList) {
                        travelSetDO.addTravelAttractions(ele);
                    }
                    for (TravelEleHotelDO ele : eleHotelDOList) {
                        travelSetDO.addTravelHotels(ele);
                    }
                    for (TravelEleRestaurantDO ele : eleRestaurantDOList) {
                        travelSetDO.addTravelRestaurants(ele);
                    }

//                    TravelSetDO loadDO = service.getEle(id, true);
//                    loadDO.getTravelAttractions().forEach(ele -> ele.setTravelSetDO(null));
//                    loadDO.getTravelRestaurants().forEach(ele -> ele.setTravelSetDO(null));
//                    loadDO.getTravelHotels().forEach(ele -> ele.setTravelSetDO(null));
//                    loadDO.setName(travelSetDO.getName());
//                    loadDO.setDescription(travelSetDO.getDescription());
//                    loadDO.setPriority(travelSetDO.getPriority());
//                    loadDO.setStatus(travelSetDO.getStatus());
//                    loadDO.setTravelAttractions(travelSetDO.getTravelAttractions());
//                    loadDO.setTravelRestaurants(travelSetDO.getTravelRestaurants());
//                    loadDO.setTravelHotels(travelSetDO.getTravelHotels());

                    travelSetDO = service.updateTravelSet(travelSetDO, true);
//                    travelSetDO = service.getEle(id, true, false);
                }

                Map<String, Object> origin = new HashMap<>();
                origin.put("travelSetInfo", travelSetDO);

                origin.put("travelSetAttractions", travelSetDO.getTravelAttractions());
                origin.put("travelSetHotels", travelSetDO.getTravelHotels());
                origin.put("travelSetRestaurants", travelSetDO.getTravelRestaurants());

                map.put("data", origin);

                map.put("isSave", true);


                try{
                    TravelSetFrontVO travelSetFrontVO = BeanConvertUtils.convertToTravelSetFrontVO(travelSetDO);

                    map.put("dataSorted", travelSetFrontVO);
                    map.put("sortDate", true);
                }catch (Exception e){
                    e.printStackTrace();
                    map.put("sortDate", false);
                }
            }catch (Exception e) {
                e.printStackTrace();
                map.put("isSave", false);
            }
            map.put("noLogin", false);
        }else {
            map.put("noLogin", true);
        }
        return map;
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
    public Map<String, Object> listTravelSetSelectItem(
            @PathVariable("type") int type,
            @PathVariable("page") int page,
            @PathVariable(name = "region", required = false) String region,
            @PathVariable(name="keywords", required = false) String keywords){

        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(ELE_PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List list;

        if(StringUtil.isEmpty(region) || "all".equals(region)) {
            region = "";
        }else{
            region = region.substring(0,2);
        }

        switch (type){
            case TRAVEL_SET_TYPE_ATTRACTION:
                pageSupport.setTotalSize(attractionViewService.getSizeBySelectWithStatus(region, keywords, true));
                list = attractionViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
                break;
            case TRAVEL_SET_TYPE_RESTAURANT:
                region = region.replace('臺', '台');
                pageSupport.setTotalSize(restaurantViewService.getSizeBySelectWithStatus(region, keywords, true));
                list = restaurantViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
                break;
            case TRAVEL_SET_TYPE_HOTEL:
                pageSupport.setTotalSize(hotelViewService.getSizeBySelectWithStatus(region, keywords, true));
                list = hotelViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
                break;
            default:
                list = new ArrayList();
                break;
        }
//        if(type == 0){
//            pageSupport.setTotalSize(attractionViewService.getSizeBySelectWithStatus(region, keywords, true));
//            list = attractionViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
//        }else if(type == 1){
//            region = region.replace('臺', '台');
//            pageSupport.setTotalSize(restaurantViewService.getSizeBySelectWithStatus(region, keywords, true));
//            list = restaurantViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
//        }else if(type == 2){
//            pageSupport.setTotalSize(hotelViewService.getSizeBySelectWithStatus(region, keywords, true));
//            list = hotelViewService.listBySelectWithStatus(pageSupport.getCurrentPage(), pageSupport.getPageSize(), region, keywords, true);
//        }
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
