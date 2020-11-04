package rambo0021.dao;

import java.util.List;

import rambo0021.pojo.AccountBean;

public interface AcountDAO {

	List<AccountBean> userList();
	AccountBean userDetail(String username);

}