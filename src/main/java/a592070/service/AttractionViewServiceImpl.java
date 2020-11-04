package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import utils.StringUtil;

import java.util.List;

public class AttractionViewServiceImpl implements ViewService<AttractionVO> {
    @Autowired@Qualifier("attractionViewDao")
    private ViewDAO<AttractionVO> viewDAO;

    @Override
    public AttractionVO getEle(int id){
        return viewDAO.getEle(id);
    }

    @Override
    public byte[] getPicture(int id) {
        return viewDAO.getPicture(id);
    }

    @Override
    public int getSize(){
        return viewDAO.getSize();
    }

    @Override
    public int getSizeByRegion(String region){
        return viewDAO.getSizeByFiled(AttractionFiledName.ATTRACTION_REGION, region);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region){
        return listByRegion(currentPage, pageSize, region, AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled){
        if(StringUtil.isEmpty(region)) region = "";
        return viewDAO.listByFiled(currentPage, pageSize, AttractionFiledName.ATTRACTION_REGION, region, orderFiled);
    }

    @Override
    public List<AttractionVO> list(int currentPage, int pageSize){
        return list(currentPage, pageSize, AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> list(int currentPage, int pageSize, String orderFiled) {
        return viewDAO.listByRownum(currentPage, pageSize, orderFiled);
    }

    @Override
    public int getSizeByKeyWords(String keywords) {
        return viewDAO.getSizeByKeywords(keywords);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled) {
        if(StringUtil.isEmpty(keywords)) keywords = "";
        return viewDAO.listByKeywords(currentPage, pageSize, keywords, orderFiled);
    }
}
