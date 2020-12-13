package iring29.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import global.pojo.OrderTable;
import iring29.model.R_Comment;
import iring29.model.R_Order_List;
import iring29.model.Restaurant;
import iring29.service.F_RestaurantService;
import rambo0021.pojo.AccountBean;

@SessionAttributes(names = { "userBean" })
@Controller
public class F_RorderController {

	@Autowired
	private F_RestaurantService F_Serivce;
	@Autowired
	private global.service.SendMailService sendMail;
	
	
	@RequestMapping(path = "/OrderList", method = RequestMethod.POST)
	public String PlaceOrder() {
		return "iring29/OrderList";
	}
	
	//prepare order
	@RequestMapping(path = "/PrepareOrder", method = RequestMethod.POST)
	public String PrepareOrder(@RequestParam(value = "time") String time,
							   @RequestParam(value = "book_date") String book_date, 
							   @RequestParam(value = "b_name") String b_name, 
							   @RequestParam(value = "b_phone") String b_phone, 
							   @RequestParam(value = "person_number") BigDecimal person_number,
							   HttpSession session, Model m) {
		Restaurant res_data = (Restaurant) session.getAttribute("res_data");
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		Integer cartnum = (Integer) session.getAttribute("cartnum");
		//判斷是否登入
		if(OTBean == null) {
			OTBean = new OrderTable();
			AccountBean userbean = (AccountBean) m.getAttribute("userBean");
			OTBean.setAccountBean(userbean);
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
		BigDecimal deposit = person_number.multiply(res_data.getPrice());
		rOBean.setDeposit(deposit);
		rOBean.setRestaurant(res_data);
		OTBean.addR_Order_Lists(rOBean);
		OTBean.setTotalPrice(OTBean.getTotalPrice().add(deposit));
		cartnum = cartnum + 1;
		System.out.println("cart num = " +cartnum);
		session.setAttribute("OTBean", OTBean);
		session.setAttribute("cartnum", cartnum);
		return "redirect:Shoppingcart";
	}
	
	//prepare order(" 加入購物車 " ) 使用
	@RequestMapping(path = "/addOrder", method = RequestMethod.POST)
	public @ResponseBody Integer AddOrder(@RequestParam(value = "time") String time,
							   @RequestParam(value = "book_date") String book_date, 
							   @RequestParam(value = "b_name") String b_name, 
							   @RequestParam(value = "b_phone") String b_phone, 
							   @RequestParam(value = "person_number") BigDecimal person_number,
							   HttpSession session, Model m) {
		Restaurant res_data = (Restaurant) session.getAttribute("res_data");
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		Integer cartnum = (Integer) session.getAttribute("cartnum");
		//判斷是否登入
		if(OTBean == null) {
			OTBean = new OrderTable();
			AccountBean userbean = (AccountBean) m.getAttribute("userBean");
			OTBean.setAccountBean(userbean);
			cartnum = 0;
		}
		if(cartnum == null) {
			cartnum = 0;
		}
		R_Order_List rOBean = new R_Order_List();
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String tsStr = book_date +" " + time + ":00";
		ts = Timestamp.valueOf(tsStr);
		rOBean.setBookt_time(ts);
		rOBean.setCus_name(b_name);
		rOBean.setCus_phone(b_phone);
		rOBean.setCustomer_num(person_number);
		BigDecimal deposit = person_number.multiply(res_data.getPrice());
		rOBean.setDeposit(deposit);
		rOBean.setRestaurant(res_data);
		OTBean.addR_Order_Lists(rOBean);
		OTBean.setTotalPrice(OTBean.getTotalPrice().add(deposit));
		cartnum = cartnum + 1;
		session.setAttribute("OTBean", OTBean);
		session.setAttribute("cartnum", cartnum);
		return cartnum;
	}
	
	//show order
	@RequestMapping(path = "/Shoppingcart")
	public String ShowCart() {
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
				BigDecimal deposit = person_number.multiply(r.getRestaurant().getPrice());
				r.setDeposit(deposit);
				OTBean.setTotalPrice(OTBean.getTotalPrice().add(r.getDeposit()));
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
		session.removeAttribute("OTBean");
		OrderTable otBean = F_Serivce.findOrder();  //不使用綠界時打開
		Set<R_Order_List> res_lists = otBean.getR_Order_Lists();  //不使用綠界時打開
		session.setAttribute("res_lists", res_lists);  //不使用綠界時打開
		for(R_Order_List r : res_lists) {
			//send mail
			String email = "929iring@gmail.com";  //不使用綠界時打開
			String title = "Fun x Taiwan";  //不使用綠界時打開
			String content = "謝謝您訂購" + r.getRestaurant().getName() + "<br>訂單編號為"+ r.getId() + "<br>也歡迎點選下方連結留下您的寶貴建議";  //不使用綠界時打開
			String urlDisplay = "對"+r.getRestaurant().getName()+"留下您的評價";
			String url = "/reviewrestaurant/"+r.getRestaurant().getR_sn()+"/"+r.getId();
			sendMail.asyncSend(email, title, content, urlDisplay, url , session);  //不使用綠界時打開
			
		}
				
		session.removeAttribute("cartnum");
		return "iring29/OrderDetail";//不使用綠界時打開
//		return "redirect:payment";//使用綠界時打開
	}
	
	//leave comment
	@RequestMapping(path = {"/reviewrestaurant/{restaurant_id}/{r_order_id}"}) 
	public String reviewRestaurant(@PathVariable(name="restaurant_id", required = false) Integer restaurant_id,
								   @PathVariable(name="r_order_id", required = false) Integer r_order_id, HttpSession session) {
		Restaurant res_data = F_Serivce.findRestaurant(restaurant_id);
		List<R_Comment> comment = F_Serivce.ResComment(res_data.getR_sn());
		session.setAttribute("res_data", res_data);
		session.setAttribute("comment", comment);
		session.setAttribute("r_order_id", r_order_id);
//		return "iring29/RestaurantComment";
		
		return "redirect:writeComment";
	}
	
	@RequestMapping(path = "/reviewrestaurant/{restaurant_id}/writeComment")
	public String writeComment(@PathVariable(name="restaurant_id", required = false) Integer restaurant_id) {
		return "iring29/RestaurantComment";
	}
	
	@RequestMapping(path = "/payment")
	//payment
	public String payment(HttpSession session){
		OrderTable otBean = F_Serivce.findOrder();
		AllInOne pay = new AllInOne("");
		AioCheckOutALL checkOut = new AioCheckOutALL();
		checkOut.setMerchantID("2000132");
		checkOut.setMerchantTradeNo("Fun Taiwan" + otBean.getOrder_id().toString());
		checkOut.setMerchantTradeDate(otBean.getOrder_dateString());
		checkOut.setTotalAmount("100");
		checkOut.setTradeDesc("Fun Taiwan 商城購物");
		checkOut.setItemName("Fun Taiwan");
//		checkOut.setReturnURL("https://ba554c1555ce.ngrok.io/III_Project/checkorder");//資料確認用
//		checkOut.setClientBackURL("https://ba554c1555ce.ngrok.io/III_Project/showOrder");// return 網址
		String result = pay.aioCheckOut(checkOut, null);
		System.out.println("payment result = " + result);
		session.setAttribute("result", result);
		return "iring29/Payment"; 
	}
	
	//orderlist detail
	@RequestMapping(path = "/showOrder")
	public String showOrder(HttpSession session) {
		session.removeAttribute("result");
		OrderTable otBean = F_Serivce.findOrder();
		
		//send mail


		Set<R_Order_List> res_lists = otBean.getR_Order_Lists();
		session.setAttribute("res_lists", res_lists);
		return "iring29/OrderDetail";
	}
	
	@RequestMapping(path = "/checkorder", method = RequestMethod.POST)
	public String checkOrder() {
		return "iring29/checkorder";
	}
	
	//移除預定餐廳
	@RequestMapping(path = "/removeInfo", method = RequestMethod.POST)
	public @ResponseBody String removeInfo(@RequestParam(value = "r_sn") BigDecimal r_sn, HttpSession session){
		OrderTable OTBean = (OrderTable) session.getAttribute("OTBean");
		Integer cartnum = (Integer) session.getAttribute("cartnum");
		cartnum = cartnum - 1;
		System.out.println("sn = " + r_sn);
		OTBean.getR_Order_Lists().removeIf(ele->{
			return r_sn.equals(ele.getRestaurant().getR_sn());
		});

		session.setAttribute("OTBean", OTBean);
		session.setAttribute("cartnum", cartnum);
		return "remove";
	}
	
	@RequestMapping(path = "/checkTable")
	public @ResponseBody boolean checkTable(@RequestParam(value = "time") String time,
											@RequestParam(value = "book_date") String book_date,
											HttpSession session) {
		Restaurant res_data = (Restaurant) session.getAttribute("res_data");
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		String tsStr = book_date +" " + time + ":00";
		ts = Timestamp.valueOf(tsStr);
		System.out.println("ts = " + ts);
		
		boolean result = F_Serivce.TableNum(res_data.getR_sn(), ts);
		System.out.println("result = " +result);
		return result;
	}
	
}
