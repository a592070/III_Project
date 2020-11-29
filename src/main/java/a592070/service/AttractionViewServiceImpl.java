package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;
import a592070.pojo.AttractionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import utils.StringUtil;

import java.util.List;

@Transactional(rollbackFor = {Exception.class})
public class AttractionViewServiceImpl implements ViewService<AttractionVO> {
    @Autowired@Qualifier("attractionViewDao")
    private ViewDAO<AttractionVO> viewDAO;

    @Override
    public AttractionVO getEle(Integer id){
        return getEle(id, false);
    }

    @Override
    public AttractionVO getEle(Integer id, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return viewDAO.getEle(id, findFromPersistence);
    }

    @Override
    public byte[] getPicture(Integer id) {
        return viewDAO.getPicture(id);
    }


    @Override
    public List getPictures(Integer id) {
        return viewDAO.getPictures(id);
    }

    @Override
    public int getSize(){
        return viewDAO.getSize();
    }

    @Override
    public int getSizeByRegion(String region){
        if(StringUtil.isEmpty(region)) return getSize();

        return viewDAO.getSizeByFiled(AttractionFiledName.ATTRACTION_REGION, region);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region){
        return listByRegion(currentPage, pageSize, region, AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled){
        return listByRegion(currentPage, pageSize, region, orderFiled, false);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending){
        if(StringUtil.isEmpty(region)) return list(currentPage, pageSize, orderFiled, descending);

        int index = (currentPage-1)*pageSize;
        return viewDAO.listByFiled(index, pageSize, AttractionFiledName.ATTRACTION_REGION, region, orderFiled, descending);
    }

    @Override
    public List<AttractionVO> list(int currentPage, int pageSize){
        return list(currentPage, pageSize, AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> list(int currentPage, int pageSize, String orderFiled) {
        return list(currentPage, pageSize, orderFiled, false);
    }
    @Override
    public List<AttractionVO> list(int currentPage, int pageSize, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;

        return viewDAO.listByRownum(index, pageSize, orderFiled, descending);
    }


    @Override
    public int getSizeByKeyWords(String keywords) {
        return getSizeByKeyWords(keywords, "");
    }
    @Override
    public int getSizeByKeyWords(String keywords, String region) {
        if(StringUtil.isEmpty(keywords)) {
            return getSize();
        }
        return viewDAO.getSizeByKeywords(keywords, region);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, "", AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region) {
        return listByKeyWords(currentPage, pageSize, keywords, region ,AttractionFiledName.ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, region, orderFiled, false);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) keywords = "";
        if(StringUtil.isEmpty(region)) region = "";
        int index = (currentPage-1)*pageSize;
//        System.out.println(index);
//        System.out.println(pageSize);

        return viewDAO.listByKeywords(index, pageSize, keywords, region, orderFiled, descending);
    }
}
