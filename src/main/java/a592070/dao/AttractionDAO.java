package a592070.dao;

import a592070.pojo.AttractionDO;

import java.util.List;

public abstract class AttractionDAO implements ModifyDAO<AttractionDO>{

//    public abstract AttractionDO insert(AttractionDO attractionDO);
//    public abstract AttractionDO update(AttractionDO attractionDO);
//    public abstract AttractionDO delete(AttractionDO attractionDO);

    public abstract  AttractionDO getEle(Integer id, boolean findFromPersistence);
}
