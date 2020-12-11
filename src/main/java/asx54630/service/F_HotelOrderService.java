package asx54630.service;

import java.math.BigDecimal;
import java.sql.Date;

import org.hibernate.query.Query;
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
	
	@Transactional(rollbackFor = {Throwable.class})
	public boolean getDB_order_date(BigDecimal sn, Date datein,Date dateout){
		return f_hotelOrderDao.getDB_order_date(sn,datein,dateout);
	}
}
