package rambo0021.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import rambo0021.pojo.AccountBean;

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
	public AccountBean updateAccImg(byte[] img,String username) {
		Session session = sessionFactory.getCurrentSession();
        AccountBean aBean = session.get(AccountBean.class, username);
	    if (aBean !=null) {
	    	aBean.setPicture(img);
	    	return aBean;
	    }
	    return aBean;
	}
}
