package a592070.dao;

public interface ModifyDAO<T> {
    T insert(T t);
    T update(T t);
    void delete(T t);
//    void removePic(T t, int picId);
//    void addPic(T t, byte[] pic);
}
