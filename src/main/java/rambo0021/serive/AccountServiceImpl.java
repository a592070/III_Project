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

}
