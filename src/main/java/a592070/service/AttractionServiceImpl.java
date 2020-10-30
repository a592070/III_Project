package a592070.service;

import a592070.dao.AttractionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class AttractionServiceImpl implements AttractionService{
    @Autowired
    private AttractionDAO dao;

}
