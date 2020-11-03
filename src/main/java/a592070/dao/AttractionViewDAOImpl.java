package a592070.dao;

import a592070.pojo.AttractionVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import utils.StringUtil;

import java.util.List;

public class AttractionViewDAOImpl implements ViewDAO<AttractionVO>{
    @Autowired
    private SessionFactory sessionFactory;

    public AttractionViewDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int getSize() {
        String hql = "select count(sn) from AttractionDO";
        return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
    }

    @Override
    public AttractionVO getEle(int id) {
        return sessionFactory.getCurrentSession().get(AttractionVO.class, id);
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "select count(*) from AttractionDO where name like ?1 or toldescribe like ?2 or description like ?3 or address like ?4 or keywords like ?5 ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);
        query.setParameter(4, keyWords);
        query.setParameter(5, keyWords);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByKeywords(int firstIndex, int resultSize, String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }

        String hql = "select vo from AttractionDO do , AttractionVO vo where (do.sn=vo.sn) and (do.name like ?1 or do.toldescribe like ?2 or do.description like ?3 or do.address like ?4 or do.keywords like ?5 ) order by vo.picture, vo.sn";

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
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
        String hql = "select count(*) from AttractionDO where region like ?1 ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, region);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByRownum(int firstIndex, int resultSize, String region){
        if(StringUtil.isEmpty(region)){
            region = "";
        }else {
            region = "%" + region + "%";
        }

        String hql = "select vo from AttractionDO do, AttractionVO vo where (do.sn=vo.sn) and (do.region like ?1 ) order by vo.picture, vo.sn";

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter(1, region);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }
}
