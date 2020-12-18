package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.pojo.CarVO;
import utils.StringUtil;

import java.util.List;

public interface ViewService<T> {

    T getEle(Integer id);
    T getEle(Integer id, boolean findFromPersistence);
    T getEleWithStatus(Integer id, boolean available);
    T getEleWithStatus(Integer id, boolean available, boolean findFromPersistence);
    List getPictures(Integer id);
    byte[] getPicture(Integer id);



    int getSize();
    int getSizeWithStatus(boolean available);

    List<T> list(int currentPage, int pageSize);
    List<T> list(int currentPage, int pageSize, String orderFiled);
    List<T> list(int currentPage, int pageSize, String orderFiled, boolean descending);
    List<T> listWithStatus(int currentPage, int pageSize, boolean available);
    List<T> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled);
    List<T> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled, boolean descending);



    int getSizeByRegion(String region);
    int getSizeByRegionWithStatus(String region, boolean available);

    List<T> listByRegion(int currentPage, int pageSize, String region);
    List<T> listByRegion(int currentPage, int pageSize, String region, String orderFiled);
    List<T> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending);
    List<T> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available);
    List<T> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled);
    List<T> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled, boolean descending);



    int getSizeByKeyWords(String keywords);
    int getSizeByKeyWordsWithStatus(String keywords, boolean available);


    List<T> listByKeyWords(int currentPage, int pageSize, String keywords);
    List<T> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled);
    List<T> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled, boolean descending);
    List<T> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available);
    List<T> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String orderFiled);
    List<T> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String orderFiled, boolean descending);


    int getSizeBySelect(String region, String keywords);
    int getSizeBySelectWithStatus(String region, String keywords, boolean available);

    List<T> listBySelect(int currentPage, int pageSize, String region, String keywords);
    List<T> listBySelect(int currentPage, int pageSize, String region, String keywords, String orderFiled);
    List<T> listBySelect(int currentPage, int pageSize, String region, String keywords, String orderFiled, boolean descending);
    List<T> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available);
    List<T> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available, String orderFiled);
    List<T> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available, String orderFiled, boolean descending);
}
