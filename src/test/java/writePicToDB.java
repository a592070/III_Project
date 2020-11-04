import a592070.pojo.AttractionDO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import utils.IOUtils;
import utils.PictureSupport;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:springmvc.servlet.xml")
public class writePicToDB {
    private static ApplicationContext beans;
    @Autowired
    private static SessionFactory sessionFactory;
//    @BeforeClass
//    public static void init(){
//        beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");
//    }
//
//    @AfterClass
//    public static void close(){
//        ((ConfigurableApplicationContext)beans).close();
//    }
    @Test
    public void addPic(){
        String hql = "from AttractionDO where (pic is null) and (picture is not null) ";
//        sessionFactory = beans.getBean("sessionFactory", SessionFactory.class);
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

    @Test
    public void testPicUrl() throws Exception {
        byte[] bytes = IOUtils.urlToByteArray("https://khh.travel/FileArtPic.ashx?id=1030&w=1280&h=960");
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream("other/pic.jpg"));
        out.write(bytes);

        out.close();
    }
    @Test
    public void delPic(){
        String hql = "from AttractionDO where picture like 'http://%'";
//        sessionFactory = beans.getBean("sessionFactory", SessionFactory.class);
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query<AttractionDO> query = session.createQuery(hql, AttractionDO.class);
        List<AttractionDO> list = query.list();
        try {
            for (AttractionDO ele : list) {
                ele.setPic(null);
            }
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
    @Test
    public void setPictureUrl(){
        String hql = "from AttractionDO where picture like 'https://travel.nantou.gov.tw/manasystem%' ";
//        sessionFactory = beans.getBean("sessionFactory", SessionFactory.class);
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query<AttractionDO> query = session.createQuery(hql, AttractionDO.class);
        List<AttractionDO> list = query.list();
        try {
            for (AttractionDO ele : list) {
                String replace = ele.getPicture().replace("https://", "http://");
                ele.setPicture(replace);
            }
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

}
