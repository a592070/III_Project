package rambo0021.serive;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import rambo0021.dao.AcountDAO;
import rambo0021.pojo.AccountBean;

@Transactional
public class AccountServiceImpl implements AccountService {
	@Autowired
	@Qualifier("accountDao")
	private AcountDAO dao;

	@Override
	public List<AccountBean> userList() {
		return dao.userList();
	}

	@Override
	public AccountBean userDetail(String username) {
		return dao.userDetail(username);
	}

	@Override
   public AccountBean updateAccImg(byte[] img,String username) {
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
}
