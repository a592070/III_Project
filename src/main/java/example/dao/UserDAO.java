package example.dao;

import example.pojo.User;

import java.util.List;

public interface UserDAO {
    List<User> select();

    List<User> selectSort(String orderFiled);

    List<User> select(String keyword);

    String getUserPassword(int id);

    void insert(User user);
    void update(User user);
    void delete(User user);

    void delete2(User user);

    User selectById(int id);
}
