package rambo0021.controller;

import java.io.IOException;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import rambo0021.dao.SHA2DAO;
import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;

@Controller
@Lazy
@SessionAttributes(names = {"userList", "userDetail" } )
public class AccountController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;
//	@Autowired
//	private ServletContext servletContext;
	@RequestMapping(path = "/accountPage")
	public String AccountPage(Model m) {
		List<AccountBean> userList = service.userList();
		m.addAttribute("userList", userList);
				
		return "rambo0021/account_index";
	}

	@RequestMapping(path = "/displayAccount")
	public String DisplayAccount(@RequestParam("username") String username, Model m) throws IOException {
		AccountBean userDetail = service.userDetail(username);
		m.addAttribute("userDetail", userDetail);
        
		return "rambo0021/account_detail";
	}
	@RequestMapping(path = "/ShowAccountPic")
	public @ResponseBody ResponseEntity<byte[]> ShowAccountPic(@ModelAttribute("userDetail") AccountBean userDetail) throws IOException{
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
//		if (userDetail.getPicture() != null) { 改到jsp判斷
			return new ResponseEntity<byte[]>(userDetail.getPicture(), headers, HttpStatus.OK);
//		}
//		InputStream is = servletContext.getResourceAsStream("/assets/img/rambo0021/NoImage.png");
//		byte[] b = is.readAllBytes();
//		is.close();
//		return new ResponseEntity<byte[]>(b, headers, HttpStatus.OK);
	}
	@RequestMapping(path = "/udAccountImg")
	public String udAccountImg(@ModelAttribute("userDetail") AccountBean userDetail, @RequestParam("Apicture") MultipartFile img,Model m) throws IOException {
		userDetail.setPicture(img.getInputStream().readAllBytes());
		service.updateAccImg(userDetail.getPicture(), userDetail.getUserName());	
		m.addAttribute("userDetail", userDetail);
		return "rambo0021/account_detail";
	}
	@PostMapping("/udAccountPwd")
    public @ResponseBody String udAccountPwd(@RequestParam("username") String username,@RequestParam("password") String pwd) {
		return service.updateAccPwd(username, SHA2DAO.getSHA256(pwd));
	}
	@PostMapping("/udAccountIdentity")
    public @ResponseBody String udAccountIdentity(@RequestParam("username") String username,@RequestParam("identity") int identity) {
		System.out.println("Controller="+identity);
		return service.updateAccIdentity(username, identity);
	}
	@PostMapping("/udAccountEmail")
    public @ResponseBody String udAccountEmail(@RequestParam("username") String username,@RequestParam("email") String email) {
		return service.updateAccEmail(username, email);
	}
	@PostMapping("/udAccountNickname")
    public @ResponseBody String udAccountNickname(@RequestParam("username") String username,@RequestParam("email") String email) {
		return service.udAccountNickname(username, email);
	}
}
