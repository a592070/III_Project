package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.RestaurantFieldName;
import a592070.pojo.RestaurantVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

public class RestaurantViewServiceImpl implements ViewService<RestaurantVO> {
    @Autowired@Qualifier("restaurantViewDao")
    private ViewDAO<RestaurantVO> viewDAO;

    @Override
    public RestaurantVO getEle(int id) {
        return viewDAO.getEle(id);
    }

    @Override
    public byte[] getPicture(int id) {
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
        return viewDAO.listByFiled(currentPage, pageSize, RestaurantFieldName.RESTAURANT_REGION, region, orderFiled);
    }


    @Override
    public List<RestaurantVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, RestaurantFieldName.RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> list(int currentPage, int pageSize, String orderFiled) {
        return viewDAO.listByRownum(currentPage, pageSize, orderFiled);
    }


    @Override
    public int getSizeByKeyWords(String keywords) {
        return viewDAO.getSizeByKeywords(keywords);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, RestaurantFieldName.RESTAURANT_ID);
    }
    @Override
    public List<RestaurantVO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled) {
        return viewDAO.listByKeywords(currentPage, pageSize, keywords, orderFiled);
    }
}
