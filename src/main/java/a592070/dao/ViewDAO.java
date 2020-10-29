package a592070.dao;

import a592070.pojo.AttractionVO;

import java.util.List;

public interface ViewDAO<T> {

    int getSize();
    T getEle(int id);
    int getSizeByKeywords(String keyWords);
    List<T> listByKeywords(int firstIndex, int resultSize, String keyWords);
    int getSizeByRegion(String region);
    List<T> listByRownum(int firstIndex, int resultSize, String region);

}
