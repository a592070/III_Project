package a592070.dao;

import a592070.pojo.RestaurantVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
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
    public byte[] getPicture(int id) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery nativeQuery = session.createNativeQuery("select picture from restaurant where r_sn = ?1");
        nativeQuery.setParameter(1, id);
        Object o = nativeQuery.uniqueResult();
        if(o != null) {
            return (byte[])o;
        }else{
            return null;
        }
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select count(sn) from RestaurantVO " +
                "where region like :region and (name like :keyword or type like :keyword or address like :keyword or description like :keyword) ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<RestaurantVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "from RestaurantVO " +
                "where region like :region and ( name like :keyword or type like :keyword or address like :keyword or description like :keyword) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue){
        filedValue = "%" + filedValue + "%";

        String hql = "select count(sn) from RestaurantVO where "+filedName+" like ?1";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<RestaurantVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending) {
        filedValue = "%"+filedValue+"%";

        String hql = "from RestaurantVO where "+filedName+" like ?1 order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter(1, filedValue);

        return query.list();
    }

    @Override
    public List<RestaurantVO> listByRownum(int startIndex, int endIndex, String orderFiled, boolean descending) {
        String hql = "from RestaurantVO order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);

        query.setFirstResult(startIndex);
        query.setMaxResults(endIndex);

        return query.list();
    }
}
