package rambo0021.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;

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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import rambo0021.pojo.AccountBean;
import rambo0021.serive.AccountService;

@Controller
@Lazy
@SessionAttributes(names = "userList")
public class AccountController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(path = "/accountPage")
	public String AccountPage(Model m) {
		List<AccountBean> userList = service.userList();
		m.addAttribute("userList", userList);
		System.out.println(servletContext);
		return "rambo0021/account_index";
	}

	@RequestMapping(path = "/displayAccount")
	public String DisplayAccount(@RequestParam("username") String username, Model m) throws IOException {
		AccountBean userDetail = service.userDetail(username);
		m.addAttribute("userDetail", userDetail);

//		// 圖片
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_PNG);
//		ResponseEntity<byte[]> picture;
//		if (userDetail.getPicture() != null) {
//			picture = new ResponseEntity<byte[]>(userDetail.getPicture(), headers, HttpStatus.OK);
//		} else {
//			InputStream is = servletContext.getResourceAsStream("/rambo0021/Images/NoImage.png");
//			byte[] b = is.readAllBytes();
//			is.close();
//			picture = new ResponseEntity<byte[]>(b, headers, HttpStatus.OK);
//		}
//		m.addAttribute("picture", picture);
		return "rambo0021/account_detail";
	}
//	@RequestMapping(path = "/ShowAccountPic")
//	public ResponseEntity<byte[]> ShowAccountPic(@ModelAttribute("userDetail") AccountBean userDetail) throws IOException{
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_PNG);
//		if (userDetail.getPicture() != null) {
//			return new ResponseEntity<byte[]>(userDetail.getPicture(), headers, HttpStatus.OK);
//		}
//		InputStream is = servletContext.getResourceAsStream("/rambo0021/Images/NoImage.png");
//		byte[] b = is.readAllBytes();
//		is.close();
//		return new ResponseEntity<byte[]>(b, headers, HttpStatus.OK);
//	}

}
