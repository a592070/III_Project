package a592070.service;

import a592070.dao.ViewDAO;
import a592070.fieldenum.AttractionFiledName;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionVO;
import a592070.pojo.CarVO;
import utils.StringUtil;

import java.util.List;

public interface ViewService<T> {

    T getEle(int id);
    byte[] getPicture(int id);

    int getSize();

    int getSizeByRegion(String region);
    List<T> listByRegion(int currentPage, int pageSize, String region);
    List<T> listByRegion(int currentPage, int pageSize, String region, String orderFiled);

    List<T> list(int currentPage, int pageSize);
    List<T> list(int currentPage, int pageSize, String orderFiled);

    int getSizeByKeyWords(String keywords);
    List<T> listByKeyWords(int currentPage, int pageSize, String keywords);
    List<T> listByKeyWords(int currentPage, int pageSize, String keywords, String orderFiled);
}
