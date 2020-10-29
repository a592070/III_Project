package a592070.dao;

import a592070.pojo.HotelVO;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import utils.StringUtil;

import java.util.List;

public class HotelViewDAOImpl implements ViewDAO<HotelVO>{
    @Autowired
    private SessionFactory sessionFactory;

    public HotelViewDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int getSize() {
        Query<Long> query = sessionFactory.getCurrentSession().createQuery("select count(sn) from HotelVO", Long.class);
        return query.uniqueResult().intValue();
    }

    @Override
    public HotelVO getEle(int id) {
        return sessionFactory.getCurrentSession().get(HotelVO.class, id);
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "select count(sn) from HotelVO where name like ?1 or address like ?2 or description like ?3";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<HotelVO> listByKeywords(int firstIndex, int resultSize, String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "from HotelVO where name like ?1 or address like ?2 or description like ?3";
        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByRegion(String region) {
        return 0;
    }

    @Override
    public List<HotelVO> listByRownum(int firstIndex, int resultSize, String region) {
        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery("from CarVO order by sn", HotelVO.class);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }
}
