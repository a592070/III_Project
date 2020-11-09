package asx54630.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asx54630.model.Hotel;
import asx54630.model.HotelDAO;

@Service("hService")
public class H_Service {

	@Autowired
	private HotelDAO hotelDao;
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<Hotel> selectAll(String name, String region, String type) {

		return hotelDao.selectAll(name, region, type);
	}

	@Transactional(rollbackFor = {Throwable.class})
	public Hotel hotelDetail(BigDecimal sn) {
		return hotelDao.hotelDetail(sn);
	}

	@Transactional(rollbackFor = {Throwable.class})
	public Hotel hotelHomePage(String account) {
		return hotelDao.hotelHomePage(account);
	}

	@Transactional(rollbackFor = {Throwable.class})
	public Hotel insert(Hotel bean) {
		return hotelDao.insert(bean);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public Hotel update(BigDecimal sn,String Name,String Region,String Address,String Tel,BigDecimal Dbroom,BigDecimal Qdroom,String Description,String Opentime,String Type) {
		return hotelDao.update(sn, Name, Region, Address, Tel, Dbroom, Qdroom, Description, Opentime, Type);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public boolean delete(BigDecimal sn) {
		return hotelDao.delete(sn);
		
	}
}
