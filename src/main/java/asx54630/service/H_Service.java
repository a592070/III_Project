package asx54630.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import asx54630.model.Hotel;
import asx54630.model.HotelDAO;
import asx54630.model.HotelView;

@Service("hService")
public class H_Service {

	@Autowired
	private HotelDAO hotelDao;
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<HotelView> selectAll(int first, int count, String name, String region, String type, String orderfiled, String order) {

		return hotelDao.selectAll(first,count, name, region, type, orderfiled, order);
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
	public String insert(Hotel bean) {
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
	
	@Transactional(rollbackFor = {Throwable.class})
	public Hotel updateStatus(BigDecimal sn,String Status) {
		return hotelDao.updateStatus(sn,Status);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<HotelView> sort(int first, int count,String orderfiled ,String name, String region, String type ,String order){
		return hotelDao.sort(first,count,orderfiled,name,region,type,order);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public int getSize() {
		return hotelDao.getSize();
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public List<HotelView> totalHotel(int first, int count) {
		return hotelDao.totalHotel(first,count);
	}
	
	@Transactional(rollbackFor = {Throwable.class})
	public int howMuchData(String name, String region, String type){
		return hotelDao.howMuchData(name, region, type);
	}
	
}

