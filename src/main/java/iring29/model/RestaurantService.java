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
	public int getSize() {
		return rDao.getSize();
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> totalRestaurant(int first, int count) {
		return rDao.totalRestaurant(first, count);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public int getRegionSize(String region) {
		return rDao.getRegionSize(region);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> regionRestaurant(int first, int count, String region) {
		return rDao.regionRestaurant(first, count, region);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public int getNameSize(String name) {
		return rDao.getNameSize(name);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> nameRestaurant(int first, int count,String name) {
		return rDao.nameRestaurant(first, count, name);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public int getUserSize(String username) {
		return rDao.getUserSize(username);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> userRestaurant(int first, int count,String username) {
		return rDao.userRestaurant(first, count, username);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant restaurantInfo(BigDecimal r_sn) {
		return rDao.restaurantInfo(r_sn);
	}
}
