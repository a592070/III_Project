package a592070.service;

import a592070.dao.AttractionDAO;
import a592070.dao.ViewDAO;
import a592070.fieldenum.AttractionFiledName;
import a592070.fieldenum.HotelFieldName;
import a592070.fieldenum.RestaurantFieldName;
import a592070.pojo.*;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ElasticSearchService {
    private String attractionDetailUrlPrefix = "";
    private String attractionPicUrlPrefix = "";
    private String hotelDetailUrlPrefix = "";
    private String hotelPicUrlPrefix = "";
    private String restaurantDetailUrlPrefix = "";
    private String restaurantPicUrlPrefix = "";


    @Autowired
    RestHighLevelClient restHighLevelClient;

    @Autowired@Qualifier("attractionViewDao")
    private ViewDAO<AttractionVO> attractionViewDAO;

    @Autowired@Qualifier("hotelViewDao")
    private ViewDAO<HotelVO> hotelViewDAO;

    @Autowired@Qualifier("restaurantViewDao")
    private ViewDAO<RestaurantVO> restaurantViewDAO;



    public ESAttractionVO convertAttractionData(Integer id){
        AttractionVO ele = attractionViewDAO.getEle(id, false);
        if(ele != null){
            convertAttractionData(ele);
        }
        return null;
    }
    public ESAttractionVO convertAttractionData(AttractionVO ele){
        ESAttractionVO esVO = new ESAttractionVO();
        esVO.setId(ele.getSn());
        esVO.setName(ele.getName());
        esVO.setAddress(ele.getAddress());
        esVO.setDetailUrl(attractionDetailUrlPrefix+ele.getSn());
        esVO.setPicUrl(attractionPicUrlPrefix+ele.getSn());
        return esVO;
    }
    public List<ESAttractionVO> convertAttractionDataList(){
        int size = attractionViewDAO.getSize();
        List<AttractionVO> listVO = attractionViewDAO.listByRownum(0, size, AttractionFiledName.ATTRACTION_ID, false);

        List<ESAttractionVO> list = listVO.stream()
                .map(ele -> convertAttractionData(ele))
                .collect(Collectors.toList());
        return list;
    }


    public ESHotelVO convertHotelData(Integer id){
        HotelVO ele = hotelViewDAO.getEle(id, false);
        if(ele != null){
            convertHotelData(ele);
        }
        return null;
    }
    public ESHotelVO convertHotelData(HotelVO ele){
        ESHotelVO esVO = new ESHotelVO();
        esVO.setId(ele.getSn());
        esVO.setName(ele.getName());
        esVO.setAddress(ele.getAddress());
        esVO.setDetailUrl(hotelDetailUrlPrefix+ele.getSn());
        esVO.setPicUrl(hotelPicUrlPrefix+ele.getSn());
        return esVO;
    }
    public List<ESHotelVO> convertHotelDataList(){
        int size = hotelViewDAO.getSize();
        List<HotelVO> listVO = hotelViewDAO.listByRownum(0, size, HotelFieldName.HOTEL_ID, false);

        List<ESHotelVO> list = listVO.stream()
                .map(ele -> convertHotelData(ele))
                .collect(Collectors.toList());
        return list;
    }



    public ESRestaurantVO convertRestaurantData(Integer id){
        RestaurantVO ele = restaurantViewDAO.getEle(id, false);
        if(ele != null){
            convertRestaurantData(ele);
        }
        return null;
    }
    public ESRestaurantVO convertRestaurantData(RestaurantVO ele){

        ESRestaurantVO esVO = new ESRestaurantVO();
        esVO.setId(ele.getSn());
        esVO.setName(ele.getName());
        esVO.setAddress(ele.getAddress());
        esVO.setDetailUrl(restaurantDetailUrlPrefix+ele.getSn());
        esVO.setPicUrl(restaurantPicUrlPrefix+ele.getSn());
        return esVO;
    }
    public List<ESRestaurantVO> convertRestaurantDataList(){
        int size = restaurantViewDAO.getSize();
        List<RestaurantVO> listVO = restaurantViewDAO.listByRownum(0, size, RestaurantFieldName.RESTAURANT_ID, false);

        List<ESRestaurantVO> list = listVO.stream()
                .map(ele -> convertRestaurantData(ele))
                .collect(Collectors.toList());
        return list;
    }


}
