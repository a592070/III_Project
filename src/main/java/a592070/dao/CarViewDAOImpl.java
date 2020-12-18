package a592070.dao;

import a592070.pojo.AttractionVO;
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
    public int getSize(boolean available) {
        return getSize();
    }

    @Override
    public CarVO getEle(Integer id, boolean findFromPersistence) {
        Session session = sessionFactory.getCurrentSession();
        if(findFromPersistence){
            return session.find(CarVO.class, id);
        }else{
            return session.get(CarVO.class, id);
        }
    }

    @Override
    public CarVO getEle(Integer id, boolean findFromPersistence, boolean available) {
        return getEle(id, findFromPersistence);
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
    public int getSizeByKeywords(String keywords) {
        keywords = "%"+keywords+"%";

        String hql = "select count(sn) from CarVO where str(sn) like :keyword or carType like :keyword or company like :keyword";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keywords);

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByKeywords(String keywords, boolean available) {
        return getSizeByKeywords(keywords);
    }

    @Override
    public List<CarVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending){
        keywords = "%"+keywords+"%";

        String hql = "from CarVO where str(sn) like :keyword or carType like :keyword or company like :keyword order by "+orderFiled;
        if(descending) hql += " desc";

        Query<CarVO> query = sessionFactory.getCurrentSession().createQuery(hql, CarVO.class);
        query.setParameter("keyword", keywords);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<CarVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean available) {
        return listByKeywords(firstIndex, resultSize, keywords, orderFiled, descending);
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue) {
        filedValue = "%"+filedValue+"%";
        String hql="from CarVO where "+filedName+" like ?1 ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue, boolean available) {
        return getSizeByFiled(filedName, filedValue);
    }

    @Override
    public List<CarVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending) {
        filedValue = "%"+filedValue+"%";
        String hql="from CarVO where "+filedName+" like ?1 order by "+orderFiled;
        if(descending) hql += " desc";

        Query<CarVO> query = sessionFactory.getCurrentSession().createQuery(hql, CarVO.class);
        query.setParameter(1, filedValue);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<CarVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending, boolean available) {
        return listByFiled(firstIndex, resultSize, filedName, filedValue, orderFiled, descending);
    }


    // db no region column
    @Override
    public int getSizeBySelect(String region, String keywords) {
        return getSizeByKeywords(keywords);
    }

    @Override
    public int getSizeBySelect(String region, String keywords, boolean available) {
        return getSizeByKeywords(keywords);
    }

    @Override
    public List<CarVO> listBySelect(int firstIndex, int resultSize, String region, String keywords, String orderFiled, boolean descending) {
        return listByKeywords(firstIndex, resultSize, keywords, orderFiled, descending);
    }

    @Override
    public List<CarVO> listBySelect(int firstIndex, int resultSize, String region, String keywords, String orderFiled, boolean descending, boolean available) {
        return listByKeywords(firstIndex, resultSize, keywords, orderFiled, descending);
    }

    @Override
    public List<CarVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        String hql="from CarVO order by "+orderFiled;
        if(descending) hql += " desc";

        Query<CarVO> query = sessionFactory.getCurrentSession().createQuery(hql, CarVO.class);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);
        return query.list();
    }

    @Override
    public List<CarVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        return listByRownum(firstIndex, resultSize, orderFiled, descending);
    }

}
