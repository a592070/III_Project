package a592070.service;

import a592070.dao.CarViewDAOImpl;
import a592070.dao.ViewDAO;
import a592070.fieldenum.CarFieldName;
import static a592070.fieldenum.CarFieldName.*;
import a592070.pojo.AttractionVO;
import a592070.pojo.CarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;
import utils.StringUtil;

import java.util.List;

@Transactional(rollbackFor = {Exception.class})
public class CarViewServiceImpl implements ViewService<CarVO>{
    @Autowired@Qualifier("carViewDao")
    private ViewDAO<CarVO> viewDAO;

    @Override
    public CarVO getEle(Integer id){
        return getEle(id, false);
    }

    @Override
    public CarVO getEle(Integer id, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return viewDAO.getEle(id, findFromPersistence);
    }

    @Override
    public CarVO getEleWithStatus(Integer id, boolean available) {
        return getEle(id);
    }

    @Override
    public CarVO getEleWithStatus(Integer id, boolean available, boolean findFromPersistence) {
        return getEle(id, findFromPersistence);
    }

    @Override
    public int getSize() {
        return viewDAO.getSize();
    }

    @Override
    public int getSizeWithStatus(boolean available) {
        return getSize();
    }


    @Override
    public List<CarVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, CAR_ID);
    }

    @Override
    public List<CarVO> list(int currentPage, int pageSize, String orderFiled) {
        return list(currentPage, pageSize, orderFiled, false);
    }
    @Override
    public List<CarVO> list(int currentPage, int pageSize, String orderFiled, boolean descending) {
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByRownum(index, pageSize, orderFiled, descending);
    }

    @Override
    public List<CarVO> listWithStatus(int currentPage, int pageSize, boolean available) {
        return list(currentPage, pageSize);
    }

    @Override
    public List<CarVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled) {
        return list(currentPage, pageSize, orderFiled);
    }

    @Override
    public List<CarVO> listWithStatus(int currentPage, int pageSize, boolean available, String orderFiled, boolean descending) {
        return list(currentPage, pageSize, orderFiled, descending);
    }


    @Override
    public int getSizeByKeyWords(String keywords) {
        if(StringUtil.isEmpty(keywords)) return getSize();
        return viewDAO.getSizeByKeywords(keywords);
    }

    @Override
    public int getSizeByKeyWordsWithStatus(String keywords, boolean available) {
        return getSizeByKeyWords(keywords);
    }




    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, CAR_ID);
    }

    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, orderFiled, false);
    }
    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return list(currentPage, pageSize, orderFiled, descending);
        int index = (currentPage-1)*pageSize;
        return viewDAO.listByKeywords(index, pageSize, keywords, orderFiled, descending);
    }

    @Override
    public List<CarVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, CAR_ID);
    }

    @Override
    public List<CarVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String orderFiled) {
        return listByKeyWordsWithStatus(currentPage, pageSize, keywords, available, orderFiled, false);
    }

    @Override
    public List<CarVO> listByKeyWordsWithStatus(int currentPage, int pageSize, String keywords, boolean available, String orderFiled, boolean descending) {
        return listByKeyWords(currentPage, pageSize, keywords, orderFiled, descending);
    }


    @Override
    public int getSizeBySelect(String region, String keywords) {
        if(StringUtil.isEmpty(keywords)) return getSize();
        if(StringUtil.isEmpty(region)) return getSize();
        return getSizeByKeyWords(keywords);
    }

    @Override
    public int getSizeBySelectWithStatus(String region, String keywords, boolean available) {
        if(StringUtil.isEmpty(keywords)) return getSize();
        if(StringUtil.isEmpty(region)) return getSize();
        return getSizeByKeyWords(keywords);
    }

    @Override
    public List<CarVO> listBySelect(int currentPage, int pageSize, String region, String keywords) {
        return listBySelect(currentPage, pageSize, region, keywords, CAR_ID);
    }

    @Override
    public List<CarVO> listBySelect(int currentPage, int pageSize, String region, String keywords, String orderFiled) {
        return listBySelect(currentPage, pageSize, region, keywords, orderFiled, false);
    }

    @Override
    public List<CarVO> listBySelect(int currentPage, int pageSize, String region, String keywords, String orderFiled, boolean descending) {
        return listByKeyWords(currentPage, pageSize, keywords, orderFiled, descending);
    }

    @Override
    public List<CarVO> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available) {
        return listBySelectWithStatus(currentPage, pageSize, region, keywords, available, CAR_ID);
    }

    @Override
    public List<CarVO> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available, String orderFiled) {
        return listBySelectWithStatus(currentPage, pageSize, region, keywords, available, orderFiled, false);
    }

    @Override
    public List<CarVO> listBySelectWithStatus(int currentPage, int pageSize, String region, String keywords, boolean available, String orderFiled, boolean descending) {
        return listByKeyWords(currentPage, pageSize, keywords, orderFiled, descending);
    }




    /**
     *  NOT USING
     * @param region
     * @return
     */
    @Deprecated
    @Override
    public int getSizeByRegion(String region) {
        return 0;
    }

    @Override
    public int getSizeByRegionWithStatus(String region, boolean available) {
        return 0;
    }

    /**
     * NOT USING
     * @param currentPage
     * @param pageSize
     * @param region
     * @return
     */
    @Deprecated
    @Override
    public List<CarVO> listByRegion(int currentPage, int pageSize, String region) {
        return null;
    }
    /**
     * NOT USING
     * @param currentPage
     * @param pageSize
     * @param region
     * @param orderFiled
     * @return
     */
    @Deprecated
    @Override
    public List<CarVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled) {
        return null;
    }
    @Deprecated
    @Override
    public List<CarVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public List<CarVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available) {
        return null;
    }

    @Override
    public List<CarVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled) {
        return null;
    }

    @Override
    public List<CarVO> listByRegionWithStatus(int currentPage, int pageSize, String region, boolean available, String orderFiled, boolean descending) {
        return null;
    }

    @Deprecated
    @Override
    public List<byte[]> getPictures(Integer id) {
        return null;
    }

    @Deprecated
    @Override
    public byte[] getPicture(Integer id) {
        return null;
    }
}
