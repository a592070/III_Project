package iring29.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import iring29.model.Restaurant;
import iring29.model.Restaurant_VO;
import iring29.service.F_RestaurantService;
import utils.StringUtil;
import java.util.Base64;

@Controller
//@SessionAttributes(names = { "res_data" })
public class F_RestaurantController {

	@Autowired
	private F_RestaurantService F_Serivce;

	@RequestMapping(path = "/Restaurant_index")
	public String RestaurantDisplay() {
		return "iring29/Restaurant_index";
	}

	@RequestMapping(path = "/SearchRestaurant", method = RequestMethod.POST)
	public String DisplayRestaurant(@RequestParam(name = "region_name") String region_name,
								    @RequestParam(name = "restaurant_name") String restaurant_name, 
								    @RequestParam(name = "book_date") String book_date,
								    @RequestParam(name = "person_number") Integer person_number,
								    HttpSession session, Model m) {
//		session.removeAttribute("res_data");
		
		if (!StringUtil.isEmpty(region_name) && !StringUtil.isEmpty(restaurant_name)) {
			List<Restaurant_VO> Multi_Rdata = F_Serivce.findMulti_Name_Region(restaurant_name, region_name);
			session.setAttribute("res_data", Multi_Rdata);
			session.setAttribute("book_date", book_date);
			session.setAttribute("person_number", person_number);
			return "iring29/MultiRestaurant";

		}  else if (restaurant_name != null && region_name == null || restaurant_name != "" && region_name == "") {
			int num = F_Serivce.numRestaurant(restaurant_name);
			if (num == 1) {
				Restaurant res_data = F_Serivce.findRestaurant(restaurant_name);
				session.setAttribute("res_data", res_data);
				session.setAttribute("book_date", book_date);
				session.setAttribute("person_number", person_number);
				return "iring29/DisplayRestaurant";
			} else if (num > 1) {
				List<Restaurant_VO> Multi_Rdata = F_Serivce.findMulti_R(restaurant_name);
				session.setAttribute("res_data", Multi_Rdata);
				session.setAttribute("book_date", book_date);
				session.setAttribute("person_number", person_number);
				return "iring29/MultiRestaurant";

			} else {
				return "iring29/BackHome";
			}
		} else if (region_name != null && restaurant_name == null|| region_name != "" && restaurant_name == "") {
			List<Restaurant_VO> res_data_region = F_Serivce.findRegion(region_name);
			m.addAttribute("res_data", res_data_region);
			session.setAttribute("book_date", book_date);
			session.setAttribute("person_number", person_number);
			return "iring29/MultiRestaurant";

		}else {
			return "iring29/Restaurant_index";
		}
	}
	
	@RequestMapping(path = "/DisplayRestaurant", method = RequestMethod.POST)
	public String ShowRestaurant(@RequestParam(name = "restaurant_name") String restaurant_name, 
		    				     HttpSession session, Model m) {
		System.out.println("res name = " + restaurant_name);
		Restaurant res_data = F_Serivce.findRestaurant(restaurant_name);
		session.setAttribute("res_data", res_data);
		return "iring29/DisplayRestaurant";
	}
	
	@RequestMapping(path = "/ShowRPic")
	public ResponseEntity<byte[]> ShowPic(HttpSession session) {
//		@ModelAttribute("res_data") Restaurant r
		Restaurant r = (Restaurant) session.getAttribute("res_data");
		System.out.println("in pic " + r.getName());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(r.getPic(), headers, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/DisplayPic")
	public ResponseEntity<byte[]> DisplayPic(@ModelAttribute("pic") byte[] r) {
		System.out.println("in pic ");
//		String pic = Base64.getEncoder().encodeToString(r);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
//		System.out.println("pic = " + pic);
		return new ResponseEntity<byte[]>(r, headers, HttpStatus.OK);
	}

	
}
