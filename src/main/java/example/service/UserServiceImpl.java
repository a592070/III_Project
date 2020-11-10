package example.service;

import example.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import example.pojo.User;

import java.util.List;

public class UserServiceImpl implements UserService{
    @Autowired
    private UserDAO dao;

    public UserServiceImpl(UserDAO dao) {
        this.dao = dao;
    }

    @Override
    @Transactional(rollbackFor = {Throwable.class})
    public void doSomething() {
//        dao.insert(new User(9, "test transA", "trans"));
//        dao.insert(new User(7, "test trans", "trans"));
        List<User> list = dao.select("NAME");
        System.out.println(list);
    }
    @Override
    @Transactional(rollbackFor = {Throwable.class})
    public void doSomething(String orderFiled) {
//        dao.insert(new User(9, "test transA", "trans"));
//        dao.insert(new User(7, "test trans", "trans"));
        List<User> list = dao.selectSort(orderFiled);
        System.out.println(list);
    }
    @Override
    @Transactional(rollbackFor = {Throwable.class})
    public void doSomething2(int id) {
        String userPassword = dao.getUserPassword(id);
        System.out.println(userPassword);
//        User user = new User();
//        user.setId(id);
//        dao.delete2(user);
    }
}
