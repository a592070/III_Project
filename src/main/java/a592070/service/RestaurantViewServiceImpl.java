package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.RestaurantFieldName;
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
    public int getSizeByRegion(String region) {
        return viewDAO.getSizeByFiled(RestaurantFieldName.RESTAURANT_REGION, region);
    }
    @Override
    public List<RestaurantVO> listByRegion(int currentPage, int pageSize, String region) {
        return listByRegion(currentPage, pageSize, region, RestaurantFieldName.RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled) {
        return listByRegion(currentPage, pageSize, region, orderFiled, false);
    }
    @Override
    public List<RestaurantVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByFiled(index, pageSize, RestaurantFieldName.RESTAURANT_REGION, region, orderFiled, descending);
    }


    @Override
    public List<RestaurantVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, RestaurantFieldName.RESTAURANT_ID);
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
    public int getSizeByKeyWords(String keywords) {
        return getSizeByKeyWords(keywords, "");
    }
    @Override
    public int getSizeByKeyWords(String keywords, String region) {
        if(StringUtil.isEmpty(keywords) || "".equals(keywords)) return getSize();
        return viewDAO.getSizeByKeywords(keywords, region);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, "", RestaurantFieldName.RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region) {
        return listByKeyWords(currentPage, pageSize, keywords, region, RestaurantFieldName.RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, region, orderFiled, false);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords) || "".equals(keywords)) return list(currentPage, pageSize, orderFiled, descending);
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByKeywords(index, pageSize, keywords, region, orderFiled, descending);
    }
}
