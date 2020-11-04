package a592070.dao;

import a592070.pojo.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

public class TravelSetDAOImpl implements TravelSetDAO{
    @Autowired
    private SessionFactory sessionFactory;

    public TravelSetDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<TravelSetDO> listTravelSet(String created, int available){
        String hql = "from TravelSetDO where createdUser=?1 and available=?2 order by priority desc ";
        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter(1, created);
        query.setParameter(2, available);

        List<TravelSetDO> list = query.list();

        return list;
    }

    @Override
    public TravelSetDO getTravelSetByID(int id, int available){
        String hql = "from TravelSetDO where sn=?1 and available=?2 order by sn";
        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter(1, id);
        query.setParameter(2, available);

        TravelSetDO travelSetDO = query.uniqueResultOptional().orElse(null);

        return travelSetDO;
    }

    @Override
    public List<TravelEleAttractionDO> getAttractionSetByID(int id){
        String hql = "from TravelEleAttractionDO where travelSetDO.sn = ?1";
        Query<TravelEleAttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleAttractionDO.class);
        query.setParameter(1, id);

        return query.list();
    }

    @Override
    public List<TravelEleCarDO> getCarSetByID(int id) {
        String hql = "from TravelEleCarDO where travelSetDO.id = ?1";
        Query<TravelEleCarDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleCarDO.class);
        query.setParameter(1, id);

        return query.list();
    }

    @Override
    public List<TravelEleHotelDO> getHotelSetByID(int id) {
        String hql = "from TravelEleHotelDO where travelSetDO.id = ?1";
        Query<TravelEleHotelDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleHotelDO.class);
        query.setParameter(1, id);

        return query.list();
    }

    @Override
    public List<TravelEleRestaurantDO> getRestaurantSetByID(int id) {
        String hql = "from TravelEleRestaurantDO where travelSetDO.id = ?1";
        Query<TravelEleRestaurantDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleRestaurantDO.class);
        query.setParameter(1, id);

        return query.list();
    }

    @Override
    public void addTravelSet(TravelSetDO travelSetDO){
        travelSetDO.setAvailable(1);
        sessionFactory.getCurrentSession().save(travelSetDO);
    }

    @Override
    public void updateTravelSet(TravelSetDO travelSetDO) {
        travelSetDO.setAvailable(1);
        sessionFactory.getCurrentSession().merge(travelSetDO);
    }

    @Override
    public void setTravelSetUnavailable(int sn) {
        TravelSetDO travelSetDO = sessionFactory.getCurrentSession().get(TravelSetDO.class, sn);
        travelSetDO.setAvailable(0);
    }
}
