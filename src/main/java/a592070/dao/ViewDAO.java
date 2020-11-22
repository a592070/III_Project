package a592070.dao;

import a592070.pojo.AttractionVO;

import java.util.List;

public interface ViewDAO<T> {

    int getSize();
    T getEle(int id);

    byte[] getPicture(int id);
    List getPictures(int id);

//    int getSizeByKeywords(String keyWords);
//    List<T> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled);

    int getSizeByKeywords(String keyWords, String region);
    List<T> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending);

    int getSizeByFiled(String filedName, String filedValue);
    List<T> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending);

    List<T> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending);

}
