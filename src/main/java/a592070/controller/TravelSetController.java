package a592070.controller;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.*;
import a592070.service.AttractionService;
import a592070.service.TravelSetService;
import a592070.service.ViewService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
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
import java.util.ArrayList;
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

    @Autowired@Qualifier("attractionViewService")
    private ViewService<AttractionVO> attractionViewService;
    @Autowired@Qualifier("carViewService")
    private ViewService<CarVO> carViewService;
    @Autowired@Qualifier("hotelViewService")
    private ViewService<HotelVO> hotelViewService;
    @Autowired@Qualifier("restaurantViewService")
    private ViewService<RestaurantVO> restaurantViewService;

    @RequestMapping("/admin/travelSet/list/{page}")
    public Map<String, Object> getTravelSetList(@PathVariable("page") Integer page){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setTotalSize(service.getSize());
        pageSupport.setCurrentPage(page);

        Map<String, Object> map = new HashMap<>();
        try{
            List<TravelSetVO> list = service.listByRownum(pageSupport.getCurrentPage(), pageSupport.getPageSize());
            map.put("tableData", list);
            map.put("pageData", pageSupport);
        }catch (Exception e){
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping({"/admin/travelSet/list/{page}/{identity}/{keywords}", "/admin/travelSet/list/{page}/{identity}"})
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
            sortColumn = STATUS;
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
        Map<String, Object> map = new HashMap<>();
        try {
            TravelSetDO travelSetDO = service.getEle(id, true);

            map.put("travelSetInfo", travelSetDO);
            map.put("travelSetAttractions", travelSetDO.getTravelAttractions());
            map.put("travelSetCars", travelSetDO.getTravelCars());
            map.put("travelSetHotels", travelSetDO.getTravelHotels());
            map.put("travelSetRestaurants", travelSetDO.getTravelRestaurants());
        }catch (Exception e){
            e.printStackTrace();
        }
//        System.out.println(map);
        return map;
    }

    @PutMapping({"/admin/travelSet/save/{id}", "/admin/travelSet/save/", "/admin/travelSet/save"})
    public Map<String, Object> save(@PathVariable(name = "id", required = false) Integer id,
                                    @RequestBody Map<String,String> params) {
        Map<String, Object> map = new HashMap<>();
        try {
            ObjectMapper mapper = new ObjectMapper();
//            System.out.println(params);

            TravelSetDO travelSetDO = mapper.readValue(params.get("travelSetInfo"), TravelSetDO.class);
            List<TravelEleAttractionDO> eleAttractionDOList = mapper.readValue(params.get("travelSetAttractions"), new TypeReference<List<TravelEleAttractionDO>>(){});
            List<TravelEleCarDO> eleCarDOList = mapper.readValue(params.get("travelSetCars"), new TypeReference<List<TravelEleCarDO>>(){});
            List<TravelEleHotelDO> eleHotelDOList = mapper.readValue(params.get("travelSetHotels"), new TypeReference<List<TravelEleHotelDO>>(){});
            List<TravelEleRestaurantDO> eleRestaurantDOList = mapper.readValue(params.get("travelSetRestaurants"), new TypeReference<List<TravelEleRestaurantDO>>(){});

            if(id == null || id.intValue() == 0) {
                for (TravelEleAttractionDO ele : eleAttractionDOList) {
                    ele.setSn(null);
                    travelSetDO.addTravelAttractions(ele);
                }
                for (TravelEleCarDO ele : eleCarDOList) {
                    ele.setSn(null);
                    travelSetDO.addTravelCars(ele);
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
                for (TravelEleCarDO ele : eleCarDOList) {
                    travelSetDO.addTravelCars(ele);
                }
                for (TravelEleHotelDO ele : eleHotelDOList) {
                    travelSetDO.addTravelHotels(ele);
                }
                for (TravelEleRestaurantDO ele : eleRestaurantDOList) {
                    travelSetDO.addTravelRestaurants(ele);
                }

                travelSetDO = service.updateTravelSet(travelSetDO);
            }



            map.put("travelSetInfo", travelSetDO);
            map.put("travelSetAttractions", travelSetDO.getTravelAttractions());
            map.put("travelSetCars", travelSetDO.getTravelCars());
            map.put("travelSetHotels", travelSetDO.getTravelHotels());
            map.put("travelSetRestaurants", travelSetDO.getTravelRestaurants());
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

    /*
    type {
     0: attraction
     1: restaurant
     2: hotel
     3: car
     }
     */
    @GetMapping({"/admin/travelSet/{type}/{page}/{keywords}", "/admin/travelSet/{type}/{page}"})
    public Map<String, Object> listTravelSetAttraction(
            @PathVariable("type") int type,
            @PathVariable("page") int page,
            @PathVariable(name="keywords", required = false) String keywords){
        PageSupport pageSupport = new PageSupport();
        pageSupport.setPageSize(PAGE_SIZE);
        pageSupport.setCurrentPage(page);

        List list = new ArrayList();

        if(type == 0){
            pageSupport.setTotalSize(attractionViewService.getSizeByKeyWords(keywords));
            list = attractionViewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords);
        }else if(type == 1){
            pageSupport.setTotalSize(restaurantViewService.getSizeByKeyWords(keywords));
            list = restaurantViewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords);
        }else if(type == 2){
            pageSupport.setTotalSize(hotelViewService.getSizeByKeyWords(keywords));
            list = hotelViewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords);
        }else if(type == 3){
            pageSupport.setTotalSize(carViewService.getSizeByKeyWords(keywords));
            list = carViewService.listByKeyWords(pageSupport.getCurrentPage(), pageSupport.getPageSize(), keywords);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("tableData", list);
        map.put("pageData", pageSupport);
        return map;
    }

    @PostMapping("/admin/travelSet/checkuser/{username}")
    public boolean checkUser(@PathVariable("username") String username){
        if(StringUtil.isEmpty(username)) return false;
        return service.checkUser(username);
    }
}
