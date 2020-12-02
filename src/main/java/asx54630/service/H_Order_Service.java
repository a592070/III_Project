package asx54630.service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import asx54630.model.HotelOrder;
import asx54630.model.HotelOrderDAO;
import asx54630.model.HotelOrder_VO;

@Service("hOService")
public class H_Order_Service {

	@Autowired
	private HotelOrderDAO hotelOrderDao;
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<HotelOrder_VO> sort(int first, int count, String orderfiled, String order) {

		return hotelOrderDao.sort(first,count, orderfiled, order);
	}

	@Transactional(rollbackFor = {Throwable.class})
	public HotelOrder hotelDetail(BigDecimal sn) {
		return hotelOrderDao.hotelDetail(sn);
	}

	
	@Transactional(rollbackFor = {Throwable.class})
	public HotelOrder update(BigDecimal sn,String Name,String Phone,BigDecimal Dbroom,BigDecimal Qdroom,Date Checkin,Date Checkout) {
		return hotelOrderDao.update(sn, Name, Phone, Dbroom, Qdroom, Checkin, Checkout);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public boolean delete(BigDecimal sn) {
		return hotelOrderDao.delete(sn);
		
	}
		
	@Transactional(rollbackFor = {Throwable.class})
	public int getSize() {
		return hotelOrderDao.getSize();
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<HotelOrder_VO> totalHotel(int first, int count) {
		return hotelOrderDao.totalHotel(first,count);
	}
	

	
}

