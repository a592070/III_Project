package iring29.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import iring29.model.R_Comment;
import iring29.model.Restaurant;
import iring29.model.Restaurant_VO;
import iring29.model.UserPage;
import iring29.service.F_RestaurantService;
import oracle.net.aso.m;
import utils.StringUtil;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

@Controller
//@SessionAttributes(names = { "res_data" })
public class F_RestaurantController {

	@Autowired
	private F_RestaurantService F_Serivce;
	
	@Autowired
	private UserPage userPage;
	
	private int start = 0;

	@RequestMapping(path = "/Restaurant_index")
	public String RestaurantDisplay(HttpSession session, Model m) {
		String name = "";
		String region = "";
		start = 0;
		Date date = new Date();
		Calendar calendar = new GregorianCalendar(); 
		calendar.setTime(date); 
		calendar.add(calendar.DATE,1); //把日期往后增加一天,整数  往后推,负数往前移动 
		date=calendar.getTime(); //这个时间就是日期往后推一天的结果 
		
	    SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd");       
	    
	    String book_date = bartDateFormat.format(date);  
	    int person_number = 1;
		int size = F_Serivce.numRestaurant(name, region);
		userPage.setTotalCount(size);
		userPage.setCurrentPage(1);
		List<Restaurant_VO> res_data = F_Serivce.findMulti_R(start, userPage.getPageSize(), name, region);
		
		m.addAttribute("res_data", res_data);
		m.addAttribute("userPage", userPage);
		session.setAttribute("book_date", book_date);
		session.setAttribute("person_number", person_number);
		return "iring29/Restaurant";
	}

	@RequestMapping(path = "/SearchRestaurant", method = RequestMethod.POST)
	public String DisplayRestaurant(@RequestParam(name = "region_name") String region_name,
								    			  @RequestParam(name = "restaurant_name") String restaurant_name, 
								    			  @RequestParam(name = "book_date") String book_date,
								    			  @RequestParam(name = "person_number") Integer person_number,
								    			  @RequestParam(name = "currentPage") Integer currentPage,
								    			  HttpSession session, Model m) {
		
		int size = F_Serivce.numRestaurant(restaurant_name, region_name);
		System.out.println("size = " + size);
		userPage.setTotalCount(size);
		if(size == 0) {
			userPage.setCurrentPage(1);
			userPage.setTotalCount(size);
		}
		System.out.println("total page = " + userPage.getTotalPageCount());
		userPage.setCurrentPage(currentPage);
		start = (currentPage - 1)* userPage.getPageSize();
		
		List<Restaurant_VO> res_data = F_Serivce.findMulti_R(start, userPage.getPageSize(), restaurant_name, region_name);
		
		session.setAttribute("book_date", book_date);
		session.setAttribute("person_number", person_number);
		m.addAttribute("res_data", res_data);
		m.addAttribute("userPage", userPage);
		
		return "iring29/appendPage";

	}
	
	@RequestMapping(path = "/DisplayRestaurant", method = RequestMethod.POST)
	public String ShowRestaurant(@RequestParam(name = "restaurant_name") String restaurant_name, 
		    				     HttpSession session, Model m) {
		System.out.println("res name = " + restaurant_name);
		Restaurant res_data = F_Serivce.findRestaurant(restaurant_name);
		List<R_Comment> comment = F_Serivce.ResComment(res_data.getR_sn());
		session.setAttribute("res_data", res_data);
		session.setAttribute("comment", comment);
		return "iring29/DisplayRestaurant";
	}
	
	@RequestMapping(path = "/ShowRPic")
	public ResponseEntity<byte[]> ShowPic(HttpSession session) {
		Restaurant r = (Restaurant) session.getAttribute("res_data");
		System.out.println("in pic " + r.getName());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(r.getPic(), headers, HttpStatus.OK);
	}
	
	@GetMapping("/Restaurant/pic/{res.r_sn}")
	@ResponseBody
	public ResponseEntity<byte[]> DisplayPic(@PathVariable(name = "res.r_sn") BigDecimal r_sn) {
		System.out.println("in pic ");
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(F_Serivce.getPic(r_sn), headers, HttpStatus.OK);
	}
	
	
}
