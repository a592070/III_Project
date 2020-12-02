package a592070.service;

import a592070.dao.TravelSetDAO;
import a592070.pojo.TravelSetDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import utils.StringUtil;

import java.util.List;

@Transactional(rollbackFor = {Exception.class}, transactionManager="transactionManager")
public class TravelSetServiceImpl implements TravelSetService{
    @Autowired@Qualifier("travelSetDao")
    private TravelSetDAO dao;

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
    public int getSize() {
        return dao.getSize();
    }
    @Override
    public int getSizeWithStatus(boolean available) {
        return dao.getSize(available);
    }


    @Override
    public List<TravelSetDO> listByRownum(int currentPage, int resultSize) {
        return listByRownum(currentPage, resultSize, SN);
    }
    @Override
    public List<TravelSetDO> listByRownum(int currentPage, int resultSize, String orderFiled) {
        return listByRownum(currentPage, resultSize, orderFiled, false);
    }
    @Override
    public List<TravelSetDO> listByRownum(int currentPage, int pageSize, String orderFiled, boolean descending) {
        int index = (currentPage-1)* pageSize;
        return dao.listByRownum(index, pageSize, orderFiled, descending);
    }

    @Override
    public List<TravelSetDO> listByRownumWithStatus(int currentPage, int pageSize, boolean status) {
        return listByRownumWithStatus(currentPage, pageSize, status, SN);
    }
    @Override
    public List<TravelSetDO> listByRownumWithStatus(int currentPage, int pageSize, boolean status, String orderFiled) {
        return listByRownumWithStatus(currentPage, pageSize, status, orderFiled, false);
    }

    @Override
    public List<TravelSetDO> listByRownumWithStatus(int currentPage, int pageSize, boolean status, String orderFiled, boolean descending) {
        int index = (currentPage-1)* pageSize;
        return dao.listByRownum(index, pageSize, orderFiled, descending, status);
    }


    @Override
    public int getSizeByCreated(String created) {
        if(StringUtil.isEmpty(created)) return getSize();
        return dao.getSizeByCreated(created);
    }
    @Override
    public int getSizeByCreatedUserWithStatus(String created, boolean status) {
        if(StringUtil.isEmpty(created)) getSizeWithStatus(status);
        return dao.getSizeByCreated(created, status);
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreatedUserWithStatus(int currentPage, int pageSize, String created, boolean status) {
        return listTravelSetByCreatedUserWithStatus(currentPage, pageSize, created, status, SN);
    }
    @Override
    public List<TravelSetDO> listTravelSetByCreatedUserWithStatus(int currentPage, int pageSize, String created, boolean status, String orderFiled) {
        return listTravelSetByCreatedUserWithStatus(currentPage, pageSize, created, status, orderFiled, false);
    }
    @Override
    public List<TravelSetDO> listTravelSetByCreatedUserWithStatus(int currentPage, int pageSize, String created, boolean status, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(created)) {
            created="%%";
        }else{
            created = new StringBuffer().append("%").append(created).append("%").toString();
        }
        int index = (currentPage-1)* pageSize;
        return dao.listTravelSetByCreated(index, pageSize, created, orderFiled, descending, status);
    }


    @Override
    public List<TravelSetDO> listTravelSetByCreated(int currentPage, int pageSize, String created) {
        return listTravelSetByCreated(currentPage, pageSize, created, SN);
    }
    @Override
    public List<TravelSetDO> listTravelSetByCreated(int currentPage, int pageSize, String created, String orderFiled) {
        return listTravelSetByCreated(currentPage, pageSize, created, orderFiled, false);
    }
    @Override
    public List<TravelSetDO> listTravelSetByCreated(int currentPage, int pageSize, String created, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(created)) {
            created="%%";
        }else{
            created = new StringBuffer().append("%").append(created).append("%").toString();
        }
        int index = (currentPage-1)* pageSize;
        return dao.listTravelSetByCreated(index, pageSize, created, orderFiled, descending);
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
    public List<TravelSetDO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status) {
        return listByKeywordsWithStatus(currentPage, pageSize, keywords, status, SN);
    }

    @Override
    public List<TravelSetDO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status, String orderFiled) {
        return listByKeywordsWithStatus(currentPage, pageSize, keywords, status, orderFiled, false);
    }

    @Override
    public List<TravelSetDO> listByKeywordsWithStatus(int currentPage, int pageSize, String keywords, boolean status, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords) || "all".equals(keywords)) {
            keywords="%%";
        }else{
            keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        }
        int index = (currentPage-1)* pageSize;
        return dao.listByKeywords(index, pageSize, keywords, orderFiled, descending, status);
    }


    @Override
    public List<TravelSetDO> listByKeywords(int currentPage, int pageSize, String keywords) {
        return listByKeywords(currentPage, pageSize  , keywords, SN);
    }
    @Override
    public List<TravelSetDO> listByKeywords(int currentPage, int pageSize, String keywords, String orderFiled) {
        return listByKeywords(currentPage, pageSize, keywords, orderFiled, false);
    }
    @Override
    public List<TravelSetDO> listByKeywords(int currentPage, int pageSize, String keywords, String orderFiled, boolean descending) {
        if(StringUtil.isEmpty(keywords) || "all".equals(keywords)) {
            keywords="%%";
        }else{
            keywords = new StringBuffer().append("%").append(keywords).append("%").toString();
        }
        int index = (currentPage-1)* pageSize;
        return dao.listByKeywords(index, pageSize, keywords, orderFiled, descending);
    }





    @Override
    public TravelSetDO addTravelSet(TravelSetDO travelSetDO) {
        Integer id = dao.addTravelSet(travelSetDO);
        return getEle(id, true);
    }

    @Override
    public TravelSetDO updateTravelSet(TravelSetDO travelSetDO) {
        return dao.updateTravelSet(travelSetDO);
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
}
