package a592070.dao;

import a592070.pojo.AttractionDO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import utils.StringUtil;

import java.util.List;

public class AttractionDAOImpl implements AttractionDAO{
    @Autowired
    private SessionFactory sessionFactory;

    public AttractionDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int getSize() {
        String hql = "select count(sn) from AttractionDO";
        return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
    }

    @Override
    public AttractionDO getEle(int id) {
        return sessionFactory.getCurrentSession().get(AttractionDO.class, id);
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "select count(sn) from AttractionDO where name like ?1 or toldescribe like ?2 or description like ?3 or address like ?4 or keywords like ?5 ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);
        query.setParameter(4, keyWords);
        query.setParameter(5, keyWords);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionDO> listByKeywords(int firstIndex, int resultSize, String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "from AttractionDO where name like ?1 or toldescribe like ?2 or description like ?3 or address like ?4 or keywords like ?5 order by picture, sn";

        Query<AttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionDO.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);
        query.setParameter(4, keyWords);
        query.setParameter(5, keyWords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByRegion(String region) {
        if(StringUtil.isEmpty(region)){
            region = "";
        }else {
            region = "%" + region + "%";
        }
        String hql = "select count(sn) from AttractionDO where region like ?1 ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, region);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionDO> listByRownum(int firstIndex, int resultSize, String region){
        if(StringUtil.isEmpty(region)){
            region = "";
        }else {
            region = "%" + region + "%";
        }

        String hql = "from AttractionDO where region like ?1  order by picture, sn ";
        Query<AttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionDO.class);
        query.setParameter(1, region);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public void insert(AttractionDO ele) {
        sessionFactory.getCurrentSession().save(ele);
    }

    @Override
    public void update(AttractionDO ele) {
        sessionFactory.getCurrentSession().merge(ele);
    }

    @Override
    public void delete(AttractionDO ele) {
        sessionFactory.getCurrentSession().delete(ele);
    }

}
