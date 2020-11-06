package innocence741.controller;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import rambo0021.pojo.AccountBean;

@Controller @Lazy
public class CarRentalCompanyController {
	
	@Autowired
	CarRentalCompanyViewService carRentalCompanyViewService;
	
	@Autowired
	CarRentalCompanyService carRentalCompanyService;

	@RequestMapping(path = "/Tindex.controller", method = RequestMethod.GET)
	public String Tindex() {
		return "innocence741/CarIndex";
	}
	
	@RequestMapping(path = "/THomepageindex.controller", method = RequestMethod.GET)
	public String THomepageindex() {
		return "innocence741/CarHomepage";
	}
	
	@RequestMapping(path = "/carrentalcompany.controller", method = RequestMethod.POST)
	public @ResponseBody List<CarRentalCompanyVO> processAction1() throws SQLException {
		List<CarRentalCompanyVO> list = new ArrayList<CarRentalCompanyVO>();
		list = carRentalCompanyViewService.getCarRentalCompanysList();
        System.out.println(list);
        return list;
	}
	
	@RequestMapping(path = "/carrentalcompanyHomepage.controller", method = RequestMethod.POST)
	public @ResponseBody List<CarRentalCompanyVO> carrentalcompanyHomepage(@RequestParam(name = "sn_rentalcompany") BigDecimal sn_rentalcompany) throws SQLException {
		List<CarRentalCompanyVO> list = new ArrayList<CarRentalCompanyVO>();
		list = carRentalCompanyViewService.getCarRentalCompanysHomepageList(sn_rentalcompany);
        System.out.println(list);
        return list;
	}
	
	@RequestMapping(path = "/ShowCarRentalCompanyPic")
	public ResponseEntity<byte[]> ShowAccountPic(@CookieValue(value  = "CRC") BigDecimal sn_rentalcompany) throws IOException{
		System.out.println("------------------hahahahaha------------------");
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		CarRentalCompany carRentalCompany = carRentalCompanyService.getCarRentalCompanyBean(sn_rentalcompany);
		return new ResponseEntity<byte[]>(carRentalCompany.getPic_rentalcompany(), headers, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/delCarRentalCompany")
	public @ResponseBody Map<String, String> delCarRentalCompany(@RequestParam(name = "sn_rentalcompany") BigDecimal sn_rentalcompany) {
		Map<String, String> checkMap = new HashMap<String, String>();
		String check = "fail";
		checkMap.put("check", check);
		boolean flag = carRentalCompanyService.delCarRentalCompany(sn_rentalcompany);
		if(flag = true) {
			check = "success";
			checkMap.put("check", check);
		}
		return checkMap;
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
		
		boolean flag = false;

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
		
		
		if(pic_rentalcompany_tmp.getSize() != 0)
			flag = carRentalCompanyService.updateCarRentalCompany(cBean);
		else
			flag = carRentalCompanyService.updateCarRentalCompanyWithoutPic(cBean);
		System.out.println(flag);
//		System.out.println(description.length()==0);	//true
		String check = "{\"check\" : \"success\"}";
        return check;
	}
}