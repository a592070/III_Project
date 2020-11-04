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

		Query<AccountBean> query = session.createQuery("From AccountBean order by Modify_Date DESC", AccountBean.class);
		List<AccountBean> list = query.list();
		return list;
	}
}
