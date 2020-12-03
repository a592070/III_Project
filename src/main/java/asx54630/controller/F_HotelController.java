package asx54630.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import asx54630.model.HotelPage;

@Controller
public class F_HotelController {

	@Autowired
	private HotelPage hpage;
	
	private int start = 0;
	private static final int PAGESIZE = 6;
	
	@RequestMapping(path = "/Hotel_index")
	public String HotelDisplay() {
		return "asx54630/F_H_index";
	}
}
