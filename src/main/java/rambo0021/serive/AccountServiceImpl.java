package rambo0021.serive;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import rambo0021.dao.AccountDAO;
import rambo0021.pojo.AccountBean;
import rambo0021.pojo.AccountChartView;
import rambo0021.pojo.AccountListViewBean;
import rambo0021.pojo.IdentityBean;
import rambo0021.pojo.Page;
import rambo0021.pojo.RegisterMonthView;
import rambo0021.pojo.Sort;

@Transactional
public class AccountServiceImpl implements AccountService {
	@Autowired
	@Qualifier("accountDao")
	private AccountDAO dao;

	@Override
	public List<AccountListViewBean> userList(int start, int pageSize) {
		return dao.userList(start,pageSize);
	}

	@Override
	public AccountBean userDetail(String username) {
		return dao.userDetail(username);
	}

	@Override
   public String updateAccImg(byte[] img,String username) {
		return dao.updateAccImg(img, username);
	}
	@Override
	public String updateAccPwd(String username, String pwd) {
		return dao.updateAccPwd(username, pwd);
	}
	@Override
	public String updateAccIdentity(String username, int identity) {
		return dao.updateAccIdentity(username, identity);
	}
	@Override
	public String updateAccEmail(String username, String email) {
		return dao.updateAccEmail(username, email);
	}

	@Override
	public String udAccountNickname(String username, String nickname) {
		return dao.udAccountNickname(username, nickname);
	}

	@Override
	public String udAccountRegister(String username, Date register) {
		return dao.udAccountRegister(username, register);
	}

	@Override
	public String udAccountModify(String username, Date modify) {
		return dao.udAccountModify(username, modify);
	}

	@Override
	public String delAccountPic(String username) {
		return dao.delAccountPic(username);
	}

	@Override
	public String enableAccount(String username,String status) {
		return dao.enableAccount(username,status);
	}

	@Override
	public String disableAccount(String username,String status) {
		return dao.disableAccount(username,status);
	}

	@Override
	public String delAccount(String username) {
		return dao.delAccount(username);
	}
	@Override
	public String delAccount(AccountBean aBean) {
		return dao.delAccount(aBean);
	}


	@Override
	public String modifyAccount(String username, String password, int identity, String email,String nickName) {
		return dao.modifyAccount(username,password,identity,email,nickName);
	}

	@Override
	public String registered(AccountBean aBean, IdentityBean iBean) {
		return dao.registered(aBean,iBean);
	}

	@Override
	public String login(String username, String password) {
		return dao.login(username,password);
	}

	@Override
	public List<AccountListViewBean> search(String username, String identity, String email, int start, int pageSize,Sort aSort) {
		return dao.search(username,identity,email,start,pageSize,aSort);
	}

	@Override
	public int getSize(String hql) {
		return dao.getSize(hql);
	}

	@Override
	public List<IdentityBean> getidList() {
		return dao.getidList();
	}

	@Override
	public String updateUser(String username, String password, String email, String nickName) {
           return dao.updateUser(username,password,email,nickName);	
	}

	@Override
	public String forgetPwd(String username, String email) {
		return dao.forgetPwd(username,email);
	}

	@Override
	public AccountBean checkGoogleLogin(String nickname, String imgUrl, String email) {
		return dao.checkGoogleLogin(nickname,imgUrl,email);
	}

	@Override
	public List<AccountChartView> getAccChart() {
		return dao.getAccChart();
	}

	@Override
	public List<RegisterMonthView> getMonChart() {
		return dao.getMonChart();
	}


}
