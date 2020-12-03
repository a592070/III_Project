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

import static a592070.service.TravelSetService.*;

public class TravelSetDAOImpl implements TravelSetDAO{
    @Autowired
    private SessionFactory sessionFactory;

    public TravelSetDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public TravelSetDO getTravelSetByID(Integer id, boolean loadFetch, boolean findFromPersistence){
        Session session = sessionFactory.getCurrentSession();

        TravelSetDO travelSetDO;
        if(findFromPersistence) {
            travelSetDO = session.find(TravelSetDO.class, id);
        }else{
            travelSetDO = session.get(TravelSetDO.class, id);
        }
        if(travelSetDO!=null && loadFetch){
            travelSetDO.getTravelAttractions().size();
            travelSetDO.getTravelCars().size();
            travelSetDO.getTravelHotels().size();
            travelSetDO.getTravelRestaurants().size();
        }
        return travelSetDO;
    }

    @Override
    public int getSize() {
        String hql = "select count(sn) from TravelSetDO ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSize(boolean status) {
        String hql = "select count(sn) from TravelSetDO where status=:status ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("status", status);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        String hql = "from TravelSetVO order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<TravelSetVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean status) {
        String hql = "from TravelSetVO where status=:status order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("status", status);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByIdentity(Integer identity) {
        String hql = "select count(sn) from TravelSetVO where identity=:identity ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("identity", identity);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByIdentity( Integer identity, boolean status) {
        String hql = "select count(sn) from TravelSetVO where identity=:identity and status=:status ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("identity", identity);
        query.setParameter("status", status);
        return query.uniqueResult().intValue();
    }

    public List<TravelSetVO> listTravelSetByIdentity(int firstIndex, int resultSize, Integer identity, String orderFiled, boolean descending) {
        String hql = "from TravelSetVO where identity=:identity ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("identity", identity);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    public List<TravelSetVO> listTravelSetByIdentity(int firstIndex, int resultSize, Integer identity, String orderFiled, boolean descending, boolean status) {
        String hql = "from TravelSetVO where identity=:identity and status=:status ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("identity", identity);
        query.setParameter("status", status);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        String hql = "select count(sn) from TravelSetVO " +
                "where str(sn) like :keyWords or createdUser like :keyWords or description like :keyWords or name like :keyWords ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyWords", keyWords);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByKeywords(String keyWords, boolean status) {
        String hql = "select count(sn) from TravelSetVO " +
                "where status=:status and " +
                "(str(sn) like :keyWords or createdUser like :keyWords or description like :keyWords or name like :keyWords) ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyWords", keyWords);
        query.setParameter("status", status);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending) {
        String hql = "from TravelSetVO where str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("keywords", keywords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<TravelSetVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean status) {
        String hql = "from TravelSetVO " +
                "where status=:status and " +
                "(str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords) ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("keywords", keywords);
        query.setParameter("status", status);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public int getSizeBySelect(Integer identity, String keywords) {
        String hql = "select count(sn) from TravelSetVO " +
                "where identity=:identity and ( str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords )";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("identity", identity);
        query.setParameter("keywords", keywords);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeBySelect(Integer identity, String keywords, boolean status) {
        String hql = "select count(sn) from TravelSetVO " +
                "where identity=:identity and status=:status and " +
                "(str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords) ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keywords", keywords);
        query.setParameter("identity", identity);
        query.setParameter("status", status);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetVO> listBySelect(int firstIndex, int resultSize, Integer identity, String keywords, String orderFiled, boolean descending) {
        String hql = "from TravelSetVO where identity=:identity and " +
                "( str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords ) ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("identity", identity);
        query.setParameter("keywords", keywords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<TravelSetVO> listBySelect(int firstIndex, int resultSize, Integer identity, String keywords, String orderFiled, boolean descending, boolean status) {
        String hql = "from TravelSetVO " +
                "where identity=:identity and status=:status and " +
                "(str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords) ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("identity", identity);
        query.setParameter("keywords", keywords);
        query.setParameter("status", status);
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
        return (TravelSetDO) sessionFactory.getCurrentSession().merge(travelSetDO);
    }

    @Override
    public void removeTravelSet(TravelSetDO travelSetDO) {
        sessionFactory.getCurrentSession().delete(travelSetDO);
    }

    @Override
    public void switchTravelSetStatus(Integer sn) {
        TravelSetDO travelSetDO = getTravelSetByID(sn, false, true);
        travelSetDO.setStatus(!travelSetDO.getStatus());
    }
}
