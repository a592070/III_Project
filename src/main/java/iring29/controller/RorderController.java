package iring29.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import iring29.model.Page;
import iring29.model.R_OrderList_VO;
import iring29.model.R_Order_List;
import iring29.service.R_OrderService;

@Controller
@RequestMapping("/admin")
public class RorderController {
	@Autowired
	private R_OrderService rOrderService;
	@Autowired
	private Page page;

	private int start = 0;

	// Display all restaurant order list
	@RequestMapping(path = "/RestaurantList", method = RequestMethod.GET)
	public String rorderListDisplay(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,
			Model m) {
		int size = rOrderService.getListSize();
		page.setTotalCount(size);
		System.out.println("currentPage = " + currentPage);
		if (currentPage == 1) {
			currentPage = 1;
		} else {
			start = (currentPage - 1) * page.getPageSize();
		}
		String orderFiled = "order_id";
		String order = "ASC";
		int totalPage = page.getTotalPageCount();
		List<R_OrderList_VO> Rlist = rOrderService.totaol_Rlist(start, page.getPageSize(),orderFiled,order);
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		System.out.println("ts = " + ts);
		
		m.addAttribute("Rlist", Rlist);
		m.addAttribute("ts", ts);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);
		return "iring29/R_Order";
	}
	
	@RequestMapping(path = "/OrderList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> OrderDisplay(@RequestParam(value = "currentPage") Integer currentPage,
							   							  @RequestParam(value = "cgpage") String cgpage,
							   							  @RequestParam(value = "orderFiled") String orderFiled,
							   							  @RequestParam(value = "order") String order) {
		
		int size = rOrderService.getListSize();
		page.setTotalCount(size);
		System.out.println("currentPage = " + currentPage);
		
		if(cgpage.equals("1") || cgpage.isEmpty()) {
			
			page.setCurrentPage(currentPage);
			start = (currentPage - 1) * page.getPageSize();
			
		}else if(cgpage.equals("next")) {
			
			start = (currentPage) * page.getPageSize();
			page.setCurrentPage(currentPage + 1);
			
		}else if(cgpage.equals("previous")) {
			
			start = (currentPage - 2) * page.getPageSize();
			page.setCurrentPage(currentPage - 1);
			
		}else if(cgpage.equals("first")) {
			
			start = 0 ;
			page.setCurrentPage(1);
			
		}else {
			start = (page.getTotalPageCount()-1) * page.getPageSize();
		}
		
		List<R_OrderList_VO> Rlist = rOrderService.totaol_Rlist(start, page.getPageSize(),orderFiled, order);
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Map<String, Object> map = new HashMap<>();
		
		map.put("Rlist", Rlist);
		map.put("page", page);
		map.put("ts", ts);
		return map;
	}

	// Display detail order list
	@RequestMapping(path = "/ROrderDisplay")
	public String ModifyOrder(@RequestParam(name = "rid") BigDecimal id, Model m) {
		R_OrderList_VO ROList = rOrderService.Detail_OderList(id);
//		System.out.println("time = "+ROList.getBook_time().toString()); //time = 2020-10-29 13:00:00.0
		String date = ROList.getBook_time().toString().substring(0, 10); // get yyyy-mm-dd
		String time = ROList.getBook_time().toString().substring(11, 16); //get hh:mm
		m.addAttribute("ROList", ROList);
		m.addAttribute("date", date);
		m.addAttribute("time",time);
		return "iring29/R_Order_Modify";
	}
	
	// modify order list
	@RequestMapping(path = "/ROrderModify", method = RequestMethod.POST)
	public String UpdateOrder(@RequestParam(name = "id") BigDecimal id,
							  @RequestParam(name = "cus_name") String cus_name,
							  @RequestParam(name = "cus_phone") String cus_phone, 
							  @RequestParam(name = "book_date") String book_date,
							  @RequestParam(name = "book_time") String book_time,
							  @RequestParam(name = "customer_num") BigDecimal customer_num,Model m) {
		String booktime = book_date +" " + book_time + ":00" ;
		Timestamp ts = Timestamp.valueOf(booktime);
		
		rOrderService.updateOrder(id, cus_name, cus_phone, ts, customer_num);
		R_OrderList_VO ROList = rOrderService.Detail_OderList(id);
		m.addAttribute("ROList", ROList);
		m.addAttribute("date", book_date);
		m.addAttribute("time",book_time);
		m.addAttribute("customer_num",customer_num);
		return "iring29/R_Order_Modify";
	}
	
	//Delete order
	@RequestMapping(path = "DeleteOrder", method = RequestMethod.POST)
	public String DelOrder(@RequestParam("rid") BigDecimal id, Model m) {
		String result = rOrderService.deleteOrder(id);
		m.addAttribute("result",result);
		return "redirect:RestaurantList";
	}
}
