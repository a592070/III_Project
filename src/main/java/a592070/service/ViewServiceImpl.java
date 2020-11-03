package a592070.service;

import a592070.dao.ViewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class ViewServiceImpl<T> implements ViewService<T>{
    private ViewDAO<T> viewDAO;
    public void setViewDAO(ViewDAO<T> viewDAO) {
        this.viewDAO = viewDAO;
    }

    public int getSize(){
        return viewDAO.getSize();




    }
    public T getEle(int id){
        return viewDAO.getEle(id);
    }


}
