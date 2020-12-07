package asx54630.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asx54630.model.F_HotelDAO;
import asx54630.model.Hotel;
import asx54630.model.HotelView;


@Service("hService")
public class F_HotelService {

	@Autowired
	private F_HotelDAO f_hotelDao;
	
	@Transactional(rollbackFor = {Throwable.class})
	public int howMuchData(String name, String region, String type){
		return f_hotelDao.howMuchData(name, region, type);
	}

	
	@Transactional(rollbackFor = {Throwable.class})
	public List<Hotel> totalHotel(int first, int count) {
		return f_hotelDao.totalHotel(first,count);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<Hotel> selectAll(int first, int count, String name, String region, String type){
		return f_hotelDao.selectAll(first, count, name, region, type);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public Hotel hotelDetail(BigDecimal sn) {
		return f_hotelDao.hotelDetail(sn);
	}

}
