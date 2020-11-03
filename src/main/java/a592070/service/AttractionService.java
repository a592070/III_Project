package a592070.service;

import a592070.pojo.AttractionDO;

import java.util.List;

public interface AttractionService {
    AttractionDO getEle(int id);

    int getSize();

    int getSizeByRegion(String region);

    List<AttractionDO> listByRegion(int currentPage, int pageSize, String region);

    List<AttractionDO> listByRegion(int currentPage, int pageSize, String region, String orderFiled);

    List<AttractionDO> list(int currentPage, int pageSize);

    List<AttractionDO> list(int currentPage, int pageSize, String orderFiled);

    int getSizeByKeyWords(String keywords);

    List<AttractionDO> listByKeyWords(int currentPage, int pageSize, String keywords);

    List<AttractionDO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled);
}
