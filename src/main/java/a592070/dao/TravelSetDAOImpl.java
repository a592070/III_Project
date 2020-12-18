package a592070.dao;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import rambo0021.pojo.AccountBean;

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
//            travelSetDO.getCreatedUser().getUserName();
            travelSetDO.getTravelAttractions().size();
//            travelSetDO.getTravelCars().size();
            travelSetDO.getTravelHotels().size();
            travelSetDO.getTravelRestaurants().size();
        }
        return travelSetDO;
    }

    @Override
    public boolean checkUser(String username) {
        String hql = "from AccountBean where userName = :username";
        Session session = sessionFactory.getCurrentSession();
        Query<AccountBean> query = session.createQuery(hql, AccountBean.class);
        query.setParameter("username", username);
        return !query.list().isEmpty();
    }

    @Override
    public int getSize() {
        String hql = "select count(sn) from TravelSetVO ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSize(boolean status) {
        String hql = "select count(sn) from TravelSetVO where status=:status ";
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
        String hql = "";
        if(identity == 1) {
            // find admin
            hql += "select count(sn) from TravelSetVO where identity=:admin ";
        }else if(identity == 2){
            // find normal user
            hql += "select count(sn) from TravelSetVO where identity!=:admin ";
        }else{
            return getSize();
        }
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("admin", ADMIN_ID);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByIdentity( Integer identity, boolean status) {
        String hql = "select count(sn) from TravelSetVO where ";
        if(identity == 1) {
            // find admin
            hql += " identity=:admin and ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin and ";
        }else{
            return getSize(status);
        }
        hql += "status=:status ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("admin", ADMIN_ID);
        query.setParameter("status", status);
        return query.uniqueResult().intValue();
    }

    public List<TravelSetVO> listTravelSetByIdentity(int firstIndex, int resultSize, Integer identity, String orderFiled, boolean descending) {
        String hql = "from TravelSetVO where ";
        if(identity == 1) {
            // find admin
            hql += " identity=:admin ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin ";
        }else{
            return listByRownum(firstIndex, resultSize, orderFiled, descending);
        }
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("admin", ADMIN_ID);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    public List<TravelSetVO> listTravelSetByIdentity(int firstIndex, int resultSize, Integer identity, String orderFiled, boolean descending, boolean status) {
        String hql = "from TravelSetVO where ";
        if(identity == 1) {
            // find admin
            hql += " identity=:admin and ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin and ";
        }else{
            return listByRownum(firstIndex, resultSize, orderFiled, descending, status);
        }
        hql += " status=:status order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("admin", ADMIN_ID);
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
        String hql = "select count(sn) from TravelSetVO where ";
        if(identity == 1) {
            // find admin
            hql += " identity=:admin and ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin and ";
        }else{
            return getSizeByKeywords(keywords);
        }
        hql += "( str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords )";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("admin", ADMIN_ID);
        query.setParameter("keywords", keywords);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeBySelect(Integer identity, String keywords, boolean status) {
        String hql = "select count(sn) from TravelSetVO where ";
        if(identity == 1) {
            // find admin
            hql += " identity=:admin and ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin and ";
        }else{
            return getSizeByKeywords(keywords, status);
        }
        hql += " status=:status and (str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords)";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keywords", keywords);
        query.setParameter("admin", ADMIN_ID);
        query.setParameter("status", status);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<TravelSetVO> listBySelect(int firstIndex, int resultSize, Integer identity, String keywords, String orderFiled, boolean descending) {
        String hql = "from TravelSetVO where ";
        if(identity == 1) {
            // find admin
            hql += " identity=:admin and ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin and ";
        }else{
            return listByKeywords(firstIndex, resultSize, keywords, orderFiled, descending);
        }
        hql += "( str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords ) ";
        hql += " order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("admin", ADMIN_ID);
        query.setParameter("keywords", keywords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<TravelSetVO> listBySelect(int firstIndex, int resultSize, Integer identity, String keywords, String orderFiled, boolean descending, boolean status) {
        String hql = "from TravelSetVO where ";

        if(identity == 1) {
            // find admin
            hql += " identity=:admin and ";
        }else if(identity == 2){
            // find normal user
            hql += " identity!=:admin and ";
        }else{
            return listByKeywords(firstIndex, resultSize, keywords, orderFiled, descending, status);
        }
        hql += " status=:status and (str(sn) like :keywords or createdUser like :keywords or description like :keywords or name like :keywords) ";
        hql += "order by "+orderFiled;
        if(descending) hql += " desc";
        if(!SN.equals(orderFiled)) hql += ", sn";

        Query<TravelSetVO> query = sessionFactory.getCurrentSession().createQuery(hql, TravelSetVO.class);
        query.setParameter("admin", ADMIN_ID);
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
