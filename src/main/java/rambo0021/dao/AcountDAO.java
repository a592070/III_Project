package rambo0021.dao;

import java.util.Date;
import java.util.List;

import rambo0021.pojo.AccountBean;
import rambo0021.pojo.IdentityBean;

public interface AcountDAO {

	List<AccountBean> userList();
	AccountBean userDetail(String username);
	String updateAccImg(byte[] img,String username);
	String updateAccPwd(String username, String pwd);
	String updateAccIdentity(String username, int identity);
	String updateAccEmail(String username, String email);
	String udAccountNickname(String username, String nickname);
	String udAccountRegister(String username, Date register);
	String udAccountModify(String username, Date modify);
	String delAccountPic(String username);
	String enableAccount(String username,String status);
	String disableAccount(String usernamem,String status);
	String delAccount(String username);
	String modifyAccount(String username, String password, int identity, String email);
	String registered(AccountBean aBean, IdentityBean iBean);
	boolean login(String username, String password);
}