package example.dao;

import example.pojo.User;

import java.util.List;

public interface UserDAO {
    List<User> select();
    void insert(User user);
    void update(User user);
    void delete(User user);
}
