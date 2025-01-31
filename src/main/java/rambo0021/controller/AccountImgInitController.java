package rambo0021.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asx54630.model.Hotel;
import rambo0021.pojo.AccountBean;
import rambo0021.pojo.AccountListViewBean;
import rambo0021.serive.AccountService;
import utils.PictureSupport;

@Controller
@Lazy
public class AccountImgInitController {
	@Autowired
	@Qualifier("accountService")
	private AccountService service;
	@Autowired
	private ServletContext servletContext;
	

	@GetMapping("/initImg")
	public @ResponseBody String initImg() {
		InputStream imgis = null;
		int size=service.getSize("select count(userName) From AccountListViewBean");
		List<AccountListViewBean> userList = service.userList(0, size);
		for (AccountListViewBean accountBean : userList) {
			int filename = (int) (Math.random() * 3)+1;
			String realPath = servletContext.getRealPath("/assets/img/initAccImg/" + String.valueOf(filename) + ".jpg");
			System.out.println(realPath);
			imgis = servletContext.getResourceAsStream("/assets/img/initAccImg/" + String.valueOf(filename) + ".jpg");
			try {
				service.updateAccImg(imgis.readAllBytes(), accountBean.getUserName());
			} catch (Exception e) {
				e.printStackTrace();
				return "初始失敗";
			}
		}
		try {
			imgis.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "初始失敗";
		}
		return "初始成功";
	}
	@GetMapping("/initHotelImg")
	public @ResponseBody String initHotelImg()  {
		
		service.initHotelImg();
		
		
		return "123";
	}
	
}
