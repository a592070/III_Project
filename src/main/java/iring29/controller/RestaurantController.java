package iring29.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import iring29.model.RestaurantDAO;
import iring29.model.Show_RView;

@Controller
@SessionAttributes(names = {"rBean"})
public class RestaurantController {
	
	@RequestMapping(path = "/Restaurant.controller")
	public String RestaurantDidplay(Model m) {
		RestaurantDAO rDAO = new RestaurantDAO();
		List<Show_RView> rBean = rDAO.totalRestaurant();
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}
	
	@RequestMapping(path = "/regionSearch")
	public String R_RegionDidplay(@ModelAttribute("restaurants") Show_RView r, BindingResult result, Model m) {
		RestaurantDAO rDAO = new RestaurantDAO();
		List<Show_RView> rBean = rDAO.regionRestaurant(r.getRegion());
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}
	
	@RequestMapping(path = "/nameSearch")
	public String R_NameDidplay(@ModelAttribute("restaurants") Show_RView r, BindingResult result, Model m) {
		RestaurantDAO rDAO = new RestaurantDAO();
		List<Show_RView> rBean = rDAO.nameRestaurant(r.getName());
		m.addAttribute("rBean", rBean);
		return "iring29/R_index";
	}
	
	
	
}
