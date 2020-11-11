package iring29.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import iring29.model.Page;
import iring29.model.R_Order_View;
import iring29.service.R_OrderService;

@Controller
public class RorderController {
	@Autowired
	private R_OrderService rOrderService;
	@Autowired
	private Page page;
	
	private int start = 0;
	
	@RequestMapping(path = "/RestaurantList",method = RequestMethod.GET)
	public String rorderListDisplay(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage, Model m) {
		int size = rOrderService.getListSize();
		page.setTotalCount(size);
		System.out.println("currentPage = " + currentPage);
		if (currentPage == 1) {
			currentPage = 1;
			start = 0;
		} else {
			start = (currentPage - 1) * page.getPageSize();
		}
		int pageSize = page.getPageSize();
		int totalPage = page.getTotalPageCount();
		List<R_Order_View> Rlist = rOrderService.totaol_Rlist(start, pageSize);
		m.addAttribute("Rlist", Rlist);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);
		return "iring29/R_Order";
	}
}
