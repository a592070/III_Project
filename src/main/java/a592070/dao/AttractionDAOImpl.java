package a592070.dao;

import a592070.pojo.AttractionDO;
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
        keyWords = "%"+keyWords+"%";

        String hql = "select count(sn) from AttractionDO where name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
//        query.setParameter(2, keyWords);
//        query.setParameter(3, keyWords);
//        query.setParameter(4, keyWords);
//        query.setParameter(5, keyWords);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled) {
        keyWords = "%"+keyWords+"%";

        String hql = "from AttractionDO where name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword order by "+orderFiled;

        Query<AttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionDO.class);
        query.setParameter("keyword", keyWords);
//        query.setParameter(2, keyWords);
//        query.setParameter(3, keyWords);
//        query.setParameter(4, keyWords);
//        query.setParameter(5, keyWords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue) {
        filedValue = "%" + filedValue + "%";

        String hql = "select count(sn) from AttractionDO where "+filedName+" like ?1 ";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);

        return query.uniqueResult().intValue();
    }
    @Override
    public List<AttractionDO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled){
        filedValue = "%" + filedValue + "%";

        String hql = "from AttractionDO where "+filedName+" like ?1  order by "+orderFiled;
        Query<AttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionDO.class);
        query.setParameter(1, filedValue);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<AttractionDO> listByRownum(int firstIndex, int resultSize, String orderFiled){

        String hql = "from AttractionDO order by "+orderFiled;
        Query<AttractionDO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionDO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public AttractionDO insert(AttractionDO ele) {
        try{
            sessionFactory.getCurrentSession().save(ele);
            return ele;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public AttractionDO update(AttractionDO ele) {
        try{
            sessionFactory.getCurrentSession().merge(ele);
            return ele;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public AttractionDO delete(AttractionDO ele) {
        try{
            sessionFactory.getCurrentSession().delete(ele);
            return ele;
        }catch (Exception e){
            return null;
        }
    }

}
