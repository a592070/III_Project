package a592070.dao;

import a592070.pojo.*;

import java.util.List;

public interface TravelSetDAO{
    TravelSetDO getTravelSetByID(Integer id, boolean loadFetch, boolean findFromPersistence);
    TravelSetDO getTravelSetByUser(Integer id, String userName, boolean loadFetch);

    boolean checkUser(String username);

    int getSize();
    int getSize(boolean available);
    List<TravelSetVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending);
    List<TravelSetVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean status);

    int getSizeByIdentity(Integer identity);
    int getSizeByIdentity(Integer identity, boolean status);
    List<TravelSetVO> listTravelSetByIdentity(int firstIndex, int resultSize, Integer identity, String orderFiled, boolean descending);
    List<TravelSetVO> listTravelSetByIdentity(int firstIndex, int resultSize, Integer identity, String orderFiled, boolean descending, boolean status);

//    List<TravelEleAttractionDO> getAttractionSet(int id);
//    List<TravelEleCarDO> getCarSet(int id);
//    List<TravelEleHotelDO> getHotelSet(int id);
//    List<TravelEleRestaurantDO> getRestaurantSet(int id);

    int getSizeByKeywords(String keywords);
    int getSizeByKeywords(String keywords, boolean status);
    List<TravelSetVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending);
    List<TravelSetVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean status);


    int getSizeBySelect(Integer identity, String keywords);
    int getSizeBySelect(Integer identity, String keywords, boolean status);
    List<TravelSetVO> listBySelect(int firstIndex, int resultSize, Integer identity, String keywords, String orderFiled, boolean descending);
    List<TravelSetVO> listBySelect(int firstIndex, int resultSize, Integer identity, String keywords, String orderFiled, boolean descending, boolean status);


    int getSizeByUser(String userName);
    int getSizeByUser(String userName, boolean status);
    List<TravelSetVO> listByUser(int firstIndex, int resultSize, String userName, String orderFiled, boolean descending);
    List<TravelSetVO> listByUser(int firstIndex, int resultSize, String userName, String orderFiled, boolean descending, boolean status);


    int getSizeByUserSelect(String userName, String keywords);
    int getSizeByUserSelect(String userName, String keywords, boolean status);
    List<TravelSetVO> listByUserSelect(int firstIndex, int resultSize, String userName, String keywords, String orderFiled, boolean descending);
    List<TravelSetVO> listByUserSelect(int firstIndex, int resultSize, String userName, String keywords, String orderFiled, boolean descending, boolean status);

//    int getSizeByFiled(String filedName, String filedValue);
//    List<TravelSetDO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending);


    Integer addTravelSet(TravelSetDO travelSetDO);
    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);
    void removeTravelSet(TravelSetDO travelSetDO);
    void switchTravelSetStatus(Integer sn);
    void switchTravelSetStatus(Integer sn, boolean flag);
}
