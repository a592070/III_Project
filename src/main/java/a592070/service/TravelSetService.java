package a592070.service;

import a592070.pojo.TravelSetDO;
import a592070.pojo.TravelSetVO;

import java.util.List;

public interface TravelSetService {
    String SN = "sn";
    String CREATED_USER = "createdUser";
    String IDENTITY = "identity";
    String DESCRIPTION = "description";
    String PRIORITY = "priority";
    String CREATED_TIME = "createdTime";
    String UPDATE_TIME = "updateTime";
    String NAME = "name";
    String STATUS = "status";

    int ADMIN_ID = 1;


    TravelSetDO getEle(Integer id, boolean loadFetch);
    TravelSetDO getEle(Integer id, boolean loadFetch, boolean findFromPersistence);

    int getSize();
    int getSizeWithStatus(boolean available);
    List<TravelSetVO> listByRownum(int currentPage, int pageSize);
    List<TravelSetVO> listByRownum(int currentPage, int pageSize, String orderFiled);
    List<TravelSetVO> listByRownum(int currentPage, int pageSize, String orderFiled, boolean descending);
    List<TravelSetVO> listByRownumWithStatus(int currentPage, int pageSize, boolean status);
    List<TravelSetVO> listByRownumWithStatus(int currentPage, int pageSize, boolean status, String orderFiled);
    List<TravelSetVO> listByRownumWithStatus(int currentPage, int pageSize, boolean status, String orderFiled, boolean descending);

    int getSizeByIdentity(Integer identity);
    List<TravelSetVO> listByIdentity(int currentPage, int pageSize, Integer identity);
    List<TravelSetVO> listByIdentity(int currentPage, int pageSize, Integer identity, String orderFiled);
    List<TravelSetVO> listByIdentity(int currentPage, int pageSize, Integer identity, String orderFiled, boolean descending);

    int getSizeByIdentityWithStatus(Integer identity, boolean available);
    List<TravelSetVO> listByIdentityWithStatus(int currentPage, int pageSize, Integer identity, boolean status);
    List<TravelSetVO> listByIdentityWithStatus(int currentPage, int pageSize, Integer identity, boolean status, String orderFiled);
    List<TravelSetVO> listByIdentityWithStatus(int currentPage, int pageSize, Integer identity, boolean status, String orderFiled, boolean descending);

    int getSizeByKeywords(String keywords);
    List<TravelSetVO> listByKeywords(int currentPage, int pageSize, String keywords);
    List<TravelSetVO> listByKeywords(int currentPage, int pageSize, String keywords, String orderFiled);
    List<TravelSetVO> listByKeywords(int currentPage, int pageSize, String keywords, String orderFiled, boolean descending);

    int getSizeByKeywordsWithStatus(String keywords, boolean available);
    List<TravelSetVO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status);
    List<TravelSetVO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status, String orderFiled);
    List<TravelSetVO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status, String orderFiled, boolean descending);


    int getSizeBySelect(Integer identity, String keywords);
    int getSizeBySelectWithStatus(Integer identity, String keywords, boolean status);
    List<TravelSetVO> listBySelect(int currentPage, int pageSize, Integer identity, String keywords);
    List<TravelSetVO> listBySelect(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled);
    List<TravelSetVO> listBySelect(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled, boolean descending);
    List<TravelSetVO> listBySelectWithStatus(int currentPage, int pageSize, Integer identity, String keywords, boolean status);
    List<TravelSetVO> listBySelectWithStatus(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled, boolean status);
    List<TravelSetVO> listBySelectWithStatus(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled, boolean descending, boolean status);

    TravelSetDO addTravelSet(TravelSetDO travelSetDO);
    TravelSetDO updateTravelSet(TravelSetDO travelSetDO);
    boolean deleteTravelSet(Integer sn);
    boolean switchTravelSetAvailable(Integer sn);
}
