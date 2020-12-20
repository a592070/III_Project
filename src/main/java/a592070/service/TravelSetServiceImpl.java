package a592070.service;

import a592070.dao.TravelSetDAO;
import a592070.pojo.TravelSetDO;
import a592070.pojo.TravelSetVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import utils.StringUtil;

import java.util.List;

@Transactional(rollbackFor = {Exception.class})
public class TravelSetServiceImpl implements TravelSetService{
    @Autowired@Qualifier("travelSetDao")
    private TravelSetDAO dao;

    @Override
    public boolean checkUser(String username) {
        return dao.checkUser(username);
    }

    @Override
    public TravelSetDO getEle(Integer id, boolean loadFetch) {
        return getEle(id, loadFetch, false);
    }
    @Override
    public TravelSetDO getEle(Integer id, boolean loadFetch, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return dao.getTravelSetByID(id, loadFetch, findFromPersistence);
    }

    @Override
    public TravelSetDO getEleByUser(Integer id, String userName, boolean loadFetch) {
        if(id == null || id==0) return null;
        if(StringUtil.isEmpty(userName)) return null;
        return dao.getTravelSetByUser(id, userName, loadFetch);
    }

    @Override
    public int getSize() {
        return dao.getSize();
    }
    @Override
    public int getSizeWithStatus(boolean available) {
        return dao.getSize(available);
    }


    @Override
    public List<TravelSetVO> listByRownum(int currentPage, int resultSize) {
        return listByRownum(currentPage, resultSize, SN);
    }
    @Override
    public List<TravelSetVO> listByRownum(int currentPage, int resultSize, String orderFiled) {
        return listByRownum(currentPage, resultSize, orderFiled, false);
    }
    @Override
    public List<TravelSetVO> listByRownum(int currentPage, int pageSize, String orderFiled, boolean descending) {
        int index = (currentPage-1)* pageSize;
        return dao.listByRownum(index, pageSize, orderFiled, descending);
    }

    @Override
    public List<TravelSetVO> listByRownumWithStatus(int currentPage, int pageSize, boolean status) {
        return listByRownumWithStatus(currentPage, pageSize, status, SN);
    }
    @Override
    public List<TravelSetVO> listByRownumWithStatus(int currentPage, int pageSize, boolean status, String orderFiled) {
        return listByRownumWithStatus(currentPage, pageSize, status, orderFiled, false);
    }

    @Override
    public List<TravelSetVO> listByRownumWithStatus(int currentPage, int pageSize, boolean status, String orderFiled, boolean descending) {
        int index = (currentPage-1)* pageSize;
        return dao.listByRownum(index, pageSize, orderFiled, descending, status);
    }


    @Override
    public int getSizeByIdentity(Integer identity) {
        if(identity == null || identity==0) return getSize();
        return dao.getSizeByIdentity(identity);
    }
    @Override
    public int getSizeByIdentityWithStatus(Integer identity, boolean status) {
        if(identity == null || identity==0) getSizeWithStatus(status);
        return dao.getSizeByIdentity(identity, status);
    }

    @Override
    public List<TravelSetVO> listByIdentityWithStatus(int currentPage, int pageSize, Integer identity, boolean status) {
        return listByIdentityWithStatus(currentPage, pageSize, identity, status, SN);
    }
    @Override
    public List<TravelSetVO> listByIdentityWithStatus(int currentPage, int pageSize, Integer identity, boolean status, String orderFiled) {
        return listByIdentityWithStatus(currentPage, pageSize, identity, status, orderFiled, false);
    }
    @Override
    public List<TravelSetVO> listByIdentityWithStatus(int currentPage, int pageSize, Integer identity, boolean status, String orderFiled, boolean descending) {
        if(identity == null || identity==0) return listByRownumWithStatus(currentPage, pageSize, status, orderFiled, descending);
        int index = (currentPage-1)* pageSize;
        return dao.listTravelSetByIdentity(index, pageSize, identity, orderFiled, descending, status);
    }


    @Override
    public List<TravelSetVO> listByIdentity(int currentPage, int pageSize, Integer identity) {
        return listByIdentity(currentPage, pageSize, identity, SN);
    }
    @Override
    public List<TravelSetVO> listByIdentity(int currentPage, int pageSize, Integer identity, String orderFiled) {
        return listByIdentity(currentPage, pageSize, identity, orderFiled, false);
    }
    @Override
    public List<TravelSetVO> listByIdentity(int currentPage, int pageSize, Integer identity, String orderFiled, boolean descending) {
        if(identity == null || identity==0) return listByRownum(currentPage, pageSize, orderFiled, descending);

        int index = (currentPage-1)* pageSize;
        return dao.listTravelSetByIdentity(index, pageSize, identity, orderFiled, descending);
    }




    @Override
    public int getSizeByKeywords(String keywords) {
        if(StringUtil.isEmpty(keywords)) return getSize();
        return dao.getSizeByKeywords(keywords);
    }
    @Override
    public int getSizeByKeywordsWithStatus(String keywords, boolean status) {
        if(StringUtil.isEmpty(keywords)) return getSizeWithStatus(status);
        return dao.getSizeByKeywords(keywords, status);
    }

    @Override
    public List<TravelSetVO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status) {
        return listByKeywordsWithStatus(currentPage, pageSize, keywords, status, SN);
    }

    @Override
    public List<TravelSetVO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status, String orderFiled) {
        return listByKeywordsWithStatus(currentPage, pageSize, keywords, status, orderFiled, false);
    }

    @Override
    public List<TravelSetVO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords) || "all".equals(keywords)) return listByRownumWithStatus(currentPage, pageSize, status, orderFiled, descending);

        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        int index = (currentPage-1)* pageSize;
        return dao.listByKeywords(index, pageSize, keywords, orderFiled, descending, status);
    }


    @Override
    public List<TravelSetVO> listByKeywords(int currentPage, int pageSize, String keywords) {
        return listByKeywords(currentPage, pageSize  , keywords, SN);
    }
    @Override
    public List<TravelSetVO> listByKeywords(int currentPage, int pageSize, String keywords, String orderFiled) {
        return listByKeywords(currentPage, pageSize, keywords, orderFiled, false);
    }
    @Override
    public List<TravelSetVO> listByKeywords(int currentPage, int pageSize, String keywords, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords) || "all".equals(keywords)) return listByRownum(currentPage, pageSize, orderFiled, descending);

        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        int index = (currentPage-1)* pageSize;
        return dao.listByKeywords(index, pageSize, keywords, orderFiled, descending);
    }

    @Override
    public int getSizeBySelect(Integer identity, String keywords) {
        if(identity == null || identity==0) return getSizeByKeywords(keywords);
        if(StringUtil.isEmpty(keywords)) return getSizeByIdentity(identity);

        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        return dao.getSizeBySelect(identity, keywords);
    }

    @Override
    public int getSizeBySelectWithStatus(Integer identity, String keywords, boolean status) {
        if(identity == null || identity==0) return getSizeByKeywordsWithStatus(keywords, status);
        if(StringUtil.isEmpty(keywords)) return getSizeByIdentityWithStatus(identity, status);

        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        return dao.getSizeBySelect(identity, keywords, status);
    }

    @Override
    public List<TravelSetVO> listBySelect(int currentPage, int pageSize, Integer identity, String keywords) {
        return listBySelect(currentPage, pageSize, identity, keywords, SN);
    }

    @Override
    public List<TravelSetVO> listBySelect(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled) {
        return listBySelect(currentPage, pageSize, identity, keywords, orderFiled, false);
    }

    @Override
    public List<TravelSetVO> listBySelect(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled, boolean descending) {
        if(identity == null || identity==0) return listByKeywords(currentPage, pageSize, keywords, orderFiled, descending);
        if(StringUtil.isEmpty(keywords)) return listByIdentity(currentPage, pageSize, identity, orderFiled, descending);

        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        int index = (currentPage-1)* pageSize;
        return dao.listBySelect(index, pageSize, identity, keywords, orderFiled, descending);
    }

    @Override
    public List<TravelSetVO> listBySelectWithStatus(int currentPage, int pageSize, Integer identity, String keywords, boolean status) {
        return listBySelectWithStatus(currentPage, pageSize, identity, keywords, SN, status);
    }

    @Override
    public List<TravelSetVO> listBySelectWithStatus(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled, boolean status) {
        return listBySelectWithStatus(currentPage, pageSize, identity, keywords, orderFiled, false, status);
    }

    @Override
    public List<TravelSetVO> listBySelectWithStatus(int currentPage, int pageSize, Integer identity, String keywords, String orderFiled, boolean descending, boolean status) {
        if(identity == null || identity==0) return listByKeywordsWithStatus(currentPage, pageSize, keywords, status, orderFiled, descending);
        if(StringUtil.isEmpty(keywords)) return listByIdentityWithStatus(currentPage, pageSize, identity, status, orderFiled, descending);

        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        int index = (currentPage-1)* pageSize;
        return dao.listBySelect(index, pageSize, identity, keywords, orderFiled, descending, status);
    }


    @Override
    public int getSizeByUser(String userName, boolean status) {
        return dao.getSizeByUser(userName, status);
    }

    @Override
    public List<TravelSetVO> listByUserWithStatus(int currentPage, int pageSize, String userName, boolean status) {
        return listByUserWithStatus(currentPage, pageSize, userName, status, SN);
    }

    @Override
    public List<TravelSetVO> listByUserWithStatus(int currentPage, int pageSize, String userName, boolean status, String orderFiled) {
        return listByUserWithStatus(currentPage, pageSize, userName, status, orderFiled, false);
    }

    @Override
    public List<TravelSetVO> listByUserWithStatus(int currentPage, int pageSize, String userName, boolean status, String orderFiled, boolean descending) {
        int index = (currentPage-1)* pageSize;
        return dao.listByUser(index, pageSize, userName, orderFiled, descending, status);
    }

    @Override
    public int getSizeByUserSelect(String userName, String keywords, boolean status) {
        if(StringUtil.isEmpty(keywords)) return getSizeByUser(userName, status);
        return dao.getSizeByUserSelect(userName, keywords, status);
    }

    @Override
    public List<TravelSetVO> listByUserSelectWithStatus(int currentPage, int pageSize, String userName, String keywords, boolean status) {
        return listByUserSelectWithStatus(currentPage, pageSize, userName, keywords, status, SN);
    }

    @Override
    public List<TravelSetVO> listByUserSelectWithStatus(int currentPage, int pageSize, String userName, String keywords, boolean status, String orderFiled) {
        return listByUserSelectWithStatus(currentPage, pageSize, userName, keywords, status, orderFiled, false);
    }

    @Override
    public List<TravelSetVO> listByUserSelectWithStatus(int currentPage, int pageSize, String userName, String keywords, boolean status, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords)) return listByUserWithStatus(currentPage, pageSize, userName, status, orderFiled, descending);
        keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        int index = (currentPage-1)* pageSize;
        return dao.listByUserSelect(index, pageSize, userName, keywords, orderFiled, descending, status);
    }

    @Override
    public TravelSetDO addTravelSet(TravelSetDO travelSetDO) {
        Integer id = dao.addTravelSet(travelSetDO);
        return getEle(id, true);
    }

    @Override
    public TravelSetDO updateTravelSet(TravelSetDO travelSetDO, boolean merge) {
        return dao.updateTravelSet(travelSetDO, merge);
    }

    @Override
    public boolean deleteTravelSet(Integer sn) {
        TravelSetDO ele = getEle(sn, false);
        if(ele == null) return false;
        dao.removeTravelSet(ele);
        return true;
    }

    @Override
    public boolean switchTravelSetAvailable(Integer sn) {
        dao.switchTravelSetStatus(sn);
        return true;
    }

    @Override
    public boolean switchTravelSetAvailable(Integer sn, boolean flag) {
        dao.switchTravelSetStatus(sn ,flag);
        return true;
    }
}
