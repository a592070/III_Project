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
import org.springframework.web.bind.annotation.ResponseBody;

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
							   @RequestParam(value = "guest1") BigDecimal guest, 
							   @RequestParam(value = "dbroom") BigDecimal dbroom, 
							   @RequestParam(value = "qdroom") BigDecimal qdroom, 
							   @RequestParam(value = "client_name") String client_name, 
							   @RequestParam(value = "client_phone") String client_phone,
							   HttpSession session,Model m) {
		
		System.out.println(date_in);
		System.out.println(date_out);
		System.out.println(guest);
		System.out.println(dbroom);
		System.out.println(qdroom);
		System.out.println(client_name);
		System.out.println(client_phone);
		
		Hotel hotel = (Hotel) session.getAttribute("hoteldetail");
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
			
			hOBean.setHotel(hotel);
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
	
	@RequestMapping(path = "/CheckOrderDate", method = RequestMethod.POST)
	public @ResponseBody boolean CheckOrderDate(@RequestParam(name = "H_SN",required = false) BigDecimal H_SN, 
								@RequestParam(name = "date_in",required = false) Date date_in, 
								@RequestParam(name = "date_out",required = false) Date date_out
								) {
		
		System.out.println("controller =" + H_SN);
		System.out.println("controller =" + date_in);
		System.out.println("controller =" + date_out);
		boolean hOder = f_hotelOrderService.getDB_order_date(H_SN, date_in, date_out);
		
		System.out.println(hOder);
		return hOder;
		
		
		
	}
	
	
//	@RequestMapping(path = "/CheckOrderRoom", method = RequestMethod.POST)
//	public @ResponseBody boolean CheckOrderRoom(@RequestParam(name = "H_SN",required = false) BigDecimal H_SN, 
//							   @RequestParam(name = "dbroom",required = false) BigDecimal dbroom, 
//							   @RequestParam(name = "qdroom",required = false) BigDecimal qdroom) {
//		boolean flag = false;
//
//		BigDecimal currentDB = f_hotelOrderService.DBroom(H_SN); //取得已成立訂單中 該飯店的雙人房被訂了幾間
//		
//		BigDecimal currentQD = f_hotelOrderService.QDroom(H_SN); //取得已成立訂單中 該飯店的四人房被訂了幾間
//		
//		BigDecimal totalDB = f_hotelOrderService.getHotelDB(H_SN); //某某飯店雙人房總數
//
//		BigDecimal totalQD = f_hotelOrderService.getHotelQD(H_SN); //某某飯店四人房總數
//		
//		
//		System.out.println(currentDB);
//		System.out.println(currentQD);
//		System.out.println(totalDB);
//		System.out.println(totalQD);
//			
////		BigDecimal LeftDB = totalDB.subtract(currentDB); //剩餘雙人房間數
////		BigDecimal LeftQD = totalQD.subtract(currentQD); //剩餘四人房間數
//		
////		int DBroom = dbroom.intValue(); //要下訂的雙人房間數
////		int QDroom = qdroom.intValue(); //要下訂的四人房間數
//
//		int result1 = currentDB.compareTo(null); 
//		int result2 = currentQD.compareTo(null); 
////		int result3 = dbroom.compareTo(LeftDB); 
////		int result4 = qdroom.compareTo(LeftQD); 
//		
//		System.out.println(result1);
//		System.out.println(result2);
//		
//		if(result1 == 0 && result2==0) {
//			flag = true;
//			return flag;
//		} 
//		
//		if(result1 != 0  && result2 != 0 ) {
//		BigDecimal LeftDB = totalDB.subtract(currentDB); 
//		BigDecimal LeftQD = totalQD.subtract(currentQD);
//		int result3 = dbroom.compareTo(LeftDB); 
//		int result4 = qdroom.compareTo(LeftQD);
//			if(result3 <0 &&  result4 <0) {
//				flag = true;
//				return flag;
//			}
//		}
//
//			
//		return flag;
//
//	}
	
	
	
	
}
