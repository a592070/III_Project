package iring29.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import global.pojo.OrderTable;
import iring29.model.F_RestaurantDAO;
import iring29.model.Restaurant;
import iring29.model.Restaurant_VO;

public class F_RestaurantService {

	@Autowired
	private F_RestaurantDAO f_RDao;
	
	public F_RestaurantService() {
		
	}

	public F_RestaurantService(F_RestaurantDAO f_RDao) {
		this.f_RDao = f_RDao;
	}
	
//	@Transactional(rollbackFor = { Throwable.class })
//	public List<Restaurant_VO> findMulti_Name_Region(String name, String region) {
//		return f_RDao.findMulti_Name_Region(name, region);
//	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant findRestaurant(String name) {
		return f_RDao.findRestaurant(name);
	}
	
//	@Transactional(rollbackFor = { Throwable.class })
//	public List<Restaurant_VO> findRegion(String region) {
//		return f_RDao.findRegion(region);
//	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public int numRestaurant(String name, String region) {
		return f_RDao.numRestaurant(name, region);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<Restaurant_VO> findMulti_R(int first, int count, String name, String region) {
		return f_RDao.findMulti_R(first, count, name, region);
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
}

