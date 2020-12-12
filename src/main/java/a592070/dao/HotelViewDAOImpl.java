package a592070.dao;

import a592070.pojo.AttractionVO;
import a592070.pojo.CarVO;
import a592070.pojo.HotelVO;
import asx54630.model.Hotel;
import org.hibernate.Session;
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
    public int getSize(boolean available) {
        Query<Long> query = sessionFactory.getCurrentSession().createQuery("select count(sn) from HotelVO where status = :available", Long.class);
        query.setParameter("available", available);
        return query.uniqueResult().intValue();
    }

    @Override
    public HotelVO getEle(Integer id, boolean findFromPersistence) {
        Session session = sessionFactory.getCurrentSession();
        if(findFromPersistence){
            return session.find(HotelVO.class, id);
        }else{
            return session.get(HotelVO.class, id);
        }
    }

    @Override
    public HotelVO getEle(Integer id, boolean findFromPersistence, boolean available) {
        Session session = sessionFactory.getCurrentSession();
        HotelVO hotelVO = null;
        if(findFromPersistence){
            hotelVO = session.find(HotelVO.class, id);
            return hotelVO.getStatus() ? hotelVO:null;
        }else{
            hotelVO = session.get(HotelVO.class, id);
            return (hotelVO!=null && hotelVO.getStatus()) ? hotelVO:null;
        }
    }

    /**
     * NOT USING
     * @param id
     * @return
     */
    @Deprecated
    @Override
    public byte[] getPicture(Integer id) {
        return null;
    }

    @Deprecated
    @Override
    public List<byte[]> getPictures(Integer id) {
        return null;
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select count(sn) from HotelVO where region like :region and (str(sn) like :keyword or name like :keyword or address like :keyword or description like :keyword)";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region, boolean available) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select count(sn) from HotelVO where (status=:available) and (region like :region) and (str(sn) like :keyword or name like :keyword or address like :keyword or description like :keyword)";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);
        query.setParameter("available", available);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<HotelVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "from HotelVO where region like :region and (str(sn) like :keyword or name like :keyword or address like :keyword or description like :keyword) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<HotelVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending, boolean available) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "from HotelVO where (status=:available) and (region like :region) and (str(sn) like :keyword or name like :keyword or address like :keyword or description like :keyword) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);
        query.setParameter("available", available);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue) {
        filedValue = "%" + filedValue + "%";

        String hql = "select count(sn) from HotelVO where "+filedName+" like ?1 ";


        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue, boolean available) {
        filedValue = "%" + filedValue + "%";

        String hql = "select count(sn) from HotelVO where (status=:available) and "+filedName+" like ?1 ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);
        query.setParameter("available", available);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<HotelVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending) {
        filedValue = "%" + filedValue + "%";

        String hql = "from HotelVO where "+filedName+" like ?1  order by "+orderFiled;
        if(descending) hql += " desc";

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter(1, filedValue);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<HotelVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending, boolean available) {
        filedValue = "%" + filedValue + "%";

        String hql = "from HotelVO where (status=:available) and "+filedName+" like ?1  order by "+orderFiled;
        if(descending) hql += " desc";

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter(1, filedValue);
        query.setParameter("available", available);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<HotelVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        String hql = "from HotelVO order by "+orderFiled;
        if(descending) hql += " desc";

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<HotelVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        String hql = "from HotelVO where (status=:available) order by "+orderFiled;
        if(descending) hql += " desc";

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter("available", available);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }
}
