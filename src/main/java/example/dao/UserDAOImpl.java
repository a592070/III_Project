package example.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import example.pojo.User;

import java.util.List;

public class UserDAOImpl implements UserDAO{
    @Autowired
    private SessionFactory sessionFactory;
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public List<User> select(){
        return sessionFactory.getCurrentSession().createQuery("from User ", User.class).list();
    }
    @Override
    public List<User> selectSort(String orderFiled){

        Query<User> query = sessionFactory.getCurrentSession().createQuery("from User order by "+orderFiled, User.class);
//        query.setParameter(1, orderFiled);
        return query.list();
    }
    @Override
    public List<User> select(String username){
        username = "%"+username+"%";
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where name like :keyword or password like :keyword ", User.class);
        query.setParameter("keyword", username);
        return query.list();
    }
    @Override
    public void insert(User user){
        sessionFactory.getCurrentSession().save(user);
    }
    @Override
    public void update(User user){
        sessionFactory.getCurrentSession().update(user);
    }
    @Override
    public void delete(User user){
        sessionFactory.getCurrentSession().delete(user);
    }
}
