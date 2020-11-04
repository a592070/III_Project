package rambo0021.serive;

import java.util.List;

import rambo0021.pojo.AccountBean;

public interface AccountService {

	List<AccountBean> userList();
	AccountBean userDetail(String username);
}
