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
import rambo0021.pojo.AccountBean;
import utils.StringUtil;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

@SessionAttributes(names = { "userBean" })
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
	    BigDecimal fisrtStar = BigDecimal.ZERO; 
	    BigDecimal endStar = BigDecimal.valueOf(5);
		int size = F_Serivce.numRestaurant(name, region, fisrtStar, endStar);
		userPage.setTotalCount(size);
		userPage.setCurrentPage(1);
		List<Restaurant_VO> res_data = F_Serivce.findMulti_R(start, userPage.getPageSize(), name, region, fisrtStar, endStar);
		
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
								    			  @RequestParam(name = "stars") BigDecimal stars,
								    			  @RequestParam(name = "currentPage") Integer currentPage,
								    			  HttpSession session, Model m) {
		
		BigDecimal fisrtStar = stars; 
		System.out.println("fist star = " + fisrtStar);
		if(fisrtStar == null) {
			fisrtStar = BigDecimal.ZERO;
		}
		BigDecimal endStar = BigDecimal.valueOf(5);
		int size = F_Serivce.numRestaurant(restaurant_name, region_name, fisrtStar, endStar);
		System.out.println("size = " + size);
		userPage.setTotalCount(size);
		if(size == 0) {
			userPage.setCurrentPage(1);
			userPage.setTotalCount(size);
		}
		System.out.println("total page = " + userPage.getTotalPageCount());
		userPage.setCurrentPage(currentPage);
		start = (currentPage - 1)* userPage.getPageSize();
		
		List<Restaurant_VO> res_data = F_Serivce.findMulti_R(start, userPage.getPageSize(), restaurant_name, region_name, fisrtStar, endStar);
		
		session.setAttribute("book_date", book_date);
		session.setAttribute("person_number", person_number);
		m.addAttribute("res_data", res_data);
		m.addAttribute("userPage", userPage);
		
		return "iring29/appendPage";

	}
	
	@RequestMapping(path = {"/DisplayRestaurant/${res.r_sn}","/DisplayRestaurant/{restaurant_id}"}) 
	public String ShowRestaurant(
			@RequestParam(name = "r_sn", required = false) Integer r_sn,
//			@PathVariable(name="res.r_sn", required = false) Integer r_sn,  
			@PathVariable(name="restaurant_id", required = false) Integer restaurant_id,
			HttpSession session, Model m) {
		System.out.println("r_sn = " + r_sn);
		
		Restaurant res_data = null;
//		if(!StringUtil.isEmpty(r_sn)) res_data=F_Serivce.findRestaurant(restaurant_name);
		if(r_sn != null && r_sn != 0) res_data = F_Serivce.findRestaurant(r_sn);
		if(restaurant_id != null && restaurant_id != 0) res_data = F_Serivce.findRestaurant(restaurant_id);
		
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
	
	//是否登入
	@RequestMapping(path = "checkLogin", method = RequestMethod.POST)
	public @ResponseBody boolean checkLogin(Model m) {
		AccountBean userBean =  (AccountBean) m.getAttribute("userBean");
		System.out.println("userBean = " + userBean);
		if(userBean == null) {
			System.out.println("未登入");
			return false;
		}else {
			return true;
		}
//		return true;
	}
	
	//留下留言
	@RequestMapping(path = "/addComment", method = RequestMethod.POST)
	public @ResponseBody boolean addComment(@RequestParam(name = "com_content") String comm, 
											@RequestParam(name = "rating") BigDecimal rating,
											@RequestParam(name = "id") BigDecimal id,
										    HttpSession session, Model m) {
		Boolean flag = false;
		AccountBean userBean = (AccountBean) m.getAttribute("userBean");
		Restaurant r = (Restaurant) session.getAttribute("res_data");
		boolean commResult = F_Serivce.userComment(id);
		System.out.println("comm result = " + commResult);
		if(commResult == true) {
			R_Comment comment = new R_Comment();
			comment.setCom_content(comm);
			comment.setRestaurant(r);
			comment.setRating(rating);
			comment.setUsername(userBean.getUserName());
			comment.setrOrderId(id);
			boolean addresult = F_Serivce.addComment(comment);
			List<R_Comment> commentlist = F_Serivce.ResComment(r.getR_sn());
			session.setAttribute("comment", commentlist);
			flag = addresult;
			return flag;
		}
		return false;
	}
	
	//re-flash comment
	@RequestMapping(path = "/flashComment", method = RequestMethod.POST)
	public String flashComment(HttpSession session) {
		Restaurant r = (Restaurant) session.getAttribute("res_data");
		List<R_Comment> commentlist = F_Serivce.ResComment(r.getR_sn());
		session.setAttribute("comment", commentlist);
		return "iring29/comments";
	}
	
}
