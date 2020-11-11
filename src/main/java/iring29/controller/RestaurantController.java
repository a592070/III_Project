package iring29.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import iring29.model.Page;
import iring29.model.Restaurant;
import iring29.model.Show_RView;
import iring29.service.RestaurantService;

@Controller
@SessionAttributes(names = { "rBean", "RBean"  })
public class RestaurantController {
	@Autowired
	private RestaurantService rs;
	@Autowired
	private Page page;

	private int start = 0;

	@RequestMapping(path = "/Restaurant", method = RequestMethod.GET)
	public String RestaurantDisplay(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,
			Model m) {
		int size = rs.getSize();
		page.setTotalCount(size);
		System.out.println("currentPage = " + currentPage);
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

	@RequestMapping(path = "/key", method = RequestMethod.GET)
	public String RestaurantKeyword(@RequestParam(value = "currentKPage", defaultValue = "1") Integer currentKPage,
			@RequestParam("keyword") String keyword,
			@RequestParam(value = "orderFiled", defaultValue = "r_sn") String orderFiled, Model m) {

		if (keyword == null || keyword.equals("")) {

			return "redirect:Restaurant";
		}

		int size = rs.getSizeByKeywords(keyword);
		page.setTotalCount(size);
		System.out.println("currentKPage = " + currentKPage);
		if (currentKPage == 1) {
			currentKPage = 1;
			start = 0;
		} else {
			start = (currentKPage - 1) * page.getPageSize();
		}
		int totalKPage = page.getTotalPageCount();
		List<Show_RView> rBean = rs.listByKeywords(start, page.getPageSize(), keyword, orderFiled);
		m.addAttribute("rBean", rBean);
		m.addAttribute("currentKPage", currentKPage);
		m.addAttribute("totalKPage", totalKPage);
		m.addAttribute("keyword", keyword);
		return "iring29/R_index";

	}

	@RequestMapping(path = "/ModifyStatus", method = RequestMethod.POST)
	public String R_status(@RequestParam("status") String status, @RequestParam("r_sn") BigDecimal r_sn) {
		
		System.out.println("r_sn = " +r_sn);
		System.out.println("status = " +status);
		
		if (status.equals("Y")) {
			rs.updateStatus(r_sn, "N");
		} else if (status.equals("N")) {
			rs.updateStatus(r_sn, "Y");
		}
		return "redirect:Restaurant";
	}

	@RequestMapping(path = "/DisplayRestaurant", method = RequestMethod.POST)
	public String RestaurantDetail(@RequestParam("r_sn") BigDecimal r_sn, Model m) throws IOException {
		Restaurant rBean = rs.restaurantInfo(r_sn);
		m.addAttribute("RBean", rBean);
		return "iring29/R_modify";
	}
	
	@RequestMapping(path = "/regionSearch", method = RequestMethod.POST)
	public String R_RegionDisplay(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,
			@RequestParam("region_name") String region_name, Model m) {
		if (region_name == null || region_name.equals("")) {
			int size = rs.getSize();
			page.setTotalCount(size);
			System.out.println("currentPage = " + currentPage);
			if (currentPage == 1) {
				currentPage = 1;
			} else {
				start = (currentPage - 1) * 8;
			}
			int pageSize = page.getPageSize();
			int totalPage = page.getTotalPageCount();
			List<Show_RView> rBean = rs.totalRestaurant(start, pageSize);
			m.addAttribute("rBean", rBean);
			m.addAttribute("currentPage", currentPage);
			m.addAttribute("totalPage", totalPage);
			return "iring29/R_index";
		} else {
			int size = rs.getRegionSize(region_name);
			int start = 0;
			page.setTotalCount(size);
			System.out.println("currentPage = " + currentPage);
			if (currentPage == 1) {
				currentPage = 1;
			} else {
				start = (currentPage - 1) * 8;
			}
			int pageSize = page.getPageSize();
			int totalPage = page.getTotalPageCount();
			List<Show_RView> rBean = rs.regionRestaurant(start, pageSize, region_name);
			m.addAttribute("rBean", rBean);
			m.addAttribute("currentPage", currentPage);
			m.addAttribute("totalPage", totalPage);
		}
		return "iring29/R_index";
	}

	@RequestMapping(path = "/ShowPic")
	public ResponseEntity<byte[]> ShowPic(@ModelAttribute("RBean") Restaurant r) {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);

		return new ResponseEntity<byte[]>(r.getPic(), headers, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/ModifyRestaurant", method = RequestMethod.POST)
	public String ModifyRestaurant( @RequestParam("r_sn") BigDecimal r_sn, @RequestParam("address") String address,
			@RequestParam("opentime") String opentime, @RequestParam("description") String description,
			@RequestParam("transportation") String transportation, @RequestParam("type") String type,
			@RequestParam("region") String region, @RequestParam("serviceinfo") String serviceinfo,
			@RequestParam("pic") MultipartFile pic, Model m) throws IOException {
		
		Restaurant r = new Restaurant();
		if(pic.getSize() != 0) {
			r.setPic(pic.getInputStream().readAllBytes());
		}else {
			r.setPic(rs.getPic(r_sn));
		}
		
		Restaurant rBean = rs.updateRestaurant(r_sn, address, opentime, description, transportation, type,
				region, serviceinfo, r.getPic());
		m.addAttribute("RBean", rBean);
		return "iring29/R_modify";
	}

	@RequestMapping(path = "DeleteRestaurant", method = RequestMethod.POST)
	public String DelRestaurant(@RequestParam("r_sn") BigDecimal r_sn, Model m) {
		String result = rs.deleteRestaurant(r_sn);
		m.addAttribute("result",result);
		return "iring29/result";
	}

}
