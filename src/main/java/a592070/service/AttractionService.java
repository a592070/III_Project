package a592070.service;

import a592070.pojo.AttractionDO;

public interface AttractionService {
    AttractionDO getEle(int id);
    AttractionDO insert(AttractionDO attractionDO);
    AttractionDO update(AttractionDO attractionDO);
    boolean delete(int id);
}
