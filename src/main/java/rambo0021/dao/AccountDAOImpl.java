package rambo0021.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import rambo0021.pojo.AccountBean;
import rambo0021.pojo.IdentityBean;

public class AccountDAOImpl implements AcountDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	

	@Override
	public List<AccountBean> userList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From AccountBean order by Modify_Date DESC";
		Query<AccountBean> query = session.createQuery(hql, AccountBean.class);
		List<AccountBean> list = query.list();
		return list;
	}

	@Override
	public AccountBean userDetail(String username) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(AccountBean.class, username);
	}

	@Override
	public String updateAccImg(byte[] img, String username) {
		Session session = sessionFactory.getCurrentSession();
		AccountBean aBean = session.get(AccountBean.class, username);
		if (aBean != null) {
			aBean.setPicture(img);
			return "修改成功";
		}
		return "修改失敗";
	}

	@Override
	public String updateAccPwd(String username, String pwd) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			aBean.setPassword(pwd);
			return "修改密碼成功";
		}
		return "修改失敗";
	}

	@Override
	public String updateAccIdentity(String username, int identity) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			IdentityBean iBean = sessionFactory.getCurrentSession().get(IdentityBean.class, identity);
			aBean.setIdentityBean(iBean);
			return "修改身分成功";
		}
		return "修改失敗";
	}

	@Override
	public String updateAccEmail(String username, String email) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			aBean.setEmail(email);
			return "新增成功";
		}
		return "新增失敗";
	}
	@Override
	public String udAccountNickname(String username, String nickname) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			aBean.setNickName(nickname);
			return "新增成功";
		}
		return "新增失敗";
	}
	@Override
	public String udAccountRegister(String username, Date register) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
   
		if (aBean != null) {
			aBean.setRegister(register);
			return "新增成功";
		}
		return "新增失敗";
	}

	@Override
	public String udAccountModify(String username, Date modify) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		   
		if (aBean != null) {
			aBean.setModify_Date(modify);
			return "新增成功";
		}
		return "新增失敗";
	}

	@Override
	public String delAccountPic(String username) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
		    aBean.setPicture(null);
			return "設定成功";
		    }
		return "設定失敗";
	}

	@Override
	public String enableAccount(String username,String status) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
		    aBean.setStatus(status);
			return "啟用成功";
		    }
		return "啟用失敗";
	}

	@Override
	public String disableAccount(String username,String status) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
		    aBean.setStatus(status);
			return "禁用成功";
		    }
		return "禁用失敗";
	}

	@Override
	public String delAccount(String username) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			sessionFactory.getCurrentSession().delete(aBean);
			return "刪除成功";
		    }
		return "刪除失敗";
	}

}
