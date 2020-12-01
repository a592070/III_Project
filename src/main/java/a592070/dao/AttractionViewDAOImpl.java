package a592070.dao;

import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;
import a592070.pojo.AttractionVO;
import org.hibernate.Hibernate;
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
    public AttractionVO getEle(Integer id, boolean findFromPersistence) {
        Session session = sessionFactory.getCurrentSession();
        if(findFromPersistence){
            return session.find(AttractionVO.class, id);
        }else{
            return session.get(AttractionVO.class, id);
        }
    }

    @Override
    public byte[] getPicture(Integer id) {
        return ((AttractionPictureDO)getPictures(id).get(0)).getPicture();
    }

    @Override
    public List getPictures(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from AttractionPictureDO where attraction.sn = ?1 order by id";
        Query<AttractionPictureDO> query = session.createQuery(hql, AttractionPictureDO.class);
        query.setParameter(1, id);

        return query.list();
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";


        String hql = "select count(sn) from AttractionDO " +
                "where region like :region and " +
                "( str(sn) like :keyword or name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword) ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending) {
        keyWords = "%"+keyWords+"%";
        region = "%"+region+"%";

        String hql = "select vo from AttractionDO do , AttractionVO vo " +
                "where (do.sn=vo.sn) and (do.region like :region) and " +
                "( str(do.sn) like :keyword or do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                "order by vo."+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter("keyword", keyWords);
        query.setParameter("region", region);

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
    public List<AttractionVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending){
        filedValue = "%" + filedValue + "%";

        String hql = "select vo from AttractionDO do, AttractionVO vo where (do.sn=vo.sn) and (do."+filedName+" like ?1 ) order by vo."+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";


        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter(1, filedValue);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<AttractionVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending){

        String hql = "from AttractionVO order by "+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", sn";

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }
}