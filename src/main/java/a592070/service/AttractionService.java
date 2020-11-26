package a592070.service;

import a592070.pojo.AttractionDO;

public interface AttractionService {
    AttractionDO getEle(Integer id);
    AttractionDO save(AttractionDO attractionDO);
//    AttractionDO insert(AttractionDO attractionDO);
//    AttractionDO update(AttractionDO attractionDO);
    boolean delete(Integer id);
}
