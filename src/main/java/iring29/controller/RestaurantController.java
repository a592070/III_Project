package iring29.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import iring29.model.ModifyService;
import iring29.model.Restaurant;
import iring29.model.RestaurantService;
import iring29.model.Show_RView;

@Controller
@SessionAttributes(names = { "rBean" })
public class RestaurantController {
	@Autowired
	private RestaurantService rs;
	@Autowired
	private ModifyService ms;

	@RequestMapping(path = "/Restaurant", method = RequestMethod.GET)
	public String RestaurantDisplay(Model m) {
		List<Show_RView> rBean = rs.totalRestaurant();
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}

	@RequestMapping(path = "/regionSearch", method = RequestMethod.POST)
	public String R_RegionDisplay(@ModelAttribute("rBean") Show_RView r, Model m) {
		List<Show_RView> rBean = rs.regionRestaurant(r.getRegion());
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}

	@RequestMapping(path = "/nameSearch", method = RequestMethod.POST)
	public String R_NameDisplay(@ModelAttribute("rBean") Show_RView r, Model m) {
		List<Show_RView> rBean = rs.nameRestaurant(r.getName());
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}

	@RequestMapping(path = "/DisplayRestaurant", method = RequestMethod.POST)
	public String RestaurantDetail(@ModelAttribute("rBean") Restaurant r, Model m) {
		Restaurant rBean = rs.restaurantInfo(r.getR_sn());
		m.addAttribute("rBean", rBean);
		return "iring29/R_modify";
	}

	@RequestMapping(path = "/ModifyPic", method = RequestMethod.POST)
	public String ModifyPic(@ModelAttribute("rBean") Restaurant r, Model m) {
		Restaurant rBean = ms.R_Img(r.getPic(), r.getR_sn());
		m.addAttribute("rBean", rBean);
		return "ring29/R_modify";
		
	}

}
