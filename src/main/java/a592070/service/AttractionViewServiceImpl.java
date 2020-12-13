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
import static a592070.fieldenum.AttractionFiledName.*;

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
    public AttractionVO getEleWithStatus(Integer id, boolean available) {
        return getEleWithStatus(id, available, false);
    }
    @Override
    public AttractionVO getEleWithStatus(Integer id, boolean available , boolean findFromPersistence) {
        return viewDAO.getEle(id, findFromPersistence, available);
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
    public int getSizeWithStatus(boolean available) {
        return viewDAO.getSize(available);
    }



    @Override
    public int getSizeByRegion(String region){
        if(StringUtil.isEmpty(region)) return getSize();

        return viewDAO.getSizeByFiled(ATTRACTION_REGION, region);
    }
    @Override
    public int getSizeByRegionWithStatus(String region, boolean available) {
        if(StringUtil.isEmpty(region)) return getSizeWithStatus(available);

        return viewDAO.getSizeByFiled(ATTRACTION_REGION, region, available);
    }



    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region){
        return listByRegion(currentPage, pageSize, region, ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled){
        return listByRegion(currentPage, pageSize, region, orderFiled, false);
    }
    @Override
    public List<AttractionVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending){
        if(StringUtil.isEmpty(region)) return list(currentPage, pageSize, orderFiled, descending);

        int index = (currentPage-1)*pageSize;
        return viewDAO.listByFiled(index, pageSize, ATTRACTION_REGION, region, orderFiled, descending);
    }



    @Override
    public List<AttractionVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available) {
        return listByRegionWithStatus(currentPage, pageSize, region, available, ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled) {
        return listByRegionWithStatus(currentPage, pageSize, region, available, orderFiled, false);
    }
    @Override
    public List<AttractionVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(region)) return listWithStatus(currentPage, pageSize, available, orderFiled, descending);

        int index = (currentPage-1)*pageSize;
        return viewDAO.listByFiled(index, pageSize, ATTRACTION_REGION, region, orderFiled, descending, available);
    }



    @Override
    public List<AttractionVO> list(int currentPage, int pageSize){
        return list(currentPage, pageSize, ATTRACTION_ID);
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
    public List<AttractionVO> listWithStatus(int currentPage, int pageSize, boolean available) {
        return listWithStatus(currentPage, pageSize, available, ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled) {
        return listWithStatus(currentPage, pageSize, available, orderFiled, false);
    }
    @Override
    public List<AttractionVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByRownum(index, pageSize, orderFiled, descending, available);
    }



    @Override
    public int getSizeByKeyWords(String keywords) {
        return getSizeByKeyWords(keywords, "");
    }
    @Override
    public int getSizeByKeyWords(String keywords, String region) {
        if(StringUtil.isEmpty(keywords)) return getSizeByRegion(region);
        return viewDAO.getSizeByKeywords(keywords, region);
    }



    @Override
    public int getSizeByKeyWordsWithStatus(String keywords, boolean available) {
        return getSizeByKeyWordsWithStatus(keywords, null, available);
    }
    @Override
    public int getSizeByKeyWordsWithStatus(String keywords, String region, boolean available) {
        if(StringUtil.isEmpty(keywords)) return getSizeByRegionWithStatus(region, available);
        return viewDAO.getSizeByKeywords(keywords, region, available);
    }



    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, "");
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region) {
        return listByKeyWords(currentPage, pageSize, keywords, region ,ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, region, orderFiled, false);
    }
    @Override
    public List<AttractionVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return listByRegion(currentPage, pageSize, region, orderFiled, descending);
        if(StringUtil.isEmpty(region) || "all".equals(region)) region="";
        int index = (currentPage-1)*pageSize;

        return viewDAO.listByKeywords(index, pageSize, keywords, region, orderFiled, descending);
    }



    @Override
    public List<AttractionVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, "");
    }
    @Override
    public List<AttractionVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String region) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, region, ATTRACTION_ID);
    }
    @Override
    public List<AttractionVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String region, String orderFiled) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, region, ATTRACTION_ID, false);
    }
    @Override
    public List<AttractionVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String region, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return listByRegionWithStatus(currentPage, pageSize, region, available, orderFiled, descending);
        if(StringUtil.isEmpty(region) || "all".equals(region)) region="";
        int index = (currentPage-1)*pageSize;

        return viewDAO.listByKeywords(index, pageSize, keywords, region, orderFiled, descending, available);
    }
}
