package iring29.model;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import a592070.pojo.RestaurantVO;

public class RestaurantDAO {

	private SessionFactory sessionFactory;
	
	public RestaurantDAO() {
		
	}

	public RestaurantDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Show_RView> totalRestaurant() {
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery("from Show_RView", Show_RView.class);
		return query.list();
	}

	public List<Show_RView> regionRestaurant(String region) {
		String hql = "from Show_RView where region =?1 order by sn";

		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, region);
		return query.list();
	}

	public List<Show_RView> nameRestaurant(String name) {
		String hql = "from Show_RView where name =?1 order by sn";

		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, "%" + name + "%");
		return query.list();
	}

	public List<Show_RView> userRestaurant(String username) {
		String hql = "from Show_RView where username =?1 order by sn";

		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, "%" + username + "%");
		return query.list();
	}
}
