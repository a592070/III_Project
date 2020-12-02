package a592070.service;

import a592070.dao.TravelSetDAO;
import a592070.pojo.TravelSetDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(rollbackFor = {Exception.class})
public class TravelSetServiceImpl implements TravelSetService{
    @Autowired
    private TravelSetDAO dao;

    @Override
    public TravelSetDO getEle(Integer id) {
        return getEle(id, false);
    }

    @Override
    public TravelSetDO getEle(Integer id, boolean findFromPersistence) {
        return dao.getTravelSetByID(id, findFromPersistence);
    }

    @Override
    public int getSize() {
        return dao.getSize();
    }

    @Override
    public int getSize(boolean available) {
        return dao.getSize(available);
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize) {
        return listByRownum(firstIndex, resultSize, SN);
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled) {
        return listByRownum(firstIndex, resultSize, orderFiled, false);
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        return dao.listByRownum(firstIndex, resultSize, orderFiled, descending);
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        return dao.listByRownum(firstIndex, resultSize, orderFiled, descending, available);
    }

    @Override
    public int getSizeByCreated(String created) {
        return dao.getSizeByCreated(created);
    }

    @Override
    public int getSizeByCreated(String created, boolean available) {
        return dao.getSizeByCreated(created, available);
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created) {
        return listTravelSetByCreated(firstIndex, resultSize, created, SN);
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled) {
        return null;
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public List<TravelSetDO> listTravelSetByCreated(int firstIndex, int resultSize, String created, boolean available, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public int getSizeByKeywords(String keyWords) {
        return 0;
    }

    @Override
    public int getSizeByKeywords(String keyWords, boolean available) {
        return 0;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keywords, String orderFiled, boolean descending, boolean available) {
        return null;
    }

    @Override
    public TravelSetDO addTravelSet(TravelSetDO travelSetDO) {
        return null;
    }

    @Override
    public TravelSetDO updateTravelSet(TravelSetDO travelSetDO) {
        return null;
    }

    @Override
    public boolean switchTravelSetAvailable(Integer sn) {
        return false;
    }
}
