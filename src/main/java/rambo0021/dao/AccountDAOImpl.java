package rambo0021.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import global.pojo.OrderTable;
import rambo0021.pojo.AccountBean;
import rambo0021.pojo.AccountListViewBean;
import rambo0021.pojo.IdentityBean;
import rambo0021.pojo.Page;
import rambo0021.pojo.Sort;

public class AccountDAOImpl implements AccountDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public List<AccountListViewBean> userList(int start, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From AccountListViewBean order by userName";
		Query<AccountListViewBean> query = session.createQuery(hql, AccountListViewBean.class);
		// 找第幾筆
		query.setFirstResult(start);
		// 從第幾筆開始count筆
		query.setMaxResults(pageSize);

		List<AccountListViewBean> list = query.list();
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
			aBean.setModify_Date(new Date());
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
			aBean.setModify_Date(new Date());
			return "設定成功";
		}
		return "設定失敗";
	}

	@Override
	public String enableAccount(String username, String status) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			aBean.setStatus(status);
			return "啟用成功";
		}
		return "啟用失敗";
	}

	@Override
	public String disableAccount(String username, String status) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			aBean.setStatus(status);
			return "禁用成功";
		}
		return "禁用失敗";
	}

	@Override
	public String delAccount(AccountBean aBean) {
		Session session = sessionFactory.getCurrentSession();
		if (aBean.getOrderTable() != null) {
			aBean.setOrderTable(new ArrayList<>());
		}
		session.update(aBean);
		session.remove(aBean);
		return "刪除成功";
	}

	@Override
	public String delAccount(String username) {
		Session session = sessionFactory.getCurrentSession();
		AccountBean aBean = session.get(AccountBean.class, username);

		if (aBean != null) {
//			if (!aBean.getOrderTable().isEmpty()) 
//			{
//				for (OrderTable oBean : aBean.getOrderTable())
//					oBean.setAccountBean(null);
//				
//			}
			return "刪除成功";
		}
		return "刪除失敗";
	}

	@Override
	public String modifyAccount(String username, String password, int identity, String email, String nickName) {
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
		if (aBean != null) {
			System.out.println("修改資料");
			if (!aBean.getPassword().equals(password)) {
				System.out.println("密碼不同");
				aBean.setPassword(SHA2DAO.getSHA256(password));
			}
			IdentityBean iBean = sessionFactory.getCurrentSession().get(IdentityBean.class, identity);
			aBean.setIdentityBean(iBean);
			aBean.setEmail(email);
			aBean.setNickName(nickName);
			aBean.setModify_Date(new Date());
			return "修改成功";
		}
		return "修改失敗";
	}

	@Override
	public String registered(AccountBean aBean, IdentityBean iBean) {
		AccountBean result = sessionFactory.getCurrentSession().get(AccountBean.class, aBean.getUserName());
		IdentityBean identityBean = sessionFactory.getCurrentSession().get(IdentityBean.class, iBean.getId());
		if (result == null) {
			aBean.setIdentityBean(identityBean);
			sessionFactory.getCurrentSession().save(aBean);
			return "註冊成功";
		}
		return "註冊失敗";
	}

	@Override
	public String login(String username, String password) {
//		String hql = "from AccountBean where userName=:username and password=:password and identityBean.id=:idebtity";
//		sessionFactory.getCurrentSession().createQuery(hql);
		AccountBean aBean = sessionFactory.getCurrentSession().get(AccountBean.class, username);
	    if(aBean == null || !aBean.getPassword().equals(SHA2DAO.getSHA256(password)) || aBean.getIdentityBean().getId() != 1){
	    	return "帳號或密碼錯誤,或此帳號非管理員";
	    }else if(!"啟用".equals(aBean.getStatus())) {
	    	return "此帳號已被禁用";
	    }else {
	    	return "登入成功";
	    }
	
//		if (aBean != null && aBean.getPassword().equals(SHA2DAO.getSHA256(password))
//				&& aBean.getIdentityBean().getId() == 1) {
//			return true;
//		}
//		return false;
	}

	@Override
	public List<AccountListViewBean> search(String username, String identity, String email, int start, int pageSize,
			Sort aSort) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "From AccountListViewBean  WHERE userName like ?0 and iName like ?1 and email like ?2 order by ";
		
		if (!"default".equals(aSort.getiSort())) {
			hql += " iName " + aSort.getiSort()+",";
		}
		if (!"default".equals(aSort.geteSort())) {
			hql += " email " + aSort.geteSort()+",";
		}
		if (!"default".equals(aSort.getrSort())) {
			hql += " register " + aSort.getrSort()+",";
		}
		if (!"default".equals(aSort.getmSort())) {
			hql += " modify_Date " + aSort.getmSort()+",";
		}
		if (!"default".equals(aSort.getuSort())) {
			hql += " userName " + aSort.getuSort();
		}else {
			hql += "userName";
		}
		System.out.println("aorder by"+hql);

		Query<AccountListViewBean> query = session.createQuery(hql, AccountListViewBean.class);
		query.setParameter(0, "%" + username + "%");
		query.setParameter(1, "%" + identity + "%");
		query.setParameter(2, "%" + email + "%");
		return query.setFirstResult(start).setMaxResults(pageSize).list();
	}

	@Override
	public int getSize(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql, Long.class).uniqueResult().intValue();
	}

	@Override
	public List<IdentityBean> getidList() {
		String hql="From IdentityBean order by id";
		return sessionFactory.getCurrentSession().createQuery(hql, IdentityBean.class).list();
	}

}
