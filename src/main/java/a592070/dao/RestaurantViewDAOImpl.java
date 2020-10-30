package a592070.dao;

import a592070.pojo.RestaurantVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.View;
import utils.StringUtil;

import java.util.List;

public class RestaurantViewDAOImpl implements ViewDAO<RestaurantVO> {
    @Autowired
    private SessionFactory sessionFactory;

    public RestaurantViewDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int getSize(){
        String hql = "select count(sn) from RestaurantVO";

        return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
    }

    @Override
    public RestaurantVO getEle(int id) {
        return sessionFactory.getCurrentSession().get(RestaurantVO.class, id);
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "select count(sn) from RestaurantVO where name like ?1 or type like ?2 or address like ?3 or description like ?4";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);
        query.setParameter(4, keyWords);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<RestaurantVO> listByKeywords(int firstIndex, int resultSize, String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "select count(sn) from RestaurantVO where name like ?1 or type like ?2 or address like ?3 or description like ?4 order by sn";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setParameter(3, keyWords);
        query.setParameter(4, keyWords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public int getSizeByRegion(String region){
        if(StringUtil.isEmpty(region)){
            region = "";
        }else {
            region = "%" + region + "%";
        }

        String hql = "select count(sn) from RestaurantVO where region like ?1";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, region);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<RestaurantVO> listByRownum(int startIndex, int endIndex, String region) {
        if(StringUtil.isEmpty(region)){
            region = "";
        }else {
            region = "%" + region + "%";
        }
        String hql = "from RestaurantVO where region like ?1 order by sn";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter(1, region);

        query.setFirstResult(startIndex);
        query.setMaxResults(endIndex);

        return query.list();
    }
}
