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


    TravelSetDO getEle(Integer id);
    TravelSetDO getEle(Integer id, boolean findFromPersistence);

    int getSize();
    int getSize(boolean available);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending);
    List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available);

    int getSizeByCreated(String created);
    int getSizeByCreated(String created, boolean available);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled, boolean descending);
    List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, boolean available, String orderFiled, boolean descending);

    int getSizeByKeywords(String keyWords);
    int getSizeByKeywords(String keyWords, boolean available);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending);
    List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean available);


    TravelSetDO addTravelSet(TravelSetDO travelSetDO);
    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);
    boolean switchTravelSetAvailable(Integer sn);
}
