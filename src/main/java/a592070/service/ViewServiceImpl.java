package a592070.service;

import a592070.dao.ViewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class ViewServiceImpl implements ViewService{
    private ViewDAO viewDAO;
}
