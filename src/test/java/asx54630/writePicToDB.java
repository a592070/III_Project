package asx54630;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import a592070.pojo.AttractionDO;
import asx54630.model.Hotel;
import utils.PictureSupport;

	public class writePicToDB {
	    @Autowired@Qualifier("sessionFactory")
	    private static SessionFactory sessionFactory;

	    @Test
	    public void addPic(){
	        String hql = "from Hotel where (PIC is null) and (PIC_URL is not null) ";
//	        sessionFactory = beans.getBean("sessionFactory", SessionFactory.class);
	        Session session = sessionFactory.getCurrentSession();
	        session.beginTransaction();
	        Query<Hotel> query = session.createQuery(hql, Hotel.class);
	        List<Hotel> list = query.list();
	        try {
	            for (Hotel ele : list) {
	                PictureSupport.writeToDB(ele, "pic_url", "pic");
	                session.merge(ele);
	            }
	            session.getTransaction().commit();
	        }catch (Exception e){
	            e.printStackTrace();
	            session.getTransaction().rollback();
	        }
	    }
	}

