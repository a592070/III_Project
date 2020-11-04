package a592070.dao;

import a592070.pojo.RegionDO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class RegionDAOImpl implements RegionDAO{
    @Autowired
    private SessionFactory sessionFactory;

    public RegionDAOImpl(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<RegionDO> listRegion(){
        return sessionFactory.getCurrentSession().createQuery("from RegionDO order by area", RegionDO.class).list();
    }

}
