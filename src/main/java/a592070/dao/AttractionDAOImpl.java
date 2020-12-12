package a592070.dao;

import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.service.AttractionService;
import org.hibernate.Session;
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
    public AttractionDO getEle(Integer id, boolean findFromPersistence) {
        Session session = sessionFactory.getCurrentSession();
        if(findFromPersistence){
            return session.find(AttractionDO.class, id);
        }else{
            return session.get(AttractionDO.class, id);
        }
    }

    @Override
    public AttractionDO getEle(Integer id, boolean findFromPersistence, boolean available) {
        Session session = sessionFactory.getCurrentSession();

        AttractionDO attraction = null;
        if(findFromPersistence){
            attraction = session.find(AttractionDO.class, id);
            return attraction.getStatus() ? attraction:null;
        }else{
            attraction = session.get(AttractionDO.class, id);
            return (attraction!=null && attraction.getStatus()) ? attraction:null;
        }
    }

    @Override
    public Integer insert(AttractionDO ele) {
        Session session = sessionFactory.getCurrentSession();
        return (Integer)session.save(ele);
    }
    @Override
    public AttractionDO update(AttractionDO ele) {
        return (AttractionDO)sessionFactory.getCurrentSession().merge(ele);
    }
    public AttractionDO save(AttractionDO ele){
        sessionFactory.getCurrentSession().saveOrUpdate(ele);
        return ele;
    }

    @Override
    public void delete(AttractionDO ele) {
        sessionFactory.getCurrentSession().delete(ele);
    }

    @Deprecated
    public void removePic(AttractionDO attractionDO, int picId) {
        attractionDO.getAttractionPic().removeIf(ele -> ele.getId()==picId);
    }
}
