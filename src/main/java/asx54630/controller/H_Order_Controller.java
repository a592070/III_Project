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
		hpage.sethPageSize(PAGESIZE); //設定一頁幾筆
		int size = hOService.getSize(); //初始資料總筆數
		System.out.println(size);
		hpage.sethTotalCount(size); //設定總筆數
		hpage.sethCurrentPage(currentPage); //設定當前頁數
		
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
		Date date = new Date(System.currentTimeMillis());
		System.out.println("date = " + date);
		// 1->0 2->10  (currentPage-1)*pagesize=
		// 1->10 2->20 (currentPage)*pagesize
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hotelOdata", hotelOdata);
		mav.addObject("hpage", hpage);
		mav.addObject("date", date);
		mav.setViewName("asx54630/H_order_search");
		
		return mav;
		}

	
	@RequestMapping(path = "/hotelOrderdetail", method = RequestMethod.POST) //查詢單筆_給修改用
	public String processHotelDetail(@RequestParam(name = "detailsn") BigDecimal detailsn,Model m) {
			
		HotelOrder_VO hotelOdetail = hOService.hotelDetail(detailsn);
		m.addAttribute("hotelOdetail", hotelOdetail);
		
		return "asx54630/H_Order_Modify";
		}	
	
	
	@RequestMapping(path = "/hotelOrderupdate", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //修改
	public String processHotelUpdate(@RequestParam(name = "id") BigDecimal updateSn,
									 @RequestParam(name = "CHECK_IN") Date CHECK_IN,
									 @RequestParam(name = "CHECK_OUT") Date CHECK_OUT,
									 @RequestParam(name = "CLIENT_NAME") String CLIENT_NAME,
									 @RequestParam(name = "CLIENT_PHONE") String CLIENT_PHONE,
									 @RequestParam(name = "DOUBLE_ROOM") BigDecimal updateDBroom,
									 @RequestParam(name = "QUADRUPLE_ROOM") BigDecimal updateQDroom,Model m) throws IOException {
		
		System.out.println(updateSn);
		System.out.println(CHECK_IN);
		System.out.println(CHECK_OUT);
		System.out.println(CLIENT_NAME);
		System.out.println(CLIENT_PHONE);
		System.out.println(updateDBroom);
		System.out.println(updateQDroom);
		
		
		HotelOrder hotelOdetail = hOService.update(updateSn,CLIENT_NAME,CLIENT_PHONE,updateDBroom,updateQDroom,CHECK_IN,CHECK_OUT);
		m.addAttribute("hotelOdetail", hotelOdetail);
		
		return "redirect:hotelOrderindex";
		}
	
	@RequestMapping(path = "/hotelOrderdelete", method = RequestMethod.POST) //刪除
	public String processHotelDelete(@RequestParam(name = "deleteId") BigDecimal deleteSn,Model m) {
		
		boolean hoteldelete = hOService.delete(deleteSn);
//		m.addAttribute("hoteldelete", hoteldelete);		
		
		return "redirect:hotelOrderindex";
		}
	

	
}
