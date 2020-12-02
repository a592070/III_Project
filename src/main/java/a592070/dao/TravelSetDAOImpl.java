package a592070.dao;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;
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
        String hql = "select count(sn) from TravelSetDO where createdUser=:created";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("created", created);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByCreated(String created, boolean available) {
        String hql = "select count(sn) from TravelSetDO where createdUser=:created";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("created", created);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled, boolean descending) {
        String hql = "from TravelSetDO where createdUser=:created ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc, sn";
        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter("created", created);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, boolean available, String orderFiled, boolean descending) {
        String hql = "from TravelSetDO where createdUser=:created and available=:available ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc, sn";
        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter("created", created);
        query.setParameter("available", available);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        String hql = "select count(sn) from TravelSetDO " +
                "where str(sn) like :keyWords or createdUser like :keyWords or description like :keyWords or name like :keyWords";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyWords", keyWords);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByKeywords(String keyWords, boolean available) {
        String hql = "select count(sn) from TravelSetDO " +
                "where available=:available and " +
                "(str(sn) like :keyWords or createdUser like :keyWords or description like :keyWords or name like :keyWords)";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyWords", keyWords);
        query.setParameter("available", available);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean available) {
        String hql = "from TravelSetDO where str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc, sn";
        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter("keywords", keywords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending) {
        String hql = "from TravelSetDO " +
                "where available=:available and " +
                "(str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords)";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc, sn";
        Query<TravelSetDO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetDO.class);
        query.setParameter("keywords", keywords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public Integer addTravelSet(TravelSetDO travelSetDO){
        return (Integer)sessionFactory.getCurrentSession().save(travelSetDO);
    }

    @Override
    public TravelSetDO updateTravelSet(TravelSetDO travelSetDO) {
        sessionFactory.getCurrentSession().merge(travelSetDO);
        return travelSetDO;
    }

    @Override
    public void switchTravelSetAvailable(Integer sn) {
        TravelSetDO travelSetDO = getTravelSetByID(sn, true);
        travelSetDO.setAvailable(!travelSetDO.getAvailable());
    }
}
