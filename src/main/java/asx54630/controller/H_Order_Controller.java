package asx54630.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import asx54630.model.HotelOrder;
import asx54630.model.HotelOrder_VO;
import asx54630.model.HotelPage;
import asx54630.service.H_Order_Service;


@Controller
@RequestMapping("/admin")
public class H_Order_Controller {

	@Autowired
	private H_Order_Service hOService;
	@Autowired
	private HotelPage hpage;
	
	private int start = 0;
	private static final int PAGESIZE = 8;
	
	@RequestMapping(path = "/hotelOrderindex", method = RequestMethod.GET)
	public String processHotelorderPage(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,Model m) {
		hpage.sethPageSize(PAGESIZE);
		int size = hOService.getSize();
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
		
		List<HotelOrder_VO> hotelOdata = hOService.totalHotel(start, pageSize);
		Date date = new Date(System.currentTimeMillis());
		System.out.println("date = " + date);
		
		m.addAttribute("hotelOdata", hotelOdata);
		m.addAttribute("date", date);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);
		
		System.out.println("currentPage="+currentPage);
		System.out.println("totalPage="+totalPage);
		return "asx54630/H_order";
		}
	
	
	@RequestMapping(path = "/hotelOrderPage", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //分頁.排序
	public ModelAndView processHotelOrderPage(@RequestParam(name = "orderfiled") String orderfiled,
										@RequestParam(name = "order") String order,
										@RequestParam(name = "currentPage") int currentPage) {
		System.out.println("currentPage="+currentPage);
		System.out.println("orderfiled="+orderfiled);
		System.out.println("order="+order);

		hpage.sethPageSize(PAGESIZE);
		int size = hOService.getSize();
		System.out.println(size);
		hpage.sethTotalCount(size);
		hpage.sethCurrentPage(currentPage);
		
		int firstIndex = (hpage.getCurrentPage()-1)*hpage.gethPageSize();
		List<HotelOrder_VO> hotelOdata = hOService.sort(firstIndex,hpage.gethPageSize(),orderfiled,order);
		// 1->0 2->10  (currentPage-1)*pagesize=
		// 1->10 2->20 (currentPage)*pagesize
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hotelOdata", hotelOdata);
		mav.addObject("hpage", hpage);
		mav.setViewName("asx54630/H_order_search");
		
		return mav;
		}

	
	@RequestMapping(path = "/hotelOrderdetail", method = RequestMethod.GET) //查詢單筆_給修改用
	public String processHotelDetail(@RequestParam(name = "detailsn") BigDecimal detailsn,Model m) {
			
		HotelOrder hotelOdetail = hOService.hotelDetail(detailsn);
		m.addAttribute("hotelOdetail", hotelOdetail);
		
		return "asx54630/H_Modify";
		}	
	
	
	@RequestMapping(path = "/hotelOrderupdate", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //修改
	public String processHotelUpdate(@RequestParam(name = "upId") BigDecimal updateSn,
									 @RequestParam(name = "upName") String updateName,
									 @RequestParam(name = "upPhone") String updatePhone,
									 @RequestParam(name = "upCheckin") Date updateCheckin,
									 @RequestParam(name = "upCheckout") Date updateCheckout,
									 @RequestParam(name = "upDBroom") BigDecimal updateDBroom,
									 @RequestParam(name = "upQDroom") BigDecimal updateQDroom,Model m) throws IOException {
		

		
		HotelOrder hotelOdetail = hOService.update(updateSn,updateName,updatePhone,updateDBroom,updateQDroom,updateCheckin,updateCheckout);
		m.addAttribute("hotelOdetail", hotelOdetail);
		
		return "asx54630/H_Modify";
		}
	
	@RequestMapping(path = "/hotelOrderdelete", method = RequestMethod.POST) //刪除
	public String processHotelDelete(@RequestParam(name = "deleteId") BigDecimal deleteSn,Model m) {
		
		boolean hoteldelete = hOService.delete(deleteSn);
		m.addAttribute("hoteldelete", hoteldelete);		
		
		return "redirect:hotelindex";
		}
	

	
}
