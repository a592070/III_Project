package iring29.model;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class RestaurantService {
	@Autowired
	private RestaurantDAO rDao;

	public RestaurantService() {

	}

	public RestaurantService(RestaurantDAO rDao) {
		this.rDao = rDao;
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> totalRestaurant() {
		return rDao.totalRestaurant();
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> regionRestaurant(String region) {
		return rDao.regionRestaurant(region);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> nameRestaurant(String name) {
		return rDao.nameRestaurant(name);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> userRestaurant(String username) {
		return rDao.userRestaurant(username);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant restaurantInfo(BigDecimal r_sn) {
		return rDao.restaurantInfo(r_sn);
	}
}
