package iring29.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import global.pojo.OrderTable;
import iring29.model.F_RestaurantDAO;
import iring29.model.R_Comment;
import iring29.model.R_Order_List;
import iring29.model.Restaurant;
import iring29.model.Restaurant_VO;
import rambo0021.pojo.AccountBean;

public class F_RestaurantService {

	@Autowired
	private F_RestaurantDAO f_RDao;
	
	public F_RestaurantService() {
		
	}

	public F_RestaurantService(F_RestaurantDAO f_RDao) {
		this.f_RDao = f_RDao;
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant findRestaurant(String name) {
		return f_RDao.findRestaurant(name);
	}
	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant findRestaurant(Integer id) {
		return f_RDao.findRestaurant(id);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public int numRestaurant(String name, String region, BigDecimal fisrtStar, BigDecimal endStar) {
		return f_RDao.numRestaurant(name, region, fisrtStar, endStar);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<Restaurant_VO> findMulti_R(int first, int count, String name, String region, BigDecimal fisrtStar, BigDecimal endStar) {
		return f_RDao.findMulti_R(first, count, name, region, fisrtStar, endStar);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public byte[] getPic(BigDecimal r_sn) {
		return f_RDao.getPic(r_sn);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public boolean createOrder(OrderTable otBean) {
		return f_RDao.createOrder(otBean);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public OrderTable findOrder(){
		return f_RDao.findOrder();
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public boolean TableNum(BigDecimal r_sn, Timestamp ts) {
		return f_RDao.TableNum(r_sn, ts);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<R_Comment> ResComment(BigDecimal r_sn) {
		return f_RDao.ResComment(r_sn);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public boolean addComment(R_Comment comm) {
		return f_RDao.addComment(comm);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public boolean userComment(BigDecimal id) {
		return f_RDao.userComment(id);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public AccountBean account(String username) {
		return f_RDao.account(username);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public R_Order_List findR_sn(Integer r_id) {
		return f_RDao.findR_sn(r_id); 
	}
}

