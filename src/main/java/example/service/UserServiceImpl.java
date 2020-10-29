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
        dao.insert(new User(7, "test trans6", "trans"));
        dao.insert(new User(6, "test trans", "trans"));
        List<User> list = dao.select();
        System.out.println(list);
    }
}
