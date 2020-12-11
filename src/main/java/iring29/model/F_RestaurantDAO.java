package iring29.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import global.pojo.OrderTable;
import rambo0021.pojo.AccountBean;
import utils.PictureSupport;

public class F_RestaurantDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public F_RestaurantDAO() {
		
	}
	
		// search how many Restaurant
		public int numRestaurant(String name, String region) {
			Query<Integer> query = sessionFactory.getCurrentSession().createQuery("select CAST(count(*) as int) from Restaurant_VO where name like ?0 and region like?1 and status = 'Y'", Integer.class);
			query.setParameter(0, "%" + name + "%");
			query.setParameter(1, "%" + region + "%");
			return query.uniqueResult().intValue();

		}

		// find multiple restaurant by restaurant name
		public List<Restaurant_VO> findMulti_R(int first,int count, String name, String region) {
			Query<Restaurant_VO> query = sessionFactory.getCurrentSession().createQuery("from Restaurant_VO where name like ?0 and region like ?1 and status = 'Y' order by r_sn", Restaurant_VO.class);
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
		public Restaurant findRestaurant(Integer id) {
			return sessionFactory.getCurrentSession().get(Restaurant.class, BigDecimal.valueOf(id));
		}
		
		//get pic
		public byte[] getPic(BigDecimal r_sn) {
			Query query = sessionFactory.getCurrentSession().createQuery("select pic from Restaurant_VO where r_sn = ?0");
			query.setParameter(0, r_sn);
			byte[] pic = (byte[]) query.uniqueResult();
			return pic;
		}
		
		//create order
		public boolean createOrder(OrderTable otBean) {
			boolean flag = false;
			try {
				System.out.println("create order");
				otBean.setOrder_date(new Date());
				sessionFactory.getCurrentSession().save(otBean);
				flag = true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("fail to create order.");
			}
			return flag;
		}
		
		//find order
		public OrderTable findOrder(){
			Query<OrderTable> query = sessionFactory.getCurrentSession().createQuery("from OrderTable where order_id = (select max(ot.order_id) from OrderTable ot)", OrderTable.class);
			OrderTable ot = (OrderTable) query.uniqueResult();
			return ot;
		}
		
		//find table num
		public boolean TableNum(BigDecimal r_sn, Timestamp ts) {
			boolean flag = false;
			Query<Integer> query = sessionFactory.getCurrentSession().createQuery("select CAST(count(*) as int) from R_Order_List where r_sn = ?0 and book_time = ?1", Integer.class);
			query.setParameter(0, r_sn );
			query.setParameter(1, ts );
			int num = (int) query.uniqueResult();
			System.out.println("num = " + num);
			if(num < 2) {
				flag = true;
			}
			return flag;
		}
		
		//find restaurant comment
		public boolean userComment(String username, BigDecimal r_sn) {
			boolean flag = false;
			Query<Integer> query = sessionFactory.getCurrentSession().createQuery("select CAST(count(*) as int) from R_Comment where COM_USER_ID = ?0 and R_SN = ?1", Integer.class);
			query.setParameter(0, username );
			query.setParameter(1, r_sn );
			int num = (int) query.uniqueResult();
			System.out.println("num = " + num);
			if(num < 1) {
				flag = true;
			}
			return flag;
		}
		
		//find restaurant comment
		public List<R_Comment> ResComment(BigDecimal r_sn) {
			Query<R_Comment> query = sessionFactory.getCurrentSession().createQuery("from R_Comment where r_sn = ?0 order by COM_DATE desc", R_Comment.class);
			query.setParameter(0, r_sn);
			query.setFirstResult(0);
			query.setMaxResults(3);
			
			return query.list();
		}
		
		//add comment
		public boolean addComment(R_Comment comm) {
			boolean flag = false;
			try {
				comm.setCom_date(new Date());
				sessionFactory.getCurrentSession().save(comm);
				flag = true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("fail to create comm.");
			}
			return flag;
		}
		
		//get accountBean
		public AccountBean account(String username) {
			return sessionFactory.getCurrentSession().get(AccountBean.class, username);
		}
}
