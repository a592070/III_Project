package rambo0021.serive;

import java.util.Date;
import java.util.List;

import rambo0021.pojo.AccountBean;

public interface AccountService {

	List<AccountBean> userList();
	AccountBean userDetail(String username);
	AccountBean updateAccImg(byte[] img,String username);
	String updateAccPwd(String username, String pwd);
	String updateAccIdentity(String username, int identity);
	String updateAccEmail(String username, String email);
	String udAccountNickname(String username, String nickname);
	String udAccountRegister(String username, Date register);
	String udAccountModify(String username, Date modify);
	String delAccountPic(String username);
	String enableAccount(String username,String status);
	String disableAccount(String username,String status);
	String delAccount(String username);
}
