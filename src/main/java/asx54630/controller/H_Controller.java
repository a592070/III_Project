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

	
	@RequestMapping(path = "/hotelselect", method = RequestMethod.GET , produces = "text/plain;charset=UTF-8")
	public String processHotelSelectPage(@RequestParam(name = "keyword") String keyword, @RequestParam(name = "regionkeywd") String regionkeywd, @RequestParam(name = "typekeywd") String typekeywd, Model m) {
		
		List<Hotel> hoteldata = hService.selectAll(keyword, regionkeywd,typekeywd);
		m.addAttribute("hoteldata", hoteldata);
		
		return "asx54630/H_index";
		}
	
	@RequestMapping(path = "/hotelupdate", method = RequestMethod.GET , produces = "text/plain;charset=UTF-8")
	public String processHotelUpdate(@RequestParam(name = "detailsn") String detailsn, Model m) {
		BigDecimal detsn = new BigDecimal(detailsn);
		
		Hotel hotelupdate = hService.hotelDetail(detsn);
		m.addAttribute("hotelupdate", hotelupdate);
		
		return "asx54630/H_index";
		}
}
