package iring29.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import rambo0021.pojo.AccountBean;


public class RestaurantDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public RestaurantDAO() {

	}

	public RestaurantDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// Total
	public int getSize() {
		String hql = "select count(r_sn) from Show_RView";
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}

	public List<Show_RView> totalRestaurant(int first, int count) {
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery("from Show_RView order by r_sn",
				Show_RView.class);
		// 找第幾筆
		query.setFirstResult(first);
		// 從第幾筆開始count筆
		query.setMaxResults(count);
		return query.list();
	}

	// keyword
	public int getSizeByKeywords(String keyWords) {
		keyWords = "%" + keyWords + "%";

		String hql = "select count(r_sn) from Show_RView where name like :keyword or address like :keyword or region like :keyword or username like :keyword ";
		Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
		query.setParameter("keyword", keyWords);
		return query.uniqueResult().intValue();
	}

	public List<Show_RView> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled, String order) {
		keyWords = "%" + keyWords + "%";
		String hql = "from Show_RView where name like :keyword or address like :keyword or region like :keyword or username like :keyword order by "
				+ orderFiled + " " + order;

		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter("keyword", keyWords);

		query.setFirstResult(firstIndex);
		query.setMaxResults(resultSize);

		return query.list();
	}
	
	// Region
	public int getRegionSize(String region) {
		String hql = "select count(r_sn) from Show_RView where region = ?1";
		Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
		query.setParameter(1, region);
		return query.uniqueResult().intValue();
	}
		
	public List<Show_RView> regionRestaurant(int first, int count, String region, String orderFiled, String order) {
		String hql = "from Show_RView where region =?1 order by " + orderFiled + " " + order;
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, region);
		query.setFirstResult(first);
		query.setMaxResults(count);
		return query.list();
	}
		
	// Region + keyword
	public int getSizeRK(String region, String keyWords) {
		String hql = "select count(r_sn) from Show_RView where region = ?1 and name like ?2";
		keyWords = "%" + keyWords + "%";
		Query<Long> query = sessionFactory.getCurrentSession().createQuery(hql, Long.class);
		query.setParameter(1, region);
		query.setParameter(2, keyWords);
		return query.uniqueResult().intValue();
	}
		
	public List<Show_RView> listByRK(int first, int count, String region, String keyWords, String orderFiled, String order) {
		String hql = "from Show_RView where region =?1 and name like ?2 order by " + orderFiled + " " + order;
		keyWords = "%" + keyWords + "%";
		Query<Show_RView> query = sessionFactory.getCurrentSession().createQuery(hql, Show_RView.class);
		query.setParameter(1, region);
		query.setParameter(2, keyWords);
		query.setFirstResult(first);
		query.setMaxResults(count);
		return query.list();
	}
		
	// Change Status
	public String updateStatus(BigDecimal r_sn, String status) {
		Restaurant result = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if (result != null) {
			result.setStatus(status);
			return "狀態切換成功";
		}
		return "狀態切換失敗";
	}

	// Update Restaurant Info
	public Restaurant updateRestaurant(BigDecimal r_sn, String address, String opentime, String description,
			String transportation, String type, String region, String serviceinfo, byte[] pic) {
		Restaurant result = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if (result != null) {
			result.setAddress(address);
			result.setOpentime(opentime);
			result.setDescription(description);
			result.setTransportation(transportation);
			result.setType(type);
			result.setRegion(region);
			result.setServiceinfo(serviceinfo);
			result.setPic(pic);

			return result;
		}
		return result;
	}

	// get Img
	public byte[] getPic(BigDecimal r_sn) {
		String hql = "select r.pic from Restaurant r where r.r_sn =?1";
		Query<byte[]> query = sessionFactory.getCurrentSession().createQuery(hql, byte[].class);
		query.setParameter(1, r_sn);
		return query.uniqueResult();
	}
	
	//Detail info
	public Restaurant restaurantInfo(BigDecimal r_sn) {
		String hql = "from Restaurant where r_sn = ?1";
		Query<Restaurant> query = sessionFactory.getCurrentSession().createQuery(hql, Restaurant.class);
		query.setParameter(1, r_sn);
		return query.uniqueResult();
	}

	//Delete info
	public String deleteRestaurant(BigDecimal r_sn) {
		Restaurant rBean = sessionFactory.getCurrentSession().get(Restaurant.class, r_sn);
		if(rBean != null) {
			sessionFactory.getCurrentSession().delete(rBean);
			return "餐廳刪除成功";
		}
		return "餐廳刪除失敗";
	}

	//create new restaurant
	public String inserRestaurant(Restaurant rBean) {
		System.out.println("in insert.");
		try{
			sessionFactory.getCurrentSession().save(rBean);
			return "餐廳新增成功";
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("fail to create order.");
			return "餐廳新增失敗";
		}
	}
	
	//check user
	public boolean checkusr(String username) {
		AccountBean accountBean = sessionFactory.getCurrentSession().get(AccountBean.class,username);
		if(accountBean!=null) {
			return true; //已存在帳號
		}else {
			return false; 
		}
	}

}
