package asx54630.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import asx54630.model.Hotel;
import asx54630.model.HotelOrder;
import asx54630.service.F_HotelOrderService;
import global.pojo.OrderTable;


@Controller
public class F_HotelOrderController {

	@Autowired	
	private F_HotelOrderService f_hotelOrderService;
	
	@RequestMapping(path = "/HotelOrder", method = RequestMethod.POST)
	public String HotelOrder(@RequestParam(value = "date_in") Date date_in,
							   @RequestParam(value = "date_out") Date date_out,
							   @RequestParam(value = "guest") BigDecimal guest, 
							   @RequestParam(value = "dbroom") BigDecimal dbroom, 
							   @RequestParam(value = "qdroom") BigDecimal qdroom, 
							   @RequestParam(value = "client_name") String client_name, 
							   @RequestParam(value = "client_phone") String client_phone,
							   HttpSession session) {
		Hotel hotel = (Hotel) session.getAttribute("hotel");
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		Integer cartnum = (Integer) session.getAttribute("cartnum");
		if(OTBean == null) {
			OTBean = new OrderTable();
			cartnum = 0;
		}
		if(cartnum == null) {
			cartnum = 0;
		}

			HotelOrder hOBean = new HotelOrder();
			
			hOBean.setCHECK_IN(date_in);
			hOBean.setCHECK_OUT(date_out);
			hOBean.setPROPLE_NUM(guest);
			hOBean.setDOUBLE_ROOM(dbroom);
			hOBean.setQUADRUPLE_ROOM(qdroom);
			hOBean.setCLIENT_NAME(client_name);
			hOBean.setCLIENT_PHONE(client_phone);
			
			OTBean.addHotelOrder(hOBean);
			
			cartnum = cartnum + 1;
			System.out.println("cart num = " +cartnum);
			session.setAttribute("OTBean", OTBean);
			session.setAttribute("cartnum", cartnum);
			return "iring29/Shoppingcart";

	}
	
	@RequestMapping(path = "/CheckOrderDate", method = RequestMethod.POST)
	public boolean CheckOrderDate(@RequestParam(name = "H_SN",required = false) BigDecimal H_SN, 
								@RequestParam(name = "date_in",required = false) Date date_in, 
								@RequestParam(name = "date_out",required = false) Date date_out
								) {
		
		System.out.println(H_SN);
		System.out.println(date_in);
		System.out.println(date_out);
		boolean  hOder = f_hotelOrderService.getDB_order_date(H_SN, date_in, date_out);

		return hOder;
		
		
		
	}
	
	
	@RequestMapping(path = "/CheckOrderRoom", method = RequestMethod.POST)
	public String CheckOrderRoom(@RequestParam(name = "H_SN",required = false) BigDecimal H_SN, 
							   @RequestParam(name = "dbroom",required = false) BigDecimal dbroom, 
							   @RequestParam(name = "qdroom",required = false) BigDecimal qdroom) {
		
		int currentDB = f_hotelOrderService.DBroom(H_SN); //取得已成立訂單中 該飯店的雙人房被訂了幾間
		int currentQD = f_hotelOrderService.QDroom(H_SN); //取得已成立訂單中 該飯店的四人房被訂了幾間
		
		int totalDB = f_hotelOrderService.getHotelDB(H_SN); //某某飯店雙人房總數
		int totalQD = f_hotelOrderService.getHotelQD(H_SN); //某某飯店四人房總數
		
			
		int LeftDB = totalDB - currentDB ; //剩餘雙人房間數
		int LeftQD = totalQD - currentQD ; //剩餘四人房間數
		
		int DBroom = dbroom.intValue();
		int QDroom = qdroom.intValue();
		
		System.out.println(LeftDB);
		System.out.println(LeftQD);
		System.out.println(DBroom);
		System.out.println(DBroom);
		
		if(DBroom <= LeftDB && QDroom <= QDroom ) {
			
			return "true";
		}else {
			return "false";
		}	

	}
	
	
	
	
}
