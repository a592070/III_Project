package a592070.dao;

import a592070.pojo.AttractionVO;

import java.util.List;

public interface ViewDAO<T> {

    T getEle(Integer id, boolean findFromPersistence);
    T getEle(Integer id, boolean findFromPersistence, boolean available);

    byte[] getPicture(Integer id);
    List getPictures(Integer id);



    int getSize();
    int getSize(boolean available);

    List<T> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending);
    List<T> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available);


//    int getSizeByKeywords(String keyWords);
//    List<T> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled);

    int getSizeByKeywords(String keywords);
    int getSizeByKeywords(String keywords, boolean available);

    List<T> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending);
    List<T> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean available);



    int getSizeByFiled(String filedName, String filedValue);
    int getSizeByFiled(String filedName, String filedValue, boolean available);

    List<T> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending);
    List<T> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending, boolean available);


    int getSizeBySelect(String region, String keywords);
    int getSizeBySelect(String region, String keywords, boolean available);
    List<T> listBySelect(int firstIndex, int resultSize, String region, String keywords, String orderFiled, boolean descending);
    List<T> listBySelect(int firstIndex, int resultSize, String region, String keywords, String orderFiled, boolean descending, boolean available);

}
