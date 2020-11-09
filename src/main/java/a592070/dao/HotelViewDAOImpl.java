package a592070.dao;

import a592070.pojo.AttractionVO;
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

    /**
     * NOT USING
     * @param id
     * @return
     */
    @Deprecated
    @Override
    public byte[] getPicture(int id) {
        return null;
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select count(sn) from HotelVO where region like :region and (name like :keyword or address like :keyword or description like :keyword)";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<HotelVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "from HotelVO where region like :region and (name like :keyword or address like :keyword or description like :keyword) order by "+orderFiled;
        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

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
    public List<HotelVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled) {
        filedValue = "%" + filedValue + "%";

        String hql = "from HotelVO where "+filedName+" like ?1  order by "+orderFiled;

        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setParameter(1, filedValue);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<HotelVO> listByRownum(int firstIndex, int resultSize, String orderFiled) {
        String hql = "from CarVO order by "+orderFiled;
        Query<HotelVO> query = sessionFactory.getCurrentSession().createQuery(hql, HotelVO.class);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }
}
