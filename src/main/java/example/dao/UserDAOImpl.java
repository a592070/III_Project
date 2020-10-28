package example.dao;

import org.hibernate.SessionFactory;
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
