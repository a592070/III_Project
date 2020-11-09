package a592070.service;

import a592070.dao.TravelSetDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = {Exception.class})
public class TravelSetServiceImpl implements TravelSetService{
    @Autowired
    private TravelSetDAO dao;
}
