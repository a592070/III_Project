package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.HotelFieldName;
import static a592070.fieldenum.HotelFieldName.*;
import a592070.pojo.HotelVO;
import asx54630.model.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import utils.StringUtil;

import java.util.List;
@Transactional(rollbackFor = {Exception.class})
public class HotelViewServiceImpl implements ViewService<HotelVO>{
    @Autowired@Qualifier("hotelViewDao")
    private ViewDAO<HotelVO> viewDAO;

    @Override
    public HotelVO getEle(Integer id) {
        return getEle(id, false);
    }

    @Override
    public HotelVO getEle(Integer id, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return viewDAO.getEle(id, findFromPersistence);
    }

    @Override
    public HotelVO getEleWithStatus(Integer id, boolean available) {
        return getEleWithStatus(id, available, false);
    }

    @Override
    public HotelVO getEleWithStatus(Integer id, boolean available, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return viewDAO.getEle(id, findFromPersistence, available);
    }

    @Override
    public List<byte[]> getPictures(Integer id) {
        return null;
    }

    @Override
    public byte[] getPicture(Integer id) {
        return null;
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
        return viewDAO.getSizeByFiled(HOTEL_REGION, region);
    }

    @Override
    public int getSizeByRegionWithStatus(String region, boolean available) {
        return viewDAO.getSizeByFiled(HOTEL_REGION, region, available);
    }

    @Override
    public List<HotelVO> listByRegion(int currentPage, int pageSize, String region) {
        return listByRegion(currentPage, pageSize, region, HOTEL_ID);
    }
    @Override
    public List<HotelVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled) {
        return listByRegion(currentPage, pageSize, region, orderFiled, false);
    }
    @Override
    public List<HotelVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending) {
        return viewDAO.listByFiled(currentPage, pageSize, HOTEL_REGION, region, orderFiled, descending);
    }

    @Override
    public List<HotelVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available) {
        return listByRegionWithStatus(currentPage, pageSize, region, available, HOTEL_ID);
    }

    @Override
    public List<HotelVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled) {
        return listByRegionWithStatus(currentPage, pageSize, region, available, HOTEL_ID, false);
    }

    @Override
    public List<HotelVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled, boolean descending) {
        return viewDAO.listByFiled(currentPage, pageSize, HOTEL_REGION, region, orderFiled, descending, available);
    }


    @Override
    public List<HotelVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, HOTEL_ID);
    }
    @Override
    public List<HotelVO> list(int currentPage, int pageSize, String orderFiled) {
        return list(currentPage, pageSize, orderFiled,false);
    }
    @Override
    public List<HotelVO> list(int currentPage, int pageSize, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByRownum(index, pageSize, orderFiled, descending);
    }

    @Override
    public List<HotelVO> listWithStatus(int currentPage, int pageSize, boolean available) {
        return listWithStatus(currentPage, pageSize, available, HOTEL_ID);
    }

    @Override
    public List<HotelVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled) {
        return listWithStatus(currentPage, pageSize, available, orderFiled, false);
    }

    @Override
    public List<HotelVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByRownum(index, pageSize, orderFiled, descending, available);
    }

    @Override
    public int getSizeByKeyWords(String keywords) {
        if(StringUtil.isEmpty(keywords)) return getSize();
        return viewDAO.getSizeByKeywords(keywords);
    }


    @Override
    public int getSizeByKeyWordsWithStatus(String keywords, boolean available) {
        if(StringUtil.isEmpty(keywords)) return getSizeWithStatus(available);
        return viewDAO.getSizeByKeywords(keywords, available);
    }

    @Override
    public List<HotelVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, HOTEL_ID);
    }
    @Override
    public List<HotelVO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, orderFiled, false);
    }
    @Override
    public List<HotelVO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return list(currentPage, pageSize, orderFiled, descending);
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByKeywords(index, pageSize, keywords, orderFiled, descending);
    }


    @Override
    public List<HotelVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, HOTEL_ID);
    }

    @Override
    public List<HotelVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String orderFiled) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, HOTEL_ID, false);
    }

    @Override
    public List<HotelVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return listWithStatus(currentPage, pageSize, available, orderFiled, descending);
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByKeywords(index, pageSize, keywords, orderFiled, descending, available);
    }

    @Override
    public int getSizeBySelect(String region, String keywords) {
        if(StringUtil.isEmpty(region)) return getSizeByKeyWords(keywords);
        if(StringUtil.isEmpty(keywords)) return getSizeByRegion(region);
        return viewDAO.getSizeBySelect(region, keywords);
    }

    @Override
    public int getSizeBySelectWithStatus(String region, String keywords, boolean available) {
        if(StringUtil.isEmpty(region)) return getSizeByKeyWordsWithStatus(keywords, available);
        if(StringUtil.isEmpty(keywords)) return getSizeByRegionWithStatus(region, available);
        return viewDAO.getSizeBySelect(region, keywords, available);
    }

    @Override
    public List<HotelVO> listBySelect(int currentPage, int pageSize, String region, String keywords) {
        return listBySelect(currentPage, pageSize, region, keywords, HOTEL_ID);
    }

    @Override
    public List<HotelVO> listBySelect(int currentPage, int pageSize, String region, String keywords, String orderFiled) {
        return listBySelect(currentPage, pageSize, region, keywords, orderFiled, false);
    }

    @Override
    public List<HotelVO> listBySelect(int currentPage, int pageSize, String region, String keywords, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(region)) return listByKeyWords(currentPage, pageSize, keywords, orderFiled, descending);
        if(StringUtil.isEmpty(keywords)) return listByRegion(currentPage, pageSize, region, orderFiled, descending);

        int index = (currentPage-1)*pageSize;
        return viewDAO.listBySelect(index, pageSize, region, keywords, orderFiled, descending);
    }

    @Override
    public List<HotelVO> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available) {
        return listBySelectWithStatus(currentPage, pageSize, region, keywords, available, HOTEL_ID);
    }

    @Override
    public List<HotelVO> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available, String orderFiled) {
        return listBySelectWithStatus(currentPage, pageSize, region, keywords, available, orderFiled, false);
    }

    @Override
    public List<HotelVO> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(region)) return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, orderFiled, descending);
        if(StringUtil.isEmpty(keywords)) return listByRegionWithStatus(currentPage, pageSize, region, available, orderFiled, descending);

        int index = (currentPage-1)*pageSize;
        return viewDAO.listBySelect(index, pageSize, region, keywords, orderFiled, descending, available);
    }


}
