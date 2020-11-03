package example.dao;

import example.pojo.User;

import java.util.List;

public interface UserDAO {
    List<User> select();

    List<User> selectSort(String orderFiled);

    List<User> select(String username);

    void insert(User user);
    void update(User user);
    void delete(User user);
}
