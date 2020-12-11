package rambo0021.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import iring29.model.Restaurant;
import iring29.service.RestaurantService;
import rambo0021.dao.SHA2DAO;
import rambo0021.dao.VerifyRecaptcha;
import rambo0021.pojo.AccountBean;
import rambo0021.pojo.IdentityBean;
import rambo0021.serive.AccountService;

@Controller
@Lazy
@SessionAttributes(names = { "reqURL","userBean"})
@RequestMapping("/user")
public class UserController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;
	
	@Autowired
	private RestaurantService rs;
	
    //前台註冊
	@RequestMapping("/signup")
	public @ResponseBody HashMap<String, String> signup(@RequestParam Integer identity,
			                           @RequestParam String username,
			                           @RequestParam String password,
			                           @RequestParam(defaultValue = "無") String email,
			                           @RequestParam(required = false) String nickname,
			                           @RequestParam(name="Apicture",required = false) MultipartFile img,
			                           @RequestParam(required = false) String Rname,
			                           @RequestParam(required = false) MultipartFile Rpicture,
			                           @RequestParam(required = false) String Rregion,
			                           @RequestParam(required = false) String Raddress,
			                           @RequestParam(required = false) String Rtrans,
			                           @RequestParam(required = false) String Rservice,
			                           @RequestParam(required = false) String Rtype,
			                           @RequestParam(required = false) String Ropentime,
			                           @RequestParam(required = false) String Rdescription
			                          
			) throws IOException
	{   
		
		IdentityBean iBean = new IdentityBean();
		iBean.setId(identity);
		if(identity ==3) {
          img=Rpicture;
		}
		String accRs = service.registered(new AccountBean(username, SHA2DAO.getSHA256(password), email, img.getInputStream().readAllBytes(), new Date(), nickname, new Date(), "啟用"), iBean);
		HashMap<String, String> map = new HashMap<String,String>();
		if(3==identity) {
			System.out.println("餐廳註冊");
			Restaurant rBean = new Restaurant();
			rBean.setPic(Rpicture.getInputStream().readAllBytes());
			rBean.setName(Rname);
			rBean.setRegion(Rregion);
			rBean.setAddress(Raddress);
			rBean.setTransportation(Rtrans);
			rBean.setServiceinfo(Rservice);
			rBean.setType(Rtype);
			rBean.setOpentime(Ropentime);
			rBean.setDescription(Rdescription);
			rBean.setAccountBean(service.userDetail(username));

			rBean.setTablenum(BigDecimal.valueOf(2));
			rBean.setStatus("Y");

			String rResult = rs.inserRestaurant(rBean);
			map.put("rResult", rResult);
			
		}
		map.put("accRs",accRs);
		
		return map;
	}
	//前台登入 
	@RequestMapping("/signin")
	public @ResponseBody HashMap<String, String> signim(@ModelAttribute(name="reqURL") String reqURL,@RequestParam String username, @RequestParam String password,
			@RequestParam("g-recaptcha-response") String recaptcha,Model m) throws IOException{
		System.out.println("reqURL="+reqURL);
		boolean verify = VerifyRecaptcha.verify(recaptcha);
		AccountBean aBean = service.userDetail(username);
		HashMap<String, String> map = new HashMap<String,String>();
		if(!verify) {
			map.put("LoginError", "驗證不通過" );
			return map;
		}else if(aBean == null || !aBean.getPassword().equals(SHA2DAO.getSHA256(password))) {
			map.put("LoginError", "帳號或密碼錯誤" );
		return map;
		}else if(!"啟用".equals(aBean.getStatus())) {
			map.put("LoginError", "此帳號已被禁用" );
			return map;
		}
		m.addAttribute("userBean", aBean.getUserName());
		map.put("LoginInfo", "登入成功");
		map.put("reqURL", reqURL);
		return map;
	}
	
	@RequestMapping("singout")
	public  String singout(HttpSession session, SessionStatus sessionStatus,HttpServletRequest req) {
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/FunTaiwan";
	}
	
	
	
}
