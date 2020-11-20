package iring29.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class F_RorderController {

	
	@RequestMapping(path = "OrderList", method = RequestMethod.POST)
	public String PlaceOrder() {
		return "iring29/OrderList";
	}
	
	@RequestMapping(path = "PrepareOrder", method = RequestMethod.POST)
	public String PrepareOrder(HttpSession session) {
		String time = (String) session.getAttribute("time");
		session.setAttribute("time", time);
		return "iring29/ShoppingCart";
	}
}
