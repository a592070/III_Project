package a592070.service;

import a592070.dao.AttractionDAO;
import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import utils.StringUtil;

import java.util.List;

@Transactional
public class AttractionServiceImpl implements AttractionService{
    @Autowired@Qualifier("attractionDao")
    private AttractionDAO dao;

    @Override
    public AttractionDO getEle(int id){
        return dao.getEle(id);
    }
    @Override
    public int getSize(){
        return dao.getSize();
    }

    @Override
    public int getSizeByRegion(String region){
        return dao.getSizeByFiled(AttractionFiledName.ATTRACTION_REGION, region);
    }
    @Override
    public List<AttractionDO> listByRegion(int currentPage, int pageSize, String region){
        return listByRegion(currentPage, pageSize, region, AttractionFiledName.ATTRACTION_DEFAULT_ORDER);
    }
    @Override
    public List<AttractionDO> listByRegion(int currentPage, int pageSize, String region, String orderFiled){
        if(StringUtil.isEmpty(region)) region = "";
        return dao.listByFiled(currentPage, pageSize, AttractionFiledName.ATTRACTION_REGION, region, orderFiled);
    }

    @Override
    public List<AttractionDO> list(int currentPage, int pageSize){
        return list(currentPage, pageSize, AttractionFiledName.ATTRACTION_DEFAULT_ORDER);
    }
    @Override
    public List<AttractionDO> list(int currentPage, int pageSize, String orderFiled){
        return dao.listByRownum(currentPage, pageSize, orderFiled);
    }

    @Override
    public int getSizeByKeyWords(String keywords){
        return dao.getSizeByKeywords(keywords);
    }
    @Override
    public List<AttractionDO> listByKeyWords(int currentPage, int pageSize, String keywords){
        return listByKeyWords(currentPage, pageSize, keywords, AttractionFiledName.ATTRACTION_DEFAULT_ORDER);
    }
    @Override
    public List<AttractionDO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled){
        if(StringUtil.isEmpty(keywords)) keywords = "";
        return dao.listByKeywords(currentPage, pageSize, keywords, orderFiled);
    }





}
