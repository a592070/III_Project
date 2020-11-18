package a592070.dao;

import a592070.pojo.AttractionDO;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import utils.StringUtil;

import java.util.List;

public class AttractionDAOImpl extends AttractionDAO{
    @Autowired
    private SessionFactory sessionFactory;

    public AttractionDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public AttractionDO getEle(int id) {
        return sessionFactory.getCurrentSession().get(AttractionDO.class, id);
    }

    @Override
    public AttractionDO insert(AttractionDO ele) {
        sessionFactory.getCurrentSession().save(ele);
        return ele;
    }


    @Override
    public AttractionDO update(AttractionDO ele) {
        return (AttractionDO)sessionFactory.getCurrentSession().merge(ele);

    }

    @Override
    public void delete(AttractionDO ele) {
        sessionFactory.getCurrentSession().delete(ele);
    }

    public void removePic(AttractionDO attractionDO, int picId) {
        attractionDO.getAttractionPic().removeIf(ele -> ele.getId()==picId);
    }

    public void addPic(AttractionDO attractionDO, byte[] pic) {

    }
}
