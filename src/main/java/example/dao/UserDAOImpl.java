package example.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
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
    public List<User> select(String keyword){
        keyword = "%"+keyword+"%";
        Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where str(id) like :keyword or name like :keyword or password like :keyword ", User.class);
        query.setParameter("keyword", (Object) keyword);


        return query.list();
    }
    @Override
    public String getUserPassword(int id){
        Session session = sessionFactory.getCurrentSession();
        NativeQuery query = session.createNativeQuery("select password from MYBATISUSER where id = ?1");
//        Query<String> query = session.createQuery("select password from MYBATISUSER where id = ?1", String.class);
        query.setParameter(1, id);
        return query.uniqueResult().toString();
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
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }
    @Override
    public void delete2(User user){
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
    }
    @Override
    public User selectById(int id) {
        return sessionFactory.getCurrentSession().get(User.class, id);
    }
}
