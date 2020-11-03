package a592070.dao;

import a592070.pojo.AttractionDO;

import java.util.List;

public interface AttractionDAO {
    int getSize();
    AttractionDO getEle(int id);
    int getSizeByKeywords(String keyWords);
    List<AttractionDO> listByKeywords(int firstIndex, int resultSize, String keyWords);
    int getSizeByRegion(String region);
    List<AttractionDO> listByRownum(int firstIndex, int resultSize, String region);

    void insert(AttractionDO ele);
    void update(AttractionDO ele);
    void delete(AttractionDO ele);
}
