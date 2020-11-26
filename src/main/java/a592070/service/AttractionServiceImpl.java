package a592070.service;

import a592070.dao.AttractionDAO;
import a592070.pojo.AttractionDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = {Exception.class})
public class AttractionServiceImpl implements AttractionService{
    @Autowired@Qualifier("attractionDao")
    private AttractionDAO dao;

    @Override
    public AttractionDO getEle(Integer id){
        if(id == null || id==0) return null;
        return dao.getEle(id);
    }

    @Override
    public AttractionDO save(AttractionDO attractionDO) {
        if(attractionDO.getSn() == null || attractionDO.getSn()==0){
            return dao.insert(attractionDO);
        }
        return dao.update(attractionDO);
    }

//    @Override
//    public AttractionDO insert(AttractionDO attractionDO) {
//        return dao.insert(attractionDO);
//    }
//    @Override
//    public AttractionDO update(AttractionDO attractionDO) {
//        return dao.update(attractionDO);
//    }

    @Override
    public boolean delete(Integer id) {
        AttractionDO ele = getEle(id);
        if(ele != null){
            dao.delete(ele);
            return true;
        }
        return false;
    }
}
