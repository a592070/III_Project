package a592070.dao;

import a592070.fieldenum.AttractionFiledName;
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
    public TravelSetDO getTravelSetByID(Integer id, boolean findFromPersistence){
        Session session = sessionFactory.getCurrentSession();

        TravelSetDO travelSetDO;
        if(findFromPersistence) {
            travelSetDO = session.get(TravelSetDO.class, id);
        }else{
            travelSetDO = session.find(TravelSetDO.class, id);
        }
        return travelSetDO;
    }

    @Override
    public int getSize() {
        String hql = "select count(sn) from TravelSetDO";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSize(boolean available) {
        String hql = "select count(sn) from TravelSetDO where available=:available";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("available", available);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        String hql = "from TravelSetDO order by "+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", sn";

        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        String hql = "from TravelSetDO where available=:available order by "+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", sn";

        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter("available", available);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByCreated(String created) {
        return 0;
    }

    @Override
    public int getSizeByCreated(String created, boolean available) {
        return 0;
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(String created) {
        return null;
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(String created, boolean available) {
        return null;
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        return 0;
    }

    @Override
    public int getSizeByKeywords(String keyWords, boolean available) {
        return 0;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled, boolean descending, boolean available) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public TravelSetDO addTravelSet(TravelSetDO travelSetDO) {
        return null;
    }

    @Override
    public TravelSetDO updateTravelSet(TravelSetDO travelSetDO) {
        return null;
    }

    @Override
    public boolean setTravelSetUnavailable(int sn) {
        return false;
    }

//    @Override
//    public List<TravelSetDO> listTravelSet(String created, Integer available){
//        String hql = "from TravelSetDO where createdUser=?1 and available=?2 order by priority desc ";
//        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
//        query.setParameter(1, created);
//        query.setParameter(2, available);
//
//        List<TravelSetDO> list = query.list();
//
//        return list;
//    }
//
//
//    @Override
//    public List<TravelEleAttractionDO> getAttractionSetByID(Integer id){
//        String hql = "from TravelEleAttractionDO where travelSetDO.sn = ?1";
//        Query<TravelEleAttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleAttractionDO.class);
//        query.setParameter(1, id);
//
//        return query.list();
//    }
//
//    @Override
//    public List<TravelEleCarDO> getCarSetByID(Integer id) {
//        String hql = "from TravelEleCarDO where travelSetDO.id = ?1";
//        Query<TravelEleCarDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleCarDO.class);
//        query.setParameter(1, id);
//
//        return query.list();
//    }
//
//    @Override
//    public List<TravelEleHotelDO> getHotelSetByID(Integer id) {
//        String hql = "from TravelEleHotelDO where travelSetDO.id = ?1";
//        Query<TravelEleHotelDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleHotelDO.class);
//        query.setParameter(1, id);
//
//        return query.list();
//    }
//
//    @Override
//    public List<TravelEleRestaurantDO> getRestaurantSetByID(Integer id) {
//        String hql = "from TravelEleRestaurantDO where travelSetDO.id = ?1";
//        Query<TravelEleRestaurantDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelEleRestaurantDO.class);
//        query.setParameter(1, id);
//
//        return query.list();
//    }
//
//    @Override
//    public TravelSetDO addTravelSet(TravelSetDO travelSetDO){
//        try {
//            travelSetDO.setAvailable(1);
//            sessionFactory.getCurrentSession().save(travelSetDO);
//            return travelSetDO;
//        }catch (Exception e){
//            return null;
//        }
//    }
//
//    @Override
//    public TravelSetDO updateTravelSet(TravelSetDO travelSetDO) {
//        travelSetDO.setAvailable(1);
//        try{
//            sessionFactory.getCurrentSession().update(travelSetDO);
//            return travelSetDO;
//        }catch (Exception e){
//            return null;
//        }
//    }
//
//    @Override
//    public boolean setTravelSetUnavailable(Integer sn) {
//        try {
//            TravelSetDO travelSetDO = sessionFactory.getCurrentSession().get(TravelSetDO.class, sn);
//            travelSetDO.setAvailable(0);
//            return true;
//        }catch (Exception e){
//            return false;
//        }
//    }
}
