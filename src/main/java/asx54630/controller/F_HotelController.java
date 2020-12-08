package asx54630.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		currentPage = 1;
		
		List<Hotel> hoteldata = f_hotelservice.totalHotel(start, pageSize);
		m.addAttribute("hoteldata", hoteldata);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);		
		m.addAttribute("hpage", hpage);		
		
		return "asx54630/F_Hotelindex";
	}
	
	@RequestMapping(path = "/F_hotelPage", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //分頁.搜尋.排序
	public String processFHotelPage(@RequestParam(name = "keyword",required = false) String keyword,
										@RequestParam(name = "regionkeywd",required = false) String regionkeywd,
										@RequestParam(name = "typekeywd",required = false) String typekeywd,
										@RequestParam(name = "currentPage") int currentPage,Model m) {

		hpage.sethPageSize(PAGESIZE);
		int size = f_hotelservice.howMuchData(keyword, regionkeywd, typekeywd);
		System.out.println(size);
		hpage.sethTotalCount(size);
		hpage.sethCurrentPage(currentPage);
		
		
		int firstIndex = (hpage.getCurrentPage()-1)*hpage.gethPageSize();
		
		int pageSize = hpage.gethPageSize();
		int totalPage = hpage.getTotalPageCount();
		List<Hotel> hoteldata = f_hotelservice.selectAll(firstIndex,hpage.gethPageSize(),keyword, regionkeywd,typekeywd);
		// 1->0 2->10  (currentPage-1)*pagesize=
		// 1->10 2->20 (currentPage)*pagesize
		
		m.addAttribute("hoteldata", hoteldata);
		m.addAttribute("hpage", hpage);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);	

		
		return "asx54630/F_HotelSearch";
		}



	@RequestMapping(path = "/F_hoteldetail", method = RequestMethod.GET) //查詢單筆_給修改用
	public String processHotelDetail(@RequestParam(name = "detailsn") BigDecimal detailsn,Model m) {
		
	Hotel hoteldetail = f_hotelservice.hotelDetail(detailsn);
	m.addAttribute("hoteldetail", hoteldetail);
	
	return "asx54630/F_HotelDetail";
	}
	
}	
