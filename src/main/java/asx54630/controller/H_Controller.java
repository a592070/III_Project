package asx54630.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import asx54630.model.Hotel;
import asx54630.model.HotelView;
import asx54630.service.H_Service;


@Controller
@RequestMapping("/admin")
public class H_Controller {

	@Autowired
	private H_Service hService;
		
	@RequestMapping(path = "/hotelindex", method = RequestMethod.GET)
	public String processHotelPage(Model m) {
		
		List<HotelView> hoteldata = hService.selectAll("","","");
		m.addAttribute("hoteldata", hoteldata);
		
		return "asx54630/H_index";
		}
	
	
	@RequestMapping(path = "/hoteldetail", method = RequestMethod.GET) //查詢單筆_給修改用
	public String processHotelDetail(@RequestParam(name = "detailsn") BigDecimal detailsn,Model m) {
			
		Hotel hoteldetail = hService.hotelDetail(detailsn);
		m.addAttribute("hoteldetail", hoteldetail);
		
		return "asx54630/H_Modify";
		}
	
	@RequestMapping(path = "/hotelselect", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //查詢
	public ModelAndView processHotelSelectPage(@RequestParam(name = "keyword",required = false) String keyword, @RequestParam(name = "regionkeywd",required = false) String regionkeywd, @RequestParam(name = "typekeywd",required = false) String typekeywd) {

		List<HotelView> hoteldata = hService.selectAll(keyword, regionkeywd,typekeywd);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hoteldata", hoteldata);
		mav.setViewName("asx54630/H_search");
		
		return mav;
		}
	
	@RequestMapping(path = "/hotelSort", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //排序
	public ModelAndView processHotelSort(@RequestParam(name = "orderfiled",defaultValue = "SN") String orderfiled,
								   @RequestParam(name = "keyword") String keyword,
								   @RequestParam(name = "regionkeywd") String regionkeywd,
								   @RequestParam(name = "typekeywd") String typekeywd,
								   @RequestParam(name = "order",defaultValue = "ASC") String order, Model m) {

		if (order.equals("DESC")) {
			order = "ASC";
		} else {
			order = "DESC";
		}
		
		List<HotelView> hoteldata = hService.sort(orderfiled,keyword,regionkeywd,typekeywd,order);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hoteldata", hoteldata);
		mav.addObject("orderfiled", orderfiled);
		mav.addObject("keyword", keyword);
		mav.addObject("regionkeywd", regionkeywd);
		mav.addObject("typekeywd", typekeywd);
		mav.addObject("order", order);
		mav.setViewName("asx54630/H_search");
		
		return mav;
		}
	
	@RequestMapping(path = "/hotelstatus", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //是否停權
	public String processHotelStatus(@RequestParam(name = "upId") BigDecimal updateSn,
									 @RequestParam(name = "upStatus") String updateStatus
									 ,Model m) {
		
		Hotel hotelupdate = hService.updateStatus(updateSn,updateStatus);
		m.addAttribute("hotelupdate", hotelupdate);
		
		return "redirect:hotelindex";
		}
	
	@RequestMapping(path = "/hotelupdate", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //修改
	public String processHotelUpdate(@RequestParam(name = "upId") BigDecimal updateSn,
									 @RequestParam(name = "upName") String updateName,
									 @RequestParam(name = "upRegion") String updateRegion,
									 @RequestParam(name = "upAddress") String updatesn,
									 @RequestParam(name = "upTel") String updateTel,
									 @RequestParam(name = "upDBroom") BigDecimal updateDBroom,
									 @RequestParam(name = "upQDroom") BigDecimal updateQDroom,
									 @RequestParam(name = "upDescription") String updateDescription,
									 @RequestParam(name = "upOpentime") String updateOpentime,
									 @RequestParam(name = "upType") String updateType,Model m) {
		
		Hotel hoteldetail = hService.update(updateSn,updateName,updateRegion,updatesn,updateTel,updateDBroom,updateQDroom,updateDescription,updateOpentime,updateType);
		m.addAttribute("hoteldetail", hoteldetail);
		
		return "asx54630/H_Modify";
		}
	
	@RequestMapping(path = "/hoteldelete", method = RequestMethod.POST) //刪除
	public String processHotelDelete(@RequestParam(name = "deleteId") BigDecimal deleteSn,Model m) {
		
		boolean hoteldelete = hService.delete(deleteSn);
		m.addAttribute("hoteldelete", hoteldelete);		
		
		return "redirect:hotelindex";
		}
}
