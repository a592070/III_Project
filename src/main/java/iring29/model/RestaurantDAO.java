package iring29.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import a592070.pojo.RestaurantVO;

public class RestaurantDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public RestaurantDAO() {
		
	}

	public RestaurantDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public int getSize() {
        String hql = "select count(r_sn) from Show_RView";
        return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();	
	}
	
//	@Transactional(rollbackFor = {Throwable.class})
	public List<Show_RView> totalRestaurant(int first, int count) {
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery("from Show_RView order by r_sn", Show_RView.class);
		//找第幾筆
		query.setFirstResult(first);
		//從第幾筆開始count筆
		query.setMaxResults(count);
		return query.list();
	}

//	@Transactional(rollbackFor = {Throwable.class})
	public List<Show_RView> regionRestaurant(String region) {
		String hql = "from Show_RView where region =?1 order by r_sn";
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, region);
		return query.list();
	}

//	@Transactional(rollbackFor = {Throwable.class})
	public List<Show_RView> nameRestaurant(String name) {
		String hql = "from Show_RView where name like ?1 order by r_sn";
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, "%" + name + "%");
		return query.list();
	}
	
//	@Transactional(rollbackFor = {Throwable.class})
	public List<Show_RView> userRestaurant(String username) {
		String hql = "from Show_RView where username like ?1 order by r_sn";
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, "%" + username + "%");
		return query.list();
	}
	
//	@Transactional(rollbackFor = {Throwable.class})
	public Restaurant restaurantInfo(BigDecimal r_sn) {
		String hql = "from Restaurant where r_sn = ?1";
		Query<Restaurant> query = sessionFactory.getCurrentSession().createQuery(hql, Restaurant.class);
		query.setParameter(1, r_sn);
		return query.uniqueResult();
	}
}
