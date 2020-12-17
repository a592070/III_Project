package asx54630;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import asx54630.model.Hotel;
import config.AppConfig;
import utils.PictureSupport;

public class writePicToDB {
	private static ApplicationContext beans;
	@Autowired
	private static SessionFactory sessionFactory;

	public static void main(String[] args) {
//		beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");
		beans = new AnnotationConfigApplicationContext(AppConfig.class);

		String hql = "from Hotel where (PIC is null) and (PIC_URL is not null)";
		sessionFactory = beans.getBean("sessionFactory", SessionFactory.class);
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query<Hotel> query = session.createQuery(hql, Hotel.class);
		List<Hotel> list = query.list();
	
		try {
			for (Hotel ele : list) {
				PictureSupport.writeToDB(ele, "PIC_URL", "PIC");
				session.merge(ele);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}

		((ConfigurableApplicationContext) beans).close();
	}

}

