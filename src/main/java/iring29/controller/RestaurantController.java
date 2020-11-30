package iring29.controller;


import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import iring29.model.Page;
import iring29.model.Restaurant;
import iring29.model.Show_RView;
import iring29.service.RestaurantService;
import rambo0021.pojo.AccountBean;

@Controller
@SessionAttributes(names = { "rBean", "RBean" })
@RequestMapping("/admin")
public class RestaurantController {
	@Autowired
	private RestaurantService rs;
	@Autowired
	private Page page;

	private int start = 0;

	@RequestMapping(path = "/Restaurant", method = RequestMethod.GET)
	public String RestaurantDisplay(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage, Model m) {
		int size = rs.getSize();
		page.setTotalCount(size);
		
		if (currentPage == 1) {
			currentPage = 1;
			start = 0;
		} else {
			start = (currentPage - 1) * page.getPageSize();
		}
		
		int pageSize = page.getPageSize();
		int totalPage = page.getTotalPageCount();
		
		List<Show_RView> rBean = rs.totalRestaurant(start, pageSize);
		
		m.addAttribute("rBean", rBean);
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("totalPage", totalPage);

		return "iring29/R_index";
	}

	@RequestMapping(path = "/key", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> RestaurantKeyword(@RequestParam(value = "currentPage") Integer currentPage,
									@RequestParam(value = "cgpage") String cgpage,
								    @RequestParam(value = "keyword") String keyword,
								    @RequestParam(value = "orderFiled") String orderFiled,
								    @RequestParam(value = "order") String order, 
								    @RequestParam(value = "region") String region) {
		int size;
		if(region.isEmpty()) {
			size = rs.getSizeByKeywords(keyword);
		}else if((!region.isEmpty()) && (!keyword.isEmpty())){
			size = rs.getSizeRK(region, keyword);
		}else {
			size = rs.getRegionSize(region);
		}
		page.setTotalCount(size);
		
		
		if(orderFiled.isEmpty()) {
			orderFiled = "r_sn";
		}
		
		if(cgpage.equals("1") || cgpage.isEmpty()) {
			
			page.setCurrentPage(currentPage);
			start = (currentPage - 1) * page.getPageSize();
			
		}else if(cgpage.equals("next")) {
			
			start = (currentPage) * page.getPageSize();
			page.setCurrentPage(currentPage + 1);
			
		}else if(cgpage.equals("previous")) {
			
			start = (currentPage - 2) * page.getPageSize();
			page.setCurrentPage(currentPage - 1);
			
		}else if(cgpage.equals("first")) {
			
			start = 0 ;
			page.setCurrentPage(1);
			
		}else {
			start = (page.getTotalPageCount()-1) * page.getPageSize();
		}
		
		System.out.println("page = "+page.getCurrentPage());
		
		List<Show_RView> Rlist;
		if(region.isEmpty()) {
			Rlist = rs.listByKeywords(start, page.getPageSize(), keyword, orderFiled, order);
		}else if((!region.isEmpty()) && (!keyword.isEmpty())){ 
			Rlist = rs.listByRK(start, page.getPageSize(), region, keyword, orderFiled, order);
		}else {
			Rlist = rs.regionRestaurant(start, page.getPageSize(), region, orderFiled, order);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("Rlist", Rlist);
		map.put("page", page);
		return map;
		

	}

	@RequestMapping(path = "/ModifyStatus", method = RequestMethod.POST)
	public @ResponseBody String R_status(@RequestParam("status") String status, @RequestParam("r_sn") BigDecimal r_sn) {

		if (status.equals("Y")) {
			return rs.updateStatus(r_sn, "N");
		} else if (status.equals("N")) {
			return rs.updateStatus(r_sn, "Y");
		}
		return "redirect:Restaurant";
	}

	@RequestMapping(path = "/DisplayRestaurant", method = RequestMethod.POST)
	public String RestaurantDetail(@RequestParam("r_sn") BigDecimal r_sn, Model m) throws IOException {
		Restaurant rBean = rs.restaurantInfo(r_sn);
		m.addAttribute("RBean", rBean);
		return "iring29/R_modify";
	}

	@RequestMapping(path = "/ShowPic")
	public ResponseEntity<byte[]> ShowPic(@ModelAttribute("RBean") Restaurant r) {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(r.getPic(), headers, HttpStatus.OK);
	}

	@RequestMapping(path = "/ModifyRestaurant", method = RequestMethod.POST)
	public String ModifyRestaurant(@RequestParam("r_sn") BigDecimal r_sn, 
								   @RequestParam("address") String address,
								   @RequestParam("opentime") String opentime, 
								   @RequestParam("description") String description,
								   @RequestParam("transportation") String transportation, 
								   @RequestParam("type") String type,
								   @RequestParam("region") String region, 
								   @RequestParam("serviceinfo") String serviceinfo,
								   @RequestParam("pic") MultipartFile pic, 
								   @RequestParam("userName") String userName, 
								   Model m) throws IOException {

		System.out.println("userName = " + userName);
		if(userName.isEmpty() || userName == null) {
			userName = "";
		}
		Restaurant r = new Restaurant();
		if (pic.getSize() != 0) {
			r.setPic(pic.getInputStream().readAllBytes());
		} else {
			r.setPic(rs.getPic(r_sn));
		}
		Restaurant rBean = rs.updateRestaurant(r_sn, address, opentime, description, transportation, type, region,
				serviceinfo, r.getPic(), userName);
		m.addAttribute("RBean", rBean);
		return "iring29/R_modify";
	}

	// Delete Restaurant
	@RequestMapping(path = "/DeleteRestaurant", method = RequestMethod.POST)
	public String DelRestaurant(@RequestParam("r_sn") BigDecimal r_sn, Model m) {
		String result = rs.deleteRestaurant(r_sn);
//		m.addAttribute("result", result);
		return "redirect:Restaurant";
	}

	// Create Restaurant
	@RequestMapping(path = "/NewRestaurant")
	public String NewRestaurant() {
		return "iring29/R_create";
	}

	@RequestMapping(path = "/CreateRestaurant", method = RequestMethod.POST)
	public String CreateRestaurant(@RequestParam("pic") MultipartFile pic, 
								   @RequestParam("name") String name,
								   @RequestParam("region") String region, 
								   @RequestParam("address") String address,
								   @RequestParam("transportation") String transportation, 
								   @RequestParam("serviceinfo") String serviceinfo,
								   @RequestParam("type") String type, 
								   @RequestParam("opentime") String opentime,
								   @RequestParam("description") String description, 
								   @RequestParam("username") String username, Model m) throws IOException {
		
		Restaurant rBean = new Restaurant();
		AccountBean accBean = new AccountBean();
		rBean.setPic(pic.getInputStream().readAllBytes());
		rBean.setName(name);
		rBean.setRegion(region);
		rBean.setAddress(address);
		rBean.setTransportation(transportation);
		rBean.setServiceinfo(serviceinfo);
		rBean.setType(type);
		rBean.setOpentime(opentime);
		rBean.setDescription(description);
		accBean.setUserName(username);
		rBean.setAccountBean(accBean);

		rBean.setTablenum(BigDecimal.valueOf(2));
		rBean.setStatus("Y");

		String result = rs.inserRestaurant(rBean);
		m.addAttribute("result", result);

		return "iring29/result";
	}
	
	
	//check user
	@RequestMapping(path = "checkUser",method = RequestMethod.POST)
	public @ResponseBody boolean checkUser(@RequestParam(name = "userName")String username) {
		return rs.checkusr(username);
	}

}
