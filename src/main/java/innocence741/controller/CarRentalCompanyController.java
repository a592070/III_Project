package innocence741.controller;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import innocence741.model.CarRentalCompany;
import innocence741.service.CarRentalCompanyService;
import innocence741.model.CarRentalCompanyVO;
import innocence741.model.CarRentalCompanyViewDAO;
import innocence741.service.CarRentalCompanyViewService;

@Controller @Lazy
public class CarRentalCompanyController {
	
	@Autowired
	CarRentalCompanyViewService carRentalCompanyViewService;
	
	@Autowired
	CarRentalCompanyService carRentalCompanyService;

	@RequestMapping(path = "/Tindex.controller", method = RequestMethod.GET)
	public String hahaIndex() {
		return "innocence741/BackEnd_CarRentalCompany";
	}
	
	@RequestMapping(path = "/carrentalcompany.controller", method = RequestMethod.POST)
	public @ResponseBody List<CarRentalCompanyVO> processAction1() throws SQLException {
		List<CarRentalCompanyVO> list = new ArrayList<CarRentalCompanyVO>();
		list = carRentalCompanyViewService.getCarRentalCompanysList();
        System.out.println(list);
        return list;
	}
	
	
	@RequestMapping(path = "/update.carrentalcompany.controller", method = RequestMethod.POST)
	public @ResponseBody String updateAction(@RequestParam(name = "sn_rentalcompany") BigDecimal sn_rentalcompany,
											 @RequestParam(name = "name_company") String name_company,
											 @RequestParam(name = "address") String address,
											 @RequestParam(name = "description") String description,
											 @RequestParam(name = "oprnHours") String oprnHours,
											 @RequestParam(name = "tel") String tel,
											 @RequestParam(name = "compantAccount") String compantAccount,
											 @RequestParam(name = "pic_rentalcompany") MultipartFile pic_rentalcompany_tmp,
											 @RequestParam(name = "accessible_carrentalcompany") int accessible_carrentalcompany) 
	throws SQLException, IOException {
		CarRentalCompany cBean = new CarRentalCompany();
		cBean.setSn_rentalcompany(sn_rentalcompany);
		cBean.setName_company(name_company);
		cBean.setAddress(address);
		cBean.setDescription(description);
		cBean.setOprnHours(oprnHours);
		cBean.setTel(tel);
		cBean.setCompantAccount(compantAccount);
		cBean.setPic_rentalcompany(pic_rentalcompany_tmp.getInputStream().readAllBytes());
		cBean.setAccessible_carrentalcompany(accessible_carrentalcompany);
		
		System.out.println("cBean.getAccessible_carrentalcompany(): "+cBean.getAccessible_carrentalcompany());
		
		boolean flag = carRentalCompanyService.updateCarRentalCompany(cBean);
		System.out.println(flag);
//		System.out.println(description.length()==0);	//true
		String check = "{\"check\" : \"success\"}";
        return check;
	}
}
