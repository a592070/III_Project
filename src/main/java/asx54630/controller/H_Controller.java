package asx54630.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import asx54630.model.Hotel;
import asx54630.service.H_Service;


@Controller
public class H_Controller {

	@Autowired
	private H_Service hService;
		
	@RequestMapping(path = "/hotelindex", method = RequestMethod.GET)
	public String processHotelPage(Model m) {
		
		List<Hotel> hoteldata = hService.selectAll("","","");
		m.addAttribute("hoteldata", hoteldata);
		
		return "asx54630/H_index";
		}
	
	
	@RequestMapping(path = "/hoteldetail", method = RequestMethod.GET) //查詢單筆_給修改用
	public String processHotelDetail(@RequestParam(name = "detailsn") BigDecimal detailsn,Model m) {
			
		Hotel hoteldetail = hService.hotelDetail(detailsn);
		m.addAttribute("hoteldetail", hoteldetail);
		
		return "asx54630/H_Modify";
		}
	
	@RequestMapping(path = "/hotelselect", method = RequestMethod.GET , produces = "text/plain;charset=UTF-8") //查詢
	public String processHotelSelectPage(@RequestParam(name = "keyword") String keyword, @RequestParam(name = "regionkeywd") String regionkeywd, @RequestParam(name = "typekeywd") String typekeywd, Model m) {

		List<Hotel> hoteldata = hService.selectAll(keyword, regionkeywd,typekeywd);
		m.addAttribute("hoteldata", hoteldata);
		
		return "asx54630/H_index";
		}
	
	@RequestMapping(path = "/hotelupdate", method = RequestMethod.POST , produces = "text/plain;charset=UTF-8") //修改
	public String processHotelUpdate(@RequestParam(name = "upId") String updateSn,
									 @RequestParam(name = "upName") String updateName,
									 @RequestParam(name = "upRegion") String updateRegion,
									 @RequestParam(name = "upAddress") String updatesn,
									 @RequestParam(name = "upTel") String updateTel,
									 @RequestParam(name = "upDBroom") String updateDBroom,
									 @RequestParam(name = "upQDroom") String updateQDroom,
									 @RequestParam(name = "upDescription") String updateDescription,
									 @RequestParam(name = "upOpentime") String updateOpentime,
									 @RequestParam(name = "upType") String updateType,Model m) {
		BigDecimal bsn = new BigDecimal(updateSn);
		BigDecimal bdbroom = new BigDecimal(updateDBroom);
		BigDecimal dqdroom = new BigDecimal(updateQDroom);
		
		Hotel hotelupdate = hService.update(bsn,updateName,updateRegion,updatesn,updateTel,bdbroom,dqdroom,updateDescription,updateOpentime,updateType);
		m.addAttribute("hotelupdate", hotelupdate);
		
		return "redirect:hotelindex";
		}
	
	@RequestMapping(path = "/hoteldelete", method = RequestMethod.POST) //刪除
	public String processHotelDelete(@RequestParam(name = "deleteId") String deleteSn,Model m) {
		BigDecimal dsn = new BigDecimal(deleteSn);
		
		boolean hoteldelete = hService.delete(dsn);
		m.addAttribute("hoteldelete", hoteldelete);		
		
		return "redirect:hotelindex";
		}
}
