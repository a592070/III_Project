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

import iring29.model.RestaurantService;
import iring29.model.Show_RView;

@Controller
@SessionAttributes(names = {"rBean"})
public class RestaurantController {
	@Autowired
	private RestaurantService rs;
	
	@RequestMapping(path = "/Restaurant.controller")
	public String RestaurantDidplay(Model m) {
		List<Show_RView> rBean = rs.totalRestaurant();
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}
	
	@RequestMapping(path = "/regionSearch" , method = RequestMethod.POST)
	public String R_RegionDidplay(@ModelAttribute("rBean") Show_RView r, Model m) {
		List<Show_RView> rBean = rs.regionRestaurant(r.getRegion());
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}
	
	@RequestMapping(path = "/nameSearch", method = RequestMethod.POST)
	public String R_NameDidplay(@ModelAttribute("rBean") Show_RView r, Model m) {
		List<Show_RView> rBean = rs.nameRestaurant(r.getName());
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}
	
	
	
}
