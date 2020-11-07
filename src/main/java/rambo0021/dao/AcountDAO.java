package rambo0021.dao;

import java.util.List;

import rambo0021.pojo.AccountBean;

public interface AcountDAO {

	List<AccountBean> userList();
	AccountBean userDetail(String username);
	AccountBean updateAccImg(byte[] img,String username);
	String updateAccPwd(String username, String pwd);
	String updateAccIdentity(String username, int identity);
	String updateAccEmail(String username, String email);
}