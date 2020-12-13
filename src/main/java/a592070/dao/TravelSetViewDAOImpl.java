package a592070.dao;

import a592070.pojo.TravelSetDO;

import java.util.List;

public class TravelSetViewDAOImpl implements ViewDAO<TravelSetDO> {
    @Override
    public int getSize() {
        return 0;
    }

    @Override
    public int getSize(boolean available) {
        return 0;
    }

    @Override
    public TravelSetDO getEle(Integer id, boolean findFromPersistence) {
        return null;
    }

    @Override
    public TravelSetDO getEle(Integer id, boolean findFromPersistence, boolean available) {
        return null;
    }

    @Override
    public byte[] getPicture(Integer id) {
        return new byte[0];
    }

    @Override
    public List getPictures(Integer id) {
        return null;
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region) {
        return 0;
    }

    @Override
    public int getSizeByKeywords(String keyWords, String region, boolean available) {
        return 0;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByKeywords(int firstIndex, int resultSize, String keyWords, String region, String orderFiled, boolean descending, boolean available) {
        return null;
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue) {
        return 0;
    }

    @Override
    public int getSizeByFiled(String filedName, String filedValue, boolean available) {
        return 0;
    }

    @Override
    public List<TravelSetDO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByFiled(int firstIndex, int resultSize, String filedName, String filedValue, String orderFiled, boolean descending, boolean available) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending) {
        return null;
    }

    @Override
    public List<TravelSetDO> listByRownum(int firstIndex, int resultSize, String orderFiled, boolean descending, boolean available) {
        return null;
    }
}
