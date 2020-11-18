package a592070;

import a592070.pojo.AttractionDO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.QueryHints;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import utils.PictureSupport;

import javax.persistence.QueryHint;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:springmvc.servlet.xml")
public class InitAttractionPicture {
    @Autowired@Qualifier("sessionFactory")
    private static SessionFactory sessionFactory;

    @Test
    public void addPic(){
        String hql = "from AttractionDO where (picture is null) and (pictureUrl is not null) ";
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query<AttractionDO> query = session.createQuery(hql, AttractionDO.class);
        List<AttractionDO> list = query.list();
        try {
            for (AttractionDO ele : list) {
                PictureSupport.writeToDB(ele, "picture", "pic");
                session.merge(ele);
            }
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

}
