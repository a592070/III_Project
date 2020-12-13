package a592070.dao;

import a592070.pojo.HotelVO;
import a592070.pojo.RestaurantVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.View;
import utils.StringUtil;

import java.util.ArrayList;
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
    public int getSize(boolean available) {
        String hql = "select count(sn) from RestaurantVO where status = :available";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("available", available);
        return query.uniqueResult().intValue();
    }

    @Override
    public RestaurantVO getEle(Integer id, boolean findFromPersistence) {
        Session session = sessionFactory.getCurrentSession();
        if(findFromPersistence){
            return session.find(RestaurantVO.class, id);
        }else{
            return session.get(RestaurantVO.class, id);
        }
    }

    @Override
    public RestaurantVO getEle(Integer id, boolean findFromPersistence, boolean available) {
        Session session = sessionFactory.getCurrentSession();
        RestaurantVO restaurantVO = null;
        if(findFromPersistence){
            restaurantVO = session.find(RestaurantVO.class, id);
            return restaurantVO.getStatus() ? restaurantVO:null;
        }else{
            restaurantVO = session.get(RestaurantVO.class, id);
            return (restaurantVO!=null && restaurantVO.getStatus()) ? restaurantVO:null;
        }
    }

    @Override
    public byte[] getPicture(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        NativeQuery nativeQuery = session.createNativeQuery("select picture from restaurant where r_sn = ?1");
        nativeQuery.setParameter(1, id);
        Object o = nativeQuery.uniqueResult();
        if(o != null) {
//            List<byte[]> list = new ArrayList<>();
//            list.add((byte[])o);
            return (byte[])o;
        }else{
            return null;
        }
    }

    @Override
    public List<byte[]> getPictures(Integer id) {
        return null;
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select count(sn) from RestaurantVO " +
                "where region like :region and (str(sn) like :keyword or name like :keyword or type like :keyword or address like :keyword or description like :keyword) ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region, boolean available) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select count(sn) from RestaurantVO " +
                "where (status = :available) and region like :region and (str(sn) like :keyword or name like :keyword or type like :keyword or address like :keyword or description like :keyword) ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);
        query.setParameter("available", available);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<RestaurantVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "from RestaurantVO " +
                "where region like :region and (str(sn) like :keyword or name like :keyword or type like :keyword or address like :keyword or description like :keyword) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<RestaurantVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending, boolean available) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "from RestaurantVO " +
                "where (status = :available) and region like :region and (str(sn) like :keyword or name like :keyword or type like :keyword or address like :keyword or description like :keyword) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);
        query.setParameter("available", available);

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
    public int getSizeByFiled(String filedName, String filedValue, boolean available) {
        filedValue = "%" + filedValue + "%";

        String hql = "select count(sn) from RestaurantVO where (status = :available) and "+filedName+" like ?1";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);
        query.setParameter("available", available);

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
    public List<RestaurantVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending, boolean available) {
        filedValue = "%"+filedValue+"%";

        String hql = "from RestaurantVO where (status = :available) and "+filedName+" like ?1 order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter(1, filedValue);
        query.setParameter("available", available);

        return query.list();
    }

    @Override
    public List<RestaurantVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        String hql = "from RestaurantVO order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<RestaurantVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        String hql = "from RestaurantVO where (status = :available) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<RestaurantVO> query = sessionFactory.getCurrentSession().createQuery(hql, RestaurantVO.class);
        query.setParameter("available", available);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }
}
