package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.HotelFieldName;
import a592070.pojo.HotelVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional(rollbackFor = {Exception.class})
public class HotelViewServiceImpl implements ViewService<HotelVO>{
    @Autowired@Qualifier("hotelViewDao")
    private ViewDAO<HotelVO> viewDAO;

    @Override
    public HotelVO getEle(int id) {
        return viewDAO.getEle(id);
    }

    @Override
    public byte[] getPicture(int id) {
        return null;
    }

    @Override
    public int getSize() {
        return viewDAO.getSize();
    }


    @Override
    public int getSizeByRegion(String region) {
        return viewDAO.getSizeByFiled(HotelFieldName.HOTEL_REGION, region);
    }
    @Override
    public List<HotelVO> listByRegion(int currentPage, int pageSize, String region) {
        return listByRegion(currentPage, pageSize, region, HotelFieldName.HOTEL_ID);
    }
    @Override
    public List<HotelVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled) {
        return viewDAO.listByFiled(currentPage, pageSize, HotelFieldName.HOTEL_ID, region, orderFiled);
    }


    @Override
    public List<HotelVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, HotelFieldName.HOTEL_ID);
    }
    @Override
    public List<HotelVO> list(int currentPage, int pageSize, String orderFiled) {
        return viewDAO.listByRownum(currentPage, pageSize, orderFiled);
    }


    @Override
    public int getSizeByKeyWords(String keywords) {
        return viewDAO.getSizeByKeywords(keywords, "");
    }
    @Override
    public int getSizeByKeyWords(String keywords, String region) {
        return viewDAO.getSizeByKeywords(keywords, region);
    }
    @Override
    public List<HotelVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, "", HotelFieldName.HOTEL_ID);
    }
    @Override
    public List<HotelVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region) {
        return listByKeyWords(currentPage, pageSize, keywords, region, HotelFieldName.HOTEL_ID);
    }
    @Override
    public List<HotelVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled) {
        return viewDAO.listByKeywords(currentPage, pageSize, keywords, region, orderFiled);
    }
}
