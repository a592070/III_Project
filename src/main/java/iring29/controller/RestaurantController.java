package iring29.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import iring29.model.ModifyService;
import iring29.model.Restaurant;
import iring29.model.RestaurantService;
import iring29.model.Show_RView;
import utils.IOUtils;

@Controller
@SessionAttributes(names = { "rBean" })
public class RestaurantController {
	@Autowired
	private RestaurantService rs;
	@Autowired
	private ModifyService ms;

//	@ModelAttribute("rBean")
//	public Show_RView Restaurant() {
//		System.out.println("test");
//		return new Show_RView();
//	}

	@RequestMapping(path = "/Restaurant", method = RequestMethod.GET)
	public String RestaurantDisplay(Model m) {
		List<Show_RView> rBean = rs.totalRestaurant();
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}

	@RequestMapping(path = "/regionSearch", method = RequestMethod.POST)
	public String R_RegionDisplay(@RequestParam("region_name") String region_name, Model m) {
		if (region_name == null || region_name.equals("")) {
			List<Show_RView> rBean = rs.totalRestaurant();
			m.addAttribute("rBean", rBean);
		} else {
			List<Show_RView> rBean = rs.regionRestaurant(region_name);
			m.addAttribute("rBean", rBean);
		}
		return "iring29/R_index";
	}

	@RequestMapping(path = "/nameSearch", method = RequestMethod.POST)
	public String R_NameDisplay(@RequestParam("restaurant_name") String name, Model m) {
		String rname = name.trim();
		List<Show_RView> rBean = rs.nameRestaurant(rname);
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}

	@RequestMapping(path = "/usernameSearch", method = RequestMethod.POST)
	public String userDisplay(@RequestParam("username") String username, Model m) {
		List<Show_RView> rBean = rs.userRestaurant(username);
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}

	@RequestMapping(path = "/DisplayRestaurant", method = RequestMethod.POST)
	public String RestaurantDetail(@RequestParam("r_sn") BigDecimal r_sn, Model m) throws IOException {
		Restaurant rBean = rs.restaurantInfo(r_sn);
		m.addAttribute("rBean", rBean);
		return "iring29/R_modify";
	}

	@RequestMapping(path = "/ShowPic")
	public ResponseEntity<byte[]> ShowPic(@ModelAttribute("rBean") Restaurant r) {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);

		return new ResponseEntity<byte[]>(r.getPic(), headers, HttpStatus.OK);
	}

	@RequestMapping(path = "/InModifyImg", method = RequestMethod.POST)
	public String InModifyImg() {
		return "iring29/ModifyImg";
	}

	@RequestMapping(path = "/ModifyImg", method = RequestMethod.POST)
	public String ModifyImg(@ModelAttribute("rBean") Restaurant r, @RequestParam("picture") byte[] img, Model m) {
		
		Restaurant rBean = r;
		ByteArrayInputStream in = new ByteArrayInputStream(img);
		r.setPic(in.readAllBytes());
		
		m.addAttribute("rBean", rBean);
		return "iring29/R_modify";

	}

	@RequestMapping(path = "/InModifyInfo", method = RequestMethod.POST)
	public String InModifyInfo() {
		return "iring29/Modify_Info";
	}

	@RequestMapping(path = "/ModifyInfo", method = RequestMethod.POST)
	public String ModifyInfo(@ModelAttribute("rBean") Restaurant r, @RequestParam("opentime") String opentime,
			@RequestParam("description") String description, @RequestParam("finalDecision") String decision, Model m) {
		String op = opentime;
		String des = description;
		Restaurant rBean = r;
		if (decision.equals("confirmI")) {
			if (op == "") {
				op = r.getOpentime();
			}
			if (des == "") {
				des = r.getDescription();
			}
			rBean = ms.R_Info(op, des, r.getR_sn());
		}
		m.addAttribute("rBean", rBean);
		return "iring29/R_modify";
	}

	@RequestMapping(path = "/InModifyLocation", method = RequestMethod.POST)
	public String InModifyLocation() {
		return "iring29/Modify_Location";
	}

	@RequestMapping(path = "/ModifyLocation", method = RequestMethod.POST)
	public String ModifyLocation(@ModelAttribute("rBean") Restaurant r, @RequestParam("address") String address,
			@RequestParam("transportation") String transportation, @RequestParam("finalDecision") String decision,
			Model m) {
		String add = address;
		String trans = transportation;
		Restaurant rBean = r;
		if (decision.equals("confirmL")) {
			if (add == "") {
				add = r.getAddress();
			}
			if (trans == "") {
				trans = r.getTransportation();
			}
			rBean = ms.R_Address(add, trans, r.getR_sn());
		}
		m.addAttribute("rBean", rBean);
		return "iring29/R_modify";
	}

	@RequestMapping(path = "/InModifyType", method = RequestMethod.POST)
	public String InModifyType() {
		return "iring29/Modify_Type";
	}

	@RequestMapping(path = "/ModifyType", method = RequestMethod.POST)
	public String ModifyType(@ModelAttribute("rBean") Restaurant r, @RequestParam("serviceinfo") String serviceinfo,
			@RequestParam("type") String type, @RequestParam("finalDecision") String decision, Model m) {
		String ser = serviceinfo;
		System.out.println("ser = " + ser);
		String ty = type;
		Restaurant rBean = r;
		if (decision.equals("confirmT")) {
			if (ser == "") {
				ser = r.getServiceinfo();
			}
			if (ty == "") {
				ty = r.getType();
			}
			rBean = ms.R_Type(ser, ty, r.getR_sn());
		}
		m.addAttribute("rBean", rBean);
		return "iring29/R_modify";
	}

}
