package rambo0021.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import global.service.SendMailService;
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

	@Autowired@Qualifier("sendMailService")
	SendMailService sendMailService;
	
	
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
	public @ResponseBody HashMap<String, String> signin(@ModelAttribute(name="reqURL") String reqURL,@RequestParam String username, @RequestParam String password,
			@RequestParam("g-recaptcha-response") String recaptcha,Model m) throws IOException{
		System.out.println("reqURL="+reqURL);
		boolean verify = VerifyRecaptcha.verify(recaptcha);
//		verify=true;
		
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
		m.addAttribute("userBean", aBean);
		map.put("LoginInfo", "登入成功");
		map.put("reqURL", reqURL);
		return map;
	}
	//前台登出
	@RequestMapping("signout")
	public  String signout(HttpSession session, SessionStatus sessionStatus,HttpServletRequest req) {
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/FunTaiwan";
	}
	//個人頁面顯示圖片
	@RequestMapping("ShowUserPic")
	public @ResponseBody ResponseEntity<byte[]> ShowUserPic(@ModelAttribute("userBean") AccountBean aBean) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(aBean.getPicture(), headers, HttpStatus.OK);	
	}
	//顯示帳號圖片
	@RequestMapping("ShowUserPic/{username}")
	public @ResponseBody ResponseEntity<byte[]> ShowUserPic2(@PathVariable("username") String username) {
		AccountBean userBean = service.userDetail(username);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(userBean.getPicture(), headers, HttpStatus.OK);	
	}
	
	//修改個人資料
	@RequestMapping("updateUser")
	public @ResponseBody String updateUser(@RequestParam String username,@RequestParam("password") String password,@RequestParam String email,@RequestParam String nickName,HttpServletRequest request,HttpSession session) {
	    service.updateUser(username, password,email,nickName);
//	    String remoteAddr = request.getLocalAddr();
	    sendMailService.asyncSend(email, "個人資料修改通知", "您的個人資料已更改，如不是本人操作，請盡速更改密碼", "點我登入", "/user/signinPage", session);
	   return "ok";
	}
	//忘記密碼
	@RequestMapping("forgetPwd")
	public @ResponseBody String forgetPwd(@RequestParam String username,@RequestParam String email, HttpSession session) {
		String pwd =service.forgetPwd(username,email);
		System.out.println(pwd);
//		sendMailService.asyncSend(email, "密碼重置", "您的新密碼為"+pwd+"，請登入後更改密碼",session);
		sendMailService.asyncSend(email, "密碼重置", "您的新密碼為"+pwd+"，請登入後更改密碼", "點我登入", "/user/signinPage", session);
		return "ok";
	}
	//修改圖片
		@RequestMapping(path = "/udUserImg")
		public @ResponseBody String udAccountImg(@RequestParam String username, @RequestParam("Apicture") MultipartFile img,
				Model m,@ModelAttribute("userBean") AccountBean aBean) throws IOException {
			System.out.println(username);
			InputStream is = new BufferedInputStream(img.getInputStream());
//		    v1
//			byte[] b =new byte[is.available()];
//	        is.read(b);
//	        is.close();
//			userDetail.setPicture(b);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] b = new byte[81920];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			String status = service.updateAccImg(baos.toByteArray(), username);
			aBean.setPicture(baos.toByteArray());
			aBean.setModify_Date(new Date());
			baos.close();
			m.addAttribute("userBean", aBean);
			return status;
		}
		
		//google login
		@RequestMapping(path = "/googleLogin")
		public @ResponseBody HashMap<String, String> googleLogin(@ModelAttribute(name="reqURL") String reqURL,
				                                @RequestParam String nickname,
				                                @RequestParam String imgUrl,
				                                @RequestParam String email,
				                                Model m){
		AccountBean aBean =	service.checkGoogleLogin(nickname,imgUrl,email);
		HashMap<String, String> map = new HashMap<String,String>();
		m.addAttribute("userBean", aBean);
		map.put("LoginInfo", "登入成功");
		map.put("reqURL", reqURL);
			return map;
		}
		

		
}
