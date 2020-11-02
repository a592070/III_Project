package iring29;

import iring29.model.Restaurant;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import utils.IOUtils;
import utils.PictureSupport;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

public class writePicToDB {
	private static ApplicationContext beans;
	@Autowired
	private static SessionFactory sessionFactory;

	public static void main(String[] args) {
		beans = new ClassPathXmlApplicationContext("springmvc.servlet.xml");

		String hql = "from Restaurant where (pic is null) and (pic_url is not null)";
		sessionFactory = beans.getBean("sessionFactory", SessionFactory.class);
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query<Restaurant> query = session.createQuery(hql, Restaurant.class);
		List<Restaurant> list = query.list();
	
		try {
			for (Restaurant ele : list) {
				PictureSupport.writeToDB(ele, "pic_url", "pic");
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
