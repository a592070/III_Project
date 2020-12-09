package asx54630.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
		BigDecimal sn =  hotel.getSN(); //取得session裡的SN
		HotelOrder hOrderList = new HotelOrder();
		
		HotelOrder currentDB = f_hotelOrderService.DBroom(sn); //取得已成立訂單中 該飯店的雙人房被訂了幾間
		HotelOrder currentQD = f_hotelOrderService.QDroom(sn); //取得已成立訂單中 該飯店的四人房被訂了幾間
		
//		hOrderList.getDOUBLE_ROOM(sn);
		
//		if()
		
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
		return "redirect:Shoppingcart";
	}
}
