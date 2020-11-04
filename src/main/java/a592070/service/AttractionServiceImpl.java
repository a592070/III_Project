package a592070.service;

import a592070.dao.AttractionDAO;
import a592070.pojo.AttractionDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class AttractionServiceImpl implements AttractionService{
    @Autowired@Qualifier("attractionDao")
    private AttractionDAO dao;

    @Override
    public AttractionDO getEle(int id){
        return dao.getEle(id);
    }

    @Override
    public AttractionDO insert(AttractionDO attractionDO) {
        return dao.insert(attractionDO);
    }

    @Override
    public AttractionDO update(AttractionDO attractionDO) {
        return dao.update(attractionDO);
    }

    @Override
    public boolean delete(int id) {
        if(getEle(id) != null){
            dao.delete(getEle(id));
            return true;
        }
        return false;
    }
}
