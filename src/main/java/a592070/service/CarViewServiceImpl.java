package a592070.service;

import a592070.dao.CarViewDAOImpl;
import a592070.dao.ViewDAO;
import a592070.fieldenum.CarFieldName;
import a592070.pojo.AttractionVO;
import a592070.pojo.CarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.Nullable;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(rollbackFor = {Exception.class})
public class CarViewServiceImpl implements ViewService<CarVO>{
    @Autowired@Qualifier("carViewDao")
    private ViewDAO<CarVO> viewDAO;

    @Override
    public CarVO getEle(int id){
        return viewDAO.getEle(id);
    }

    @Override
    public List<byte[]> getPictures(int id) {
        return null;
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
    public List<CarVO> list(int currentPage, int pageSize) {
        return list(currentPage, pageSize, CarFieldName.CAR_ID);
    }

    @Override
    public List<CarVO> list(int currentPage, int pageSize, String orderFiled) {
        return list(currentPage, pageSize, orderFiled, false);
    }
    @Override
    public List<CarVO> list(int currentPage, int pageSize, String orderFiled, boolean descending) {
        return viewDAO.listByRownum(currentPage, pageSize, orderFiled, descending);
    }

    @Override
    public int getSizeByKeyWords(String keywords) {
        return getSizeByKeyWords(keywords, "");
    }

    @Override
    public int getSizeByKeyWords(String keywords, String region) {
        return viewDAO.getSizeByKeywords(keywords, "");
    }

    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords) {
        return listByKeyWords(currentPage, pageSize, keywords, null, CarFieldName.CAR_ID);
    }

    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region) {
        return listByKeyWords(currentPage, pageSize, keywords, null, CarFieldName.CAR_ID);
    }

    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled) {
        return listByKeyWords(currentPage, pageSize, keywords, null, orderFiled, false);
    }
    @Override
    public List<CarVO> listByKeyWords(int currentPage, int pageSize, String keywords, String region, String orderFiled, boolean descending) {
        return viewDAO.listByKeywords(currentPage, pageSize, keywords, null, orderFiled, descending);
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
    @Override
    public List<CarVO> listByRegion(int currentPage, int pageSize, String region, String orderFiled, boolean descending) {
        return null;
    }
}
