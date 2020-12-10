package asx54630.service;

import java.math.BigDecimal;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asx54630.model.F_HotelOrderDAO;
import asx54630.model.Hotel;
import asx54630.model.HotelOrder;

@Service("hOrderService")
public class F_HotelOrderService {

	@Autowired
	private F_HotelOrderDAO f_hotelOrderDao;
	
	@Transactional(rollbackFor = {Throwable.class})
	public int DBroom(BigDecimal sn) {
		return f_hotelOrderDao.DBroom(sn);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public int QDroom(BigDecimal sn) {
		return f_hotelOrderDao.QDroom(sn);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public int getHotelDB(BigDecimal sn) {
		return f_hotelOrderDao.getHotelDB(sn);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public int  getHotelQD(BigDecimal sn) {
		return f_hotelOrderDao.getHotelQD(sn);
	}
	
}
