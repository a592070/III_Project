package iring29.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import iring29.model.Restaurant;
import iring29.model.RestaurantDAO;
import iring29.model.Show_RView;

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
	public int getSizeByKeywords(String keyWords) {
		return rDao.getSizeByKeywords(keyWords);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public List<Show_RView> listByKeywords(int firstIndex, int resultSize, String keyWords, String orderFiled,
			String order) {
		return rDao.listByKeywords(firstIndex, resultSize, keyWords, orderFiled, order);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant updateStatus(BigDecimal r_sn, String status) {
		return rDao.updateStatus(r_sn, status);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public Restaurant updateRestaurant(BigDecimal r_sn, String address, String opentime, String description,
			String transportation, String type, String region, String serviceinfo, byte[] pic) {
		return rDao.updateRestaurant(r_sn, address, opentime, description, transportation, type, region, serviceinfo,
				pic);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public byte[] getPic(BigDecimal r_sn) {
		return rDao.getPic(r_sn);
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
	public Restaurant restaurantInfo(BigDecimal r_sn) {
		return rDao.restaurantInfo(r_sn);
	}

	@Transactional(rollbackFor = { Throwable.class })
	public String deleteRestaurant(BigDecimal r_sn) {
		return rDao.deleteRestaurant(r_sn);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public String inserRestaurant(Restaurant rBean) {
		return rDao.inserRestaurant(rBean);
	}
	
	@Transactional(rollbackFor = { Throwable.class })
	public boolean checkusr(String username) {
		return rDao.checkusr(username);
	}
}
