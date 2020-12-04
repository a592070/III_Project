package iring29.model;

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

public class F_RestaurantDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public F_RestaurantDAO() {
		
	}
	
		// find multiple restaurant by restaurant name & region
//		public List<Restaurant_VO> findMulti_Name_Region(String name, String region) {
//			Query query = sessionFactory.getCurrentSession().createQuery("from Restaurant_VO where name like ?0 and region = ?1");
//			query.setParameter(0, "%" + name + "%");
//			query.setParameter(1, region);
//			List<Restaurant_VO> rView = query.getResultList();
//			return rView;
//		}
		
		// search how many Restaurant
		public int numRestaurant(String name, String region) {
			Query<Integer> query = sessionFactory.getCurrentSession().createQuery("select CAST(count(*) as int) from Restaurant_VO where name like ?0 and region like?1", Integer.class);
			query.setParameter(0, "%" + name + "%");
			query.setParameter(1, "%" + region + "%");
			return query.uniqueResult().intValue();

		}

		// find multiple restaurant by restaurant name
		public List<Restaurant_VO> findMulti_R(int first,int count, String name, String region) {
			Query<Restaurant_VO> query = sessionFactory.getCurrentSession().createQuery("from Restaurant_VO where name like ?0 and region like ?1 order by r_sn", Restaurant_VO.class);
			System.out.println("start findMulti_R");
			query.setParameter(0, "%" + name + "%");
			query.setParameter(1, "%" + region + "%");
			// 找第幾筆
			query.setFirstResult(first);
			// 從第幾筆開始count筆
			query.setMaxResults(count);
			
			return query.list();
		}
		
		// find specific restaurant by restaurant name
		public Restaurant findRestaurant(String name) {
			Query query = sessionFactory.getCurrentSession().createQuery("from Restaurant where name like ?0");
			query.setParameter(0, "%" + name + "%");
			Restaurant rBean = (Restaurant) query.uniqueResult();
			return rBean;
			
		}

		// find restaurant by region
//		public List<Restaurant_VO> findRegion(String region) {
//			Query query = sessionFactory.getCurrentSession().createQuery("from Restaurant_VO where region = ?0");
//			System.out.println("start findRegion");
//			query.setParameter(0, region);
//			List<Restaurant_VO> rView = query.list();
//			return rView;
//		}
		
		//get pic
		public byte[] getPic(BigDecimal r_sn) {
			Query query = sessionFactory.getCurrentSession().createQuery("select pic from Restaurant_VO where r_sn = ?0");
			query.setParameter(0, r_sn);
			byte[] pic = (byte[]) query.uniqueResult();
			return pic;
		}
}
