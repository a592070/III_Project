package iring29.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.pojo.OrderTable;
import iring29.model.R_Order_List;
import iring29.model.Restaurant;
import iring29.service.F_RestaurantService;

@Controller
public class F_RorderController {

	@Autowired
	private F_RestaurantService F_Serivce;
	
	@RequestMapping(path = "/OrderList", method = RequestMethod.POST)
	public String PlaceOrder() {
		return "iring29/OrderList";
	}
	
	@RequestMapping(path = "/PrepareOrder", method = RequestMethod.POST)
	public String PrepareOrder(@RequestParam(value = "time") String time,
							   @RequestParam(value = "book_date") String book_date, 
							   @RequestParam(value = "b_name") String b_name, 
							   @RequestParam(value = "b_phone") String b_phone, 
							   @RequestParam(value = "person_number") BigDecimal person_number,
							   HttpSession session) {
		Restaurant res_data = (Restaurant) session.getAttribute("res_data");
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		Integer cartnum = (Integer) session.getAttribute("cartnum");
		if(OTBean == null) {
//		String book_date = (String) session.getAttribute("book_date");
			OTBean = new OrderTable();
			cartnum = 0;
		}
		if(cartnum == null) {
			cartnum = 0;
		}
		R_Order_List rOBean = new R_Order_List();
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		System.out.println("bookdate = " + book_date);
		String tsStr = book_date +" " + time + ":00";
		System.out.println("ts = " + tsStr);
		ts = Timestamp.valueOf(tsStr);
		rOBean.setBookt_time(ts);
		rOBean.setCus_name(b_name);
		rOBean.setCus_phone(b_phone);
		rOBean.setCustomer_num(person_number);
		rOBean.setDeposit(BigDecimal.valueOf(500));
		rOBean.setRestaurant(res_data);
		OTBean.addR_Order_Lists(rOBean);
		cartnum = cartnum + 1;
		System.out.println("cart num = " +cartnum);
		session.setAttribute("OTBean", OTBean);
		session.setAttribute("cartnum", cartnum);
		return "iring29/ShoppingCart";
	}
	
	//shopping cart頁面修改資料
	@RequestMapping(path = "/modifyOrderInfo", method = RequestMethod.POST)
	public @ResponseBody String modifyOrderInfo(@RequestParam(value = "r_sn") BigDecimal r_sn,
								  @RequestParam(value = "time") String time,
			   					  @RequestParam(value = "book_date") String book_date, 
			   					  @RequestParam(value = "b_name") String b_name, 
			   					  @RequestParam(value = "b_phone") String b_phone, 
			   					  @RequestParam(value = "person_number") BigDecimal person_number,
			   					  HttpSession session){
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		Set<R_Order_List> Rlists = OTBean.getR_Order_Lists();
		for(R_Order_List r : Rlists) {
			if(r.getRestaurant().getR_sn().equals(r_sn)) {
				Timestamp ts = new Timestamp(System.currentTimeMillis());
				String tsStr = book_date +" " + time + ":00";
				ts = Timestamp.valueOf(tsStr);
				r.setBookt_time(ts);
				r.setCus_name(b_name);
				r.setCus_phone(b_phone);
				r.setCustomer_num(person_number);
			}
		}
		session.setAttribute("OTBean", OTBean);
		return "modify";
	}
	
	@RequestMapping(path = "/ShoppingCart", method = RequestMethod.POST)
	public String ShoppingCart(HttpSession session) {
		return "iring29/ShoppingCart";
	}
	
	//訂單成立後
	@RequestMapping(path = "/ShowOrderList", method = RequestMethod.POST)
	public String placeOrder(HttpSession session) {
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		F_Serivce.createOrder(OTBean);
		OrderTable otBean = F_Serivce.findOrder();
		Set<R_Order_List> res_lists = otBean.getR_Order_Lists();
		session.setAttribute("res_lists", res_lists);
		return "iring29/OrderDetail";
	}
}
