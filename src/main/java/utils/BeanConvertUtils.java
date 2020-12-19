package utils;

import a592070.pojo.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static global.Constant.*;

public class BeanConvertUtils {


    public static TravelSetDO convertToTravelSetDO(TravelSetFrontVO travelSetFrontVO){
        TravelSetDO travelSetDO = new TravelSetDO();
        travelSetDO.setSn(travelSetFrontVO.getSn());
        travelSetDO.setName(travelSetFrontVO.getName());
        travelSetDO.setDescription(travelSetFrontVO.getDescription());
        travelSetDO.setCreatedUser(travelSetFrontVO.getCreatedUser());
        travelSetDO.setCreatedTime(travelSetFrontVO.getCreatedTime());
        travelSetDO.setUpdateTime(travelSetFrontVO.getUpdateTime());

        Map<String, List<TravelSetEleVO>> events = travelSetFrontVO.getEvents();
        events.entrySet().forEach(map -> {
            map.getValue().forEach(vo -> {
                switch (vo.getType()){
                    case TRAVEL_SET_TYPE_ATTRACTION:
                        TravelEleAttractionDO aEleDO = convertToTravelEleDO((TravelSetEleAttractionVO) vo);
                        travelSetDO.addTravelAttractions(aEleDO);
                        break;
                    case TRAVEL_SET_TYPE_RESTAURANT:
                        TravelEleRestaurantDO rEleDO = convertToTravelEleDO((TravelSetEleRestaurantVO) vo);
                        travelSetDO.addTravelRestaurants(rEleDO);
                        break;
                    case TRAVEL_SET_TYPE_HOTEL:
                        TravelEleHotelDO hEleDO = convertToTravelEleDO((TravelSetEleHotelVO) vo);
                        travelSetDO.addTravelHotels(hEleDO);
                        break;
                    default:
                        break;
                }
            });
        });

        return travelSetDO;
    }

    public static TravelSetFrontVO convertToTravelSetFrontVO(TravelSetDO travelSetDO){
        TravelSetFrontVO travelSetFrontVO = new TravelSetFrontVO();
        travelSetFrontVO.setSn(travelSetDO.getSn());
        travelSetFrontVO.setName(travelSetDO.getName());
        travelSetFrontVO.setDescription(travelSetDO.getDescription());

        travelSetFrontVO.setCreatedUser(travelSetDO.getCreatedUser());
        travelSetFrontVO.setCreatedTime(travelSetDO.getCreatedTime());
        travelSetFrontVO.setUpdateTime(travelSetDO.getUpdateTime());

        List<TravelEleAttractionDO> listAttractions = travelSetDO.getTravelAttractions();
        List<TravelEleRestaurantDO> listRestaurants = travelSetDO.getTravelRestaurants();
        List<TravelEleHotelDO> listHotels = travelSetDO.getTravelHotels();


        Map<String, List<TravelSetEleVO>> map = new HashMap<>();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        listAttractions.forEach(ele -> {
            String format = simpleDateFormat.format(ele.getTime());
            List<TravelSetEleVO> objects = map.get(format);
            if(objects == null) objects = new ArrayList<>();

            TravelSetEleVO travelSetEleVO = convertToTravelSetEleVO(TRAVEL_SET_TYPE_ATTRACTION, ele);
            objects.add(travelSetEleVO);
            map.put(format, objects);
        });
        listRestaurants.forEach(ele -> {
            String format = simpleDateFormat.format(ele.getTime());
            List<TravelSetEleVO> objects = map.get(format);

            if(objects == null) objects = new ArrayList<>();

            TravelSetEleVO travelSetEleVO = convertToTravelSetEleVO(TRAVEL_SET_TYPE_RESTAURANT, ele);
            objects.add(travelSetEleVO);

            map.put(format, objects);
        });
        listHotels.forEach(ele -> {
            String format = simpleDateFormat.format(ele.getTime());
            List<TravelSetEleVO> objects = map.get(format);
            if(objects == null) objects = new ArrayList<>();

            TravelSetEleVO travelSetEleVO = convertToTravelSetEleVO(TRAVEL_SET_TYPE_HOTEL, ele);
            objects.add(travelSetEleVO);

            map.put(format, objects);
        });

        travelSetFrontVO.setEvents(map);
        return travelSetFrontVO;
    }


    private static TravelSetEleVO convertToTravelSetEleVO(int type, Object obj){
        switch (type){
            case TRAVEL_SET_TYPE_ATTRACTION:
                return convertToTravelSetEleVO((TravelEleAttractionDO)obj);
            case TRAVEL_SET_TYPE_RESTAURANT:
                return convertToTravelSetEleVO((TravelEleRestaurantDO)obj);
            case TRAVEL_SET_TYPE_HOTEL:
                return convertToTravelSetEleVO((TravelEleHotelDO)obj);
            default:
                break;
        }
        return null;
    }

    private static TravelSetEleVO convertToTravelSetEleVO(TravelEleAttractionDO ele){
        TravelSetEleAttractionVO vo = new TravelSetEleAttractionVO();
        vo.setType(TRAVEL_SET_TYPE_ATTRACTION);
        vo.setSn(ele.getSn());
        vo.setTime(ele.getTime());
        vo.setAttraction(ele.getAttraction());
        return vo;
    }
    private static TravelSetEleVO convertToTravelSetEleVO(TravelEleRestaurantDO ele){
        TravelSetEleRestaurantVO vo = new TravelSetEleRestaurantVO();
        vo.setType(TRAVEL_SET_TYPE_RESTAURANT);
        vo.setSn(ele.getSn());
        vo.setTime(ele.getTime());
        vo.setRestaurantVO(ele.getRestaurant());
        return vo;
    }
    private static TravelSetEleVO convertToTravelSetEleVO(TravelEleHotelDO ele){
        TravelSetEleHotelVO vo = new TravelSetEleHotelVO();
        vo.setType(TRAVEL_SET_TYPE_HOTEL);
        vo.setSn(ele.getSn());
        vo.setTime(ele.getTime());
        vo.setHotelVO(ele.getHotel());
        return vo;
    }

    @Deprecated
    private static <T> T convertToTravelEleDO(TravelSetEleVO travelSetEleVO, Class<T> tClass){
        switch (travelSetEleVO.getType()){
            case TRAVEL_SET_TYPE_ATTRACTION:
                return (T) convertToTravelEleDO((TravelSetEleAttractionVO)travelSetEleVO);
            case TRAVEL_SET_TYPE_RESTAURANT:
                return (T) convertToTravelEleDO((TravelSetEleRestaurantVO)travelSetEleVO);
            case TRAVEL_SET_TYPE_HOTEL:
                return (T) convertToTravelEleDO((TravelSetEleHotelVO)travelSetEleVO);
            default:
                break;
        }
        return null;
    }

    private static TravelEleAttractionDO convertToTravelEleDO(TravelSetEleAttractionVO travelSetEleVO){
        TravelEleAttractionDO travelEleDO = new TravelEleAttractionDO();
        travelEleDO.setSn(travelSetEleVO.getSn());
        travelEleDO.setTime(travelSetEleVO.getTime());
        travelEleDO.setAttraction(travelSetEleVO.getAttraction());
        return travelEleDO;
    }

    private static TravelEleRestaurantDO convertToTravelEleDO(TravelSetEleRestaurantVO travelSetEleVO){
        TravelEleRestaurantDO travelEleDO = new TravelEleRestaurantDO();
        travelEleDO.setSn(travelSetEleVO.getSn());
        travelEleDO.setTime(travelSetEleVO.getTime());
        travelEleDO.setRestaurant(travelSetEleVO.getRestaurantVO());
        return travelEleDO;
    }

    private static TravelEleHotelDO convertToTravelEleDO(TravelSetEleHotelVO travelSetEleVO){
        TravelEleHotelDO travelEleDO = new TravelEleHotelDO();
        travelEleDO.setSn(travelSetEleVO.getSn());
        travelEleDO.setTime(travelSetEleVO.getTime());
        travelEleDO.setHotel(travelSetEleVO.getHotelVO());
        return travelEleDO;
    }


}
