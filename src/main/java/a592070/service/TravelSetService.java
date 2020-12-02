package a592070.service;

import a592070.pojo.TravelSetDO;

import java.util.List;

public interface TravelSetService {
    String SN = "sn";
    String CREATED_USER = "createdUser";
    String DESCRIPTION = "description";
    String PRIORITY = "priority";
    String CREATED_TIME = "createdTime";
    String UPDATE_TIME = "updateTime";
    String NAME = "name";
    String AVAILABLE = "available";


    TravelSetDO getEle(Integer id, boolean loadFetch);
    TravelSetDO getEle(Integer id, boolean loadFetch, boolean findFromPersistence);

    int getSize();
    int getSizeWithStatus(boolean available);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending);
    List<TravelSetDO> listByRownumWithStatus(int firstIndex, int resultSize, boolean status);
    List<TravelSetDO> listByRownumWithStatus(int firstIndex, int resultSize, boolean status, String orderFiled);
    List<TravelSetDO> listByRownumWithStatus(int firstIndex, int resultSize, boolean status, String orderFiled, boolean descending);

    int getSizeByCreated(String created);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled, boolean descending);

    int getSizeByCreatedUserWithStatus(String created, boolean available);
    List<TravelSetDO> listTravelSetByCreatedUserWithStatus(int firstIndex, int resultSize, String created, boolean status);
    List<TravelSetDO> listTravelSetByCreatedUserWithStatus(int firstIndex, int resultSize, String created, boolean status, String orderFiled);
    List<TravelSetDO> listTravelSetByCreatedUserWithStatus(int firstIndex, int resultSize, String created, boolean status, String orderFiled, boolean descending);

    int getSizeByKeywords(String keywords);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending);

    int getSizeByKeywordsWithStatus(String keywords, boolean available);
    List<TravelSetDO> listByKeywordsWithStatus(int firstIndex, int resultSize, String keywords, boolean status);
    List<TravelSetDO> listByKeywordsWithStatus(int firstIndex, int resultSize, String keywords, boolean status, String orderFiled);
    List<TravelSetDO> listByKeywordsWithStatus(int firstIndex, int resultSize, String keywords, boolean status, String orderFiled, boolean descending);


    TravelSetDO addTravelSet(TravelSetDO travelSetDO);
    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);
    boolean deleteTravelSet(Integer sn);
    boolean switchTravelSetAvailable(Integer sn);
}
