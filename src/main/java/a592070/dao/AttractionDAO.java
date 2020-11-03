package a592070.dao;

import a592070.pojo.AttractionDO;

import java.util.List;

public interface AttractionDAO {

    int getSize();
    AttractionDO getEle(int id);

    int getSizeByKeywords(String keyWords);
    List<AttractionDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled);

    int getSizeByFiled(String filedName, String filedValue);
    List<AttractionDO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled);

    List<AttractionDO> listByRownum(int firstIndex, int resultSize, String orderFiled);

    AttractionDO insert(AttractionDO ele);
    AttractionDO update(AttractionDO ele);
    AttractionDO delete(AttractionDO ele);
}
