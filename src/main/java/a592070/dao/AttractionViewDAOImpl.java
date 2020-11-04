package a592070.dao;

import a592070.pojo.AttractionDO;
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
        String hql = "select count(*) from AttractionDO " +
                "where name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("keyword", keyWords);

        return query.uniqueResult().intValue();
    }
    @Override
    public List<AttractionVO> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled) {
        keyWords = "%"+keyWords+"%";

        String hql = "select vo from AttractionDO do , AttractionVO vo " +
                "where (do.sn=vo.sn) and " +
                "(do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                "order by vo."+orderFiled;

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter("keyword", keyWords);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue) {
        filedValue = "%" + filedValue + "%";

        String hql = "select count(*) from AttractionDO where "+filedName+" like ?1 ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter(1, filedValue);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled){
        filedValue = "%" + filedValue + "%";

        String hql = "select vo from AttractionDO do, AttractionVO vo where (do.sn=vo.sn) and (do."+filedName+" like ?1 ) order by vo."+orderFiled;

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter(1, filedValue);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<AttractionVO> listByRownum(int firstIndex, int resultSize, String orderFiled){

        String hql = "from AttractionVO order by "+orderFiled;
        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }
}