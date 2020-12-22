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
    public AttractionVO getEle(Integer id, boolean findFromPersistence) {
        Session session = sessionFactory.getCurrentSession();
        if(findFromPersistence){
            return session.find(AttractionVO.class, id);
        }else{
            return session.get(AttractionVO.class, id);
        }
    }

    @Override
    public AttractionVO getEle(Integer id, boolean findFromPersistence, boolean available) {
        Session session = sessionFactory.getCurrentSession();
        AttractionVO attractionVO = null;
        if(findFromPersistence){
            attractionVO = session.find(AttractionVO.class, id);
            return attractionVO.getStatus() ? attractionVO:null;
        }else{
            attractionVO = session.get(AttractionVO.class, id);
            return (attractionVO!=null && attractionVO.getStatus()) ? attractionVO:null;
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
    public int getSize() {
        String hql = "select count(sn) from AttractionDO";
        return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
    }

    @Override
    public int getSize(boolean available) {
        String hql = "select count(sn) from AttractionDO where status=:available";
        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("available", available);
        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending){
        String hql = "select vo from AttractionVO vo, AttractionDO do where vo.sn = do.sn order by do."+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<AttractionVO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        String hql = "select vo from AttractionVO vo, AttractionDO do where vo.sn = do.sn and vo.status=:available order by do."+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter("available", available);
        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeByKeywords(String keywords) {
        Query<Long> query;

        try {
            int snKeyword = Integer.parseInt(keywords);

            keywords = "%" + keywords + "%";

            String hql = "select count(sn) from AttractionDO " +
                    "where " +
                    " ( sn like :snKeyword or name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword ) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);

        }catch (Exception e){
            e.printStackTrace();

            keywords = "%" + keywords + "%";

            String hql = "select count(sn) from AttractionDO " +
                    "where " +
                    " ( name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword ) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);

        }
        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeByKeywords(String keywords, boolean available) {
        Query<Long> query;

        try {
            int snKeyword = Integer.parseInt(keywords);
            keywords = "%" + keywords + "%";

            String hql = "select count(sn) from AttractionDO " +
                    "where (status=:available) and " +
                    "( sn like :snKeyword or name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);
            query.setParameter("available", available);
        }catch (Exception e){
            e.printStackTrace();
            keywords = "%"+keywords+"%";

            String hql = "select count(sn) from AttractionDO " +
                    "where (status=:available) and " +
                    "( name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("available", available);
        }

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending) {
        Query<AttractionVO> query;

        try {
            int snKeyword = Integer.parseInt(keywords);
            keywords = "%" + keywords + "%";

            String hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (do.sn=vo.sn) and " +
                    "( do.sn like :snKeyword or do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }catch (Exception e){
            e.printStackTrace();
            keywords = "%"+keywords+"%";

            String hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (do.sn=vo.sn) and " +
                    "( do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }

        return query.list();
    }

    @Override
    public List<AttractionVO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean available) {
        Query<AttractionVO> query;

        try {
            int snKeyword = Integer.parseInt(keywords);
            keywords = "%" + keywords + "%";

            String hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (do.status=:available) and (do.sn=vo.sn) and " +
                    "( do.sn like :keyword or do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);
            query.setParameter("available", available);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }catch (Exception e){
            e.printStackTrace();
            keywords = "%"+keywords+"%";

            String hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (do.status=:available) and (do.sn=vo.sn) and " +
                    "( do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("available", available);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }

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
    public int getSizeByFiled(String filedName, String filedValue, boolean available) {
        filedValue = "%" + filedValue + "%";

        String hql = "select count(sn) from AttractionDO where (status=:available) and "+filedName+" like :filedValue ";

        Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
        query.setParameter("filedValue", filedValue);
        query.setParameter("available", available);

        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending){
        filedValue = "%" + filedValue + "%";

        String hql = "select vo from AttractionDO do, AttractionVO vo where (do.sn=vo.sn) and (do."+filedName+" like ?1 ) order by do."+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";


        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter(1, filedValue);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public List<AttractionVO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending, boolean available) {
        filedValue = "%" + filedValue + "%";

        String hql = "select vo from AttractionDO do, AttractionVO vo where (do.status=:available) and (do.sn=vo.sn) and (do."+filedName+" like :filedValue ) order by do."+orderFiled;
        if(descending) hql += " desc";
        if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";


        Query<AttractionVO> query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
        query.setParameter("filedValue", filedValue);
        query.setParameter("available", available);

        query.setFirstResult(firstIndex);
        query.setMaxResults(resultSize);

        return query.list();
    }

    @Override
    public int getSizeBySelect(String region, String keywords) {
        Query<Long> query;

        try{
            int snKeyword = Integer.parseInt(keywords);

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            String hql = "select count(sn) from AttractionDO " +
                    "where region like :region " +
                    "and ( sn like :snKeyword or name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword ) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);
            query.setParameter("region", region);

        }catch (Exception e){
            e.printStackTrace();

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            String hql = "select count(sn) from AttractionDO " +
                    "where region like :region " +
                    "and ( name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword ) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("region", region);
        }

        return query.uniqueResult().intValue();
    }

    @Override
    public int getSizeBySelect(String region, String keywords, boolean available) {
        String hql;
        Query<Long> query;
        try{
            int snKeyword = Integer.parseInt(keywords);

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            hql = "select count(sn) from AttractionDO " +
                    "where (status=:available) and (region like :region) and " +
                    "( sn like :snKeyword or name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword) ";


            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);
            query.setParameter("region", region);
            query.setParameter("available", available);

        }catch (Exception e){
            e.printStackTrace();

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            hql = "select count(sn) from AttractionDO " +
                    "where (status=:available) and (region like :region) and " +
                    "( name like :keyword or toldescribe like :keyword or description like :keyword or address like :keyword or keywords like :keyword) ";

            query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
            query.setParameter("keyword", keywords);
            query.setParameter("region", region);
            query.setParameter("available", available);
        }
        return query.uniqueResult().intValue();
    }

    @Override
    public List<AttractionVO> listBySelect(int firstIndex, int resultSize, String region, String keywords, String orderFiled, boolean descending) {
        String hql;
        Query<AttractionVO> query;
        try {
            int snKeyword = Integer.parseInt(keywords);

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (do.sn=vo.sn) and (do.region like :region) and " +
                    "( do.sn like :snKeyword or do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);
            query.setParameter("region", region);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }catch (Exception e){
            e.printStackTrace();

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";
            hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (do.sn=vo.sn) and (do.region like :region) and " +
                    "( do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("region", region);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }



        return query.list();
    }

    @Override
    public List<AttractionVO> listBySelect(int firstIndex, int resultSize, String region, String keywords, String orderFiled, boolean descending, boolean available) {
        String hql;

        Query<AttractionVO> query;
        try {
            int snKeyword = Integer.parseInt(keywords);

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (vo.status=:available) and (do.sn=vo.sn) and (do.region like :region) and " +
                    "( do.sn like :snKeyword or do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("snKeyword", snKeyword);
            query.setParameter("region", region);
            query.setParameter("available", available);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }catch (Exception e){
            e.printStackTrace();

            keywords = "%"+keywords+"%";
            region = "%"+region+"%";

            hql = "select vo from AttractionDO do , AttractionVO vo " +
                    "where (vo.status=:available) and (do.sn=vo.sn) and (do.region like :region) and " +
                    "( do.name like :keyword or do.toldescribe like :keyword or do.description like :keyword or do.address like :keyword or do.keywords like :keyword ) " +
                    "order by do."+orderFiled;
            if(descending) hql += " desc";
            if(!AttractionFiledName.ATTRACTION_ID.equals(orderFiled)) hql += ", vo.sn";

            query = sessionFactory.getCurrentSession().createQuery(hql, AttractionVO.class);
            query.setParameter("keyword", keywords);
            query.setParameter("region", region);
            query.setParameter("available", available);

            query.setFirstResult(firstIndex);
            query.setMaxResults(resultSize);
        }



        return query.list();
    }


}