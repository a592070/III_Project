package iring29.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import iring29.model.F_RestaurantDAO;
import iring29.model.Restaurant;
import iring29.model.Show_RView;

public class F_RestaurantService {

	@Autowired
	private F_RestaurantDAO f_RDao;
	
	public F_RestaurantService() {
		
	}

	public F_RestaurantService(F_RestaurantDAO f_RDao) {
		this.f_RDao = f_RDao;
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> findMulti_Name_Region(String name, String region) {
		return f_RDao.findMulti_Name_Region(name, region);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant findRestaurant(String name) {
		return f_RDao.findRestaurant(name);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> findRegion(String region) {
		return f_RDao.findRegion(region);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public int numRestaurant(String name) {
		return f_RDao.numRestaurant(name);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> findMulti_R(String name) {
		return f_RDao.findMulti_R(name);
	}
	
}

