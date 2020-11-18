package rambo0021.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import rambo0021.dao.SHA2DAO;
import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;
import rambo0021.serive.DateService;

@Controller
@Lazy
@SessionAttributes(names = { "userDetail" })
@RequestMapping("/admin")
public class AccountController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;

	@Autowired
	@Qualifier("dateService")
	private DateService dService;

	@RequestMapping(path = "/accountPage")
	public String AccountPage(Model m) {
		List<AccountBean> userList = service.userList();
		m.addAttribute("userList", userList);
		return "/rambo0021/account_index";
//		return "redirect:/rambo0021/account_index";
	}

	@RequestMapping(path = "/displayAccount")
	public String DisplayAccount(@RequestParam("username") String username, Model m) throws IOException {
		AccountBean userDetail = service.userDetail(username);
		m.addAttribute("userDetail", userDetail);

		return "rambo0021/account_detail";
	}

	@RequestMapping(path = "/ShowAccountPic")
	public @ResponseBody ResponseEntity<byte[]> ShowAccountPic(@ModelAttribute("userDetail") AccountBean userDetail)
			throws IOException {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(userDetail.getPicture(), headers, HttpStatus.OK);
	}

	@RequestMapping(path = "/udAccountImg")
	public @ResponseBody String udAccountImg(@RequestParam String username, @RequestParam("Apicture") MultipartFile img,
			Model m) throws IOException {
		System.out.println(username);
		InputStream is = new BufferedInputStream(img.getInputStream());
//	    v1
//		byte[] b =new byte[is.available()];
//        is.read(b);
//        is.close();
//		userDetail.setPicture(b);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] b = new byte[81920];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		String status = service.updateAccImg(baos.toByteArray(), username);
		baos.close();
		return status;
	}
//------------------------------------------------------------------------------------------------------------------
	@PostMapping("/udAccountPwd")
	public @ResponseBody String udAccountPwd(@RequestParam("username") String username,
			@RequestParam("password") String pwd) {
		return service.updateAccPwd(username, SHA2DAO.getSHA256(pwd));
	}

	@PostMapping("/udAccountIdentity")
	public @ResponseBody String udAccountIdentity(@RequestParam("username") String username,
			@RequestParam("identity") int identity) {
		System.out.println("Controller=" + identity);
		return service.updateAccIdentity(username, identity);
	}

	@PostMapping("/udAccountEmail")
	public @ResponseBody String udAccountEmail(@RequestParam("username") String username,
			@RequestParam("email") String email) {
		return service.updateAccEmail(username, email);
	}

	@PostMapping("/udAccountNickname")
	public @ResponseBody String udAccountNickname(@RequestParam("username") String username,
			@RequestParam("nickname") String nickname) {
		return service.udAccountNickname(username, nickname);
	}

	@PostMapping("/udAccountRegister")
	public @ResponseBody String udAccountRegister(@RequestParam("username") String username,
			@RequestParam("register") String register) {
		return service.udAccountRegister(username, dService.StringtoDate(register));

	}

	@PostMapping("/udAccountModify")
	public @ResponseBody String udAccountModify(@RequestParam("username") String username,
			@RequestParam("modify") String modify) {
		return service.udAccountModify(username, dService.StringtoDate(modify));

	}
	// ---------------------------------------------------------------------------------------------------------------
	@PostMapping("/delAccountPic")
	public @ResponseBody String delAccountPic(@RequestParam("username") String username) {
		return service.delAccountPic(username);
	}

	@PostMapping("/enableAccount")
	public @ResponseBody String enableAccount(@RequestParam("username") String username, @RequestParam String status) {
		return service.enableAccount(username, status);
	}

	@PostMapping("/disableAccount")
	public @ResponseBody String disableAccount(@RequestParam("username") String username, @RequestParam String status) {
		return service.disableAccount(username, status);
	}

	@PostMapping("/delAccount")
	public @ResponseBody String delAccount(@RequestParam("username") String username) {
		return service.delAccount(username);
	}
	@PostMapping("/modifyAccount")
	public @ResponseBody String modifyAccount(@RequestParam String username,@RequestParam String password,@RequestParam int identity,@RequestParam String email, Model m) {
	
		
		return service.modifyAccount(username,password,identity,email);
	}
}
