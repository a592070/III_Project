package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.RestaurantFieldName;
import static a592070.fieldenum.RestaurantFieldName.*;
import a592070.pojo.RestaurantVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import utils.StringUtil;

import java.util.List;
@Transactional(rollbackFor = {Exception.class})
public class RestaurantViewServiceImpl implements ViewService<RestaurantVO> {
    @Autowired@Qualifier("restaurantViewDao")
    private ViewDAO<RestaurantVO> viewDAO;

    @Override
    public RestaurantVO getEle(Integer id) {
        return getEle(id, false);
    }

    @Override
    public RestaurantVO getEle(Integer id, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return viewDAO.getEle(id, findFromPersistence);
    }

    @Override
    public RestaurantVO getEleWithStatus(Integer id, boolean available) {
        return getEleWithStatus(id, available, false);
    }

    @Override
    public RestaurantVO getEleWithStatus(Integer id, boolean available, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return viewDAO.getEle(id, findFromPersistence, available);
    }

    @Override
    public List<byte[]> getPictures(Integer id) {
        return null;
    }

    @Override
    public byte[] getPicture(Integer id) {
        return viewDAO.getPicture(id);
    }

    @Override
    public int getSize() {
        return viewDAO.getSize();
    }

    @Override
    public int getSizeWithStatus(boolean available) {
        return viewDAO.getSize(available);
    }


    @Override
    public int getSizeByRegion(String region) {
        return viewDAO.getSizeByFiled(RESTAURANT_REGION, region);
    }

    @Override
    public int getSizeByRegionWithStatus(String region, boolean available) {
        return viewDAO.getSizeByFiled(RESTAURANT_REGION, region, available);
    }

    @Override
    public List<RestaurantVO> listByRegion(int currentPage, int pageSize, String region) {
        return listByRegion(currentPage, pageSize, region, RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled) {
        return listByRegion(currentPage, pageSize, region, orderFiled, false);
    }
    @Override
    public List<RestaurantVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByFiled(index, pageSize, RESTAURANT_REGION, region, orderFiled, descending);
    }

    @Override
    public List<RestaurantVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available) {
        return listByRegionWithStatus(currentPage, pageSize, region, available, RESTAURANT_ID);
    }

    @Override
    public List<RestaurantVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled) {
        return listByRegionWithStatus(currentPage, pageSize, region, available, orderFiled, false);
    }

    @Override
    public List<RestaurantVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByFiled(index, pageSize, RESTAURANT_REGION, region, orderFiled, descending, available);
    }


    @Override
    public List<RestaurantVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> list(int currentPage, int pageSize, String orderFiled) {
        return list(currentPage, pageSize, orderFiled, false);
    }
    @Override
    public List<RestaurantVO> list(int currentPage, int pageSize, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByRownum(index, pageSize, orderFiled, descending);
    }

    @Override
    public List<RestaurantVO> listWithStatus(int currentPage, int pageSize, boolean available) {
        return listWithStatus(currentPage, pageSize, available, RESTAURANT_ID);
    }

    @Override
    public List<RestaurantVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled) {
        return listWithStatus(currentPage, pageSize, available, RESTAURANT_ID, false);
    }

    @Override
    public List<RestaurantVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled, boolean descending) {
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
        return getSizeByKeyWordsWithStatus(keywords, "", available);
    }

    @Override
    public int getSizeByKeyWordsWithStatus(String keywords, String region, boolean available) {
        if(StringUtil.isEmpty(keywords)) return getSizeByRegionWithStatus(region, available);
        return viewDAO.getSizeByKeywords(keywords, region, available);
    }

    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, "", RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region) {
        return listByKeyWords(currentPage, pageSize, keywords, region, RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, region, orderFiled, false);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return listByRegion(currentPage, pageSize, region, orderFiled, descending);
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByKeywords(index, pageSize, keywords, region, orderFiled, descending);
    }

    @Override
    public List<RestaurantVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, "");
    }

    @Override
    public List<RestaurantVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String region) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, "", RESTAURANT_ID);
    }

    @Override
    public List<RestaurantVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String region, String orderFiled) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, "", RESTAURANT_ID, false);
    }

    @Override
    public List<RestaurantVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String region, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return listByRegionWithStatus(currentPage, pageSize, region, available, orderFiled, descending);
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByKeywords(index, pageSize, keywords, region, orderFiled, descending, available);
    }
}
