package a592070.dao;

import a592070.pojo.CarVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import utils.StringUtil;

import java.util.List;

public class CarViewDAOImpl implements ViewDAO<CarVO>{
    @Autowired
    private SessionFactory sessionFactory;

    public CarViewDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public int getSize() {
        String hql="select count(sn) from CarVO";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        return query.uniqueResult().intValue();
    }

    @Override
    public CarVO getEle(int id) {
        return sessionFactory.getCurrentSession().get(CarVO.class, id);
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }
        String hql = "select count(sn) from CarVO where carType like ?1 or company like ?2";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<CarVO> listByKeywords(int firstIndex, int resultSize, String keyWords){
        if(StringUtil.isEmpty(keyWords)) {
            keyWords="";
        }else {
            keyWords = "%"+keyWords+"%";
        }

        String hql = "from CarVO where carType like ?1 or company like ?2 order by sn";

        Query<CarVO> query = sessionFactory.getCurrentSession().createQuery(hql, CarVO.class);
        query.setParameter(1, keyWords);
        query.setParameter(2, keyWords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByRegion(String region) {
        return 0;
    }

    @Override
    public List<CarVO> listByRownum(int firstIndex, int resultSize, String region) {
        String hql="from CarVO order by sn";

        Query<CarVO> query = sessionFactory.getCurrentSession().createQuery(hql, CarVO.class);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

}
