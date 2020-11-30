package asx54630.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import asx54630.model.Hotel;
import asx54630.model.HotelPage;
import asx54630.model.HotelView;
import asx54630.service.H_Service;
import iring29.model.Page;
import iring29.model.Restaurant;


@Controller
@SessionAttributes(names = { "hoteldetail" })
@RequestMapping("/admin")
public class H_Controller {

	@Autowired
	private H_Service hService;
	@Autowired
	private HotelPage hpage;
	
	private int start = 0;
	private static final int PAGESIZE = 8;
	
	@RequestMapping(path = "/hotelindex", method = RequestMethod.GET)
	public String processHotelPage(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,Model m) {
		hpage.sethPageSize(PAGESIZE);
		int size = hService.howMuchData("", "", "");
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
		
		List<HotelView> hoteldata = hService.totalHotel(start, pageSize);
		m.addAttribute("hoteldata", hoteldata);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);
		
		return "asx54630/H_index";
		}
	
	
	@RequestMapping(path = "/hotelPage", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //分頁.搜尋.排序
	public ModelAndView processHotelPage(@RequestParam(name = "keyword",required = false) String keyword,
										@RequestParam(name = "regionkeywd",required = false) String regionkeywd,
										@RequestParam(name = "typekeywd",required = false) String typekeywd,
										@RequestParam(name = "currentPage") int currentPage,
										@RequestParam(name = "orderfiled") String orderfiled,
										@RequestParam(name = "order") String order) {

		hpage.sethPageSize(PAGESIZE);
		int size = hService.howMuchData(keyword, regionkeywd, typekeywd);
		System.out.println(size);
		hpage.sethTotalCount(size);
		hpage.sethCurrentPage(currentPage);
		
		int firstIndex = (hpage.getCurrentPage()-1)*hpage.gethPageSize();
		List<HotelView> hoteldata = hService.selectAll(firstIndex,hpage.gethPageSize(),keyword, regionkeywd,typekeywd,orderfiled,order);
		// 1->0 2->10  (currentPage-1)*pagesize=
		// 1->10 2->20 (currentPage)*pagesize
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hoteldata", hoteldata);
		mav.addObject("hpage", hpage);
		mav.setViewName("asx54630/H_search");
		
		return mav;
		}
	
//	@RequestMapping(path = "/hotelselect", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //查詢
//	public ModelAndView processHotelSelectPage(@RequestParam(name = "keyword",required = false) String keyword,
//			@RequestParam(name = "regionkeywd",required = false) String regionkeywd,
//			@RequestParam(name = "typekeywd",required = false) String typekeywd,
//			@RequestParam(name = "currentPage") int currentPage) {
//		
//		hpage.sethPageSize(PAGESIZE);
//		int size = hService.howMuchData(keyword, regionkeywd, typekeywd);
//		System.out.println(size);
//		hpage.sethTotalCount(size);
//		hpage.sethCurrentPage(currentPage);
//		
//		int firstIndex = (hpage.getCurrentPage()-1)*hpage.gethPageSize();
//		List<HotelView> hoteldata = hService.selectAll(firstIndex,hpage.gethPageSize(),keyword, regionkeywd,typekeywd);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("hoteldata", hoteldata);
//		mav.addObject("hpage", hpage);
//		mav.setViewName("asx54630/H_search");
//		
//		return mav;
//	}
	
	@RequestMapping(path = "/hoteldetail", method = RequestMethod.GET) //查詢單筆_給修改用
	public String processHotelDetail(@RequestParam(name = "detailsn") BigDecimal detailsn,Model m) {
			
		Hotel hoteldetail = hService.hotelDetail(detailsn);
		m.addAttribute("hoteldetail", hoteldetail);
		
		return "asx54630/H_Modify";
		}
	
	
//	@RequestMapping(path = "/hotelSort", method = RequestMethod.GET , produces = "text/plain;charset=UTF-8") //排序
//	public ModelAndView processHotelSort(@RequestParam(name = "orderfiled") String orderfiled,
//								   @RequestParam(name = "keyword") String keyword,
//								   @RequestParam(name = "regionkeywd") String regionkeywd,
//								   @RequestParam(name = "typekeywd") String typekeywd,
//								   @RequestParam(name = "order") String order, Model m) {
//		
//		
//
//		List<HotelView> hoteldata = hService.sort(start,hpage.gethPageSize(),orderfiled,keyword,regionkeywd,typekeywd,order);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("hoteldata", hoteldata);
//		mav.addObject("orderfiled", orderfiled);
//		mav.addObject("keyword", keyword);
//		mav.addObject("regionkeywd", regionkeywd);
//		mav.addObject("typekeywd", typekeywd);
//		mav.addObject("order", order);
//		mav.setViewName("asx54630/H_search");
//		
//		return mav;
//		}
	
	@RequestMapping(path = "/hotelstatus", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //是否停權
	public String processHotelStatus(@RequestParam(name = "upId") BigDecimal updateSn,
									 @RequestParam(name = "upStatus") String updateStatus
									 ,Model m) {
		
		Hotel hotelupdate = hService.updateStatus(updateSn,updateStatus);
		m.addAttribute("hotelupdate", hotelupdate);
		
		return "redirect:hotelindex";
		}
	
	@RequestMapping(path = "/hotelcreateurl") //導向新增頁面
	public String processHotelCreatUrl() {
		return "asx54630/H_insert";
	}
	
	@RequestMapping(path = "/hotelcreate", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //新增
	public String processHotelCreate(@RequestParam(name = "upName") String updateName,
									 @RequestParam(name = "upRegion") String updateRegion,
									 @RequestParam(name = "upAddress") String updateaddress,
									 @RequestParam(name = "upTel") String updateTel,
									 @RequestParam(name = "upDBroom") BigDecimal updateDBroom,
									 @RequestParam(name = "upQDroom") BigDecimal updateQDroom,
									 @RequestParam(name = "upDescription") String updateDescription,
									 @RequestParam(name = "upOpentime") String updateOpentime,
									 @RequestParam(name = "uppic") MultipartFile uppic,
									 @RequestParam(name = "upType") String updateType,Model m) throws IOException {
		
		Hotel hbean = new Hotel();
		hbean.setNAME(updateName);
		hbean.setREGION(updateRegion);
		hbean.setADDRESS(updateaddress);
		hbean.setTEL(updateTel);
		hbean.setDOUBLE_ROOM(updateDBroom);
		hbean.setQUADRUPLE_ROOM(updateQDroom);
		hbean.setDESCRIPTION(updateDescription);
		hbean.setOPENTIME(updateOpentime);
		hbean.setTYPE(updateType);
		hbean.setSTATUS("啟用");
		hbean.setPIC(uppic.getInputStream().readAllBytes());
		hbean.setPIC_URL("1");
		
		
		String hotelnewdata = hService.insert(hbean);
		m.addAttribute("hotelnewdata", hotelnewdata);
		
		return "redirect:hotelindex";
		}
	
	@RequestMapping(path = "/hotelupdate", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //修改
	public String processHotelUpdate(@RequestParam(name = "upId") BigDecimal updateSn,
									 @RequestParam(name = "upName") String updateName,
									 @RequestParam(name = "upRegion") String updateRegion,
									 @RequestParam(name = "upAddress") String updateaddress,
									 @RequestParam(name = "upTel") String updateTel,
									 @RequestParam(name = "upDBroom") BigDecimal updateDBroom,
									 @RequestParam(name = "upQDroom") BigDecimal updateQDroom,
									 @RequestParam(name = "upDescription") String updateDescription,
									 @RequestParam(name = "upOpentime") String updateOpentime,
									 @RequestParam(name = "uppic") MultipartFile uppic,
									 @RequestParam(name = "upType") String updateType,Model m) throws IOException {
		
		Hotel hotel = new Hotel();
		if (uppic.getSize() != 0) {
			hotel.setPIC(uppic.getInputStream().readAllBytes());
		} else {
			hotel.setPIC(hService.getPic(updateSn));
		}
				
//		try {
//			FileOutputStream fos = new FileOutputStream("c:\\iii\\Hoteltest.jpg");
//			BufferedOutputStream bos=new BufferedOutputStream(fos);
//			byte[] bytes = uppic.getBytes();
//			bos.write(bytes);
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		Hotel hoteldetail = hService.update(updateSn,updateName,updateRegion,updateaddress,updateTel,updateDBroom,updateQDroom,updateDescription,updateOpentime,updateType,hotel.getPIC());
		m.addAttribute("hoteldetail", hoteldetail);
		
		return "asx54630/H_Modify";
		}
	
	@RequestMapping(path = "/hoteldelete", method = RequestMethod.POST) //刪除
	public String processHotelDelete(@RequestParam(name = "deleteId") BigDecimal deleteSn,Model m) {
		
		boolean hoteldelete = hService.delete(deleteSn);
		m.addAttribute("hoteldelete", hoteldelete);		
		
		return "redirect:hotelindex";
		}
	
	@RequestMapping(path = "/hotelPic") //秀出圖片
		public ResponseEntity<byte[]> ShowPic(@ModelAttribute("hoteldetail") Hotel h) {
			
			System.out.println(h.getSN());
			
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(h.getPIC(), headers, HttpStatus.OK);
	}
	
}
