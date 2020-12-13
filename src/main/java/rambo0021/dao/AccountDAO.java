package rambo0021.dao;

import java.util.Date;
import java.util.List;

import rambo0021.pojo.AccountBean;
import rambo0021.pojo.AccountListViewBean;
import rambo0021.pojo.IdentityBean;
import rambo0021.pojo.Page;
import rambo0021.pojo.Sort;

public interface AccountDAO {

	List<AccountListViewBean> userList(int start, int pageSize);
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
	String modifyAccount(String username, String password, int identity, String email,String nickName);
	String registered(AccountBean aBean, IdentityBean iBean);
	String login(String username, String password);
	List<AccountListViewBean> search(String username, String identity, String email, int start, int pageSize,Sort aSort);
	int getSize(String hql);
	String delAccount(AccountBean aBean);
	List<IdentityBean> getidList();
	String updateUser(String username, String password, String email, String nickName);
	String forgetPwd(String username, String email);
}