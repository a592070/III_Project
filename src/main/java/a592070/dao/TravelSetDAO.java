package a592070.dao;

import a592070.pojo.*;

import java.util.List;

public interface TravelSetDAO{
    TravelSetDO getTravelSetByID(int id, int available, boolean findFromPersistence, boolean loadFetch);

    int getSize(int available);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, int available);

    int getSizeByCreated(String created, int available);
    List<TravelSetDO> listTravelSetByCreated(String created, int available);

//    List<TravelEleAttractionDO> getAttractionSet(int id);
//    List<TravelEleCarDO> getCarSet(int id);
//    List<TravelEleHotelDO> getHotelSet(int id);
//    List<TravelEleRestaurantDO> getRestaurantSet(int id);

    int getSizeByKeywords(String keyWords);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled, boolean descending);

//    int getSizeByFiled(String filedName, String filedValue);
//    List<TravelSetDO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending);


    TravelSetDO addTravelSet(TravelSetDO travelSetDO);
    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);
    boolean setTravelSetUnavailable(int sn);
}
