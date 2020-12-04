package asx54630.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asx54630.model.Hotel;
import asx54630.model.HotelPage;
import asx54630.model.HotelView;
import asx54630.service.F_HotelService;

@Controller
public class F_HotelController {

	@Autowired
	private HotelPage hpage;

	@Autowired
	private F_HotelService f_hotelservice;
	
	private int start = 0;
	private static final int PAGESIZE = 6;
	
	@RequestMapping(path = "/Hotel_index")
	public String processHotelPage(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,Model m) {
		hpage.sethPageSize(PAGESIZE);
		int size = f_hotelservice.howMuchData("", "", "");
		System.out.println(size);
		hpage.sethTotalCount(size);
		hpage.sethCurrentPage(currentPage);
		
		if (currentPage == 1) {
			currentPage = 1;
			start = 0;
		} else {
			start = (currentPage - 1) * hpage.gethPageSize();
		}
		
		int pageSize = hpage.gethPageSize();
		int totalPage = hpage.getTotalPageCount();
		
		List<Hotel> hoteldata = f_hotelservice.totalHotel(start, pageSize);
		m.addAttribute("hoteldata", hoteldata);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);		
		
		return "asx54630/F_Hotelindex";
	}
}
