package a592070.service;

import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;

import javax.servlet.ServletContext;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface AttractionService {
    int getFromDatabase = 0;
    int findFromPersistence = 1;

    AttractionDO getEle(Integer id);
    AttractionDO getEle(Integer id, int findFromPersistence);
    AttractionDO getEle(Integer id, int findFromPersistence, boolean loadPicture);
    AttractionDO getEleWithStatus(Integer id, boolean available);
    AttractionDO getEleWithStatus(Integer id, boolean available, int findFromPersistence);
    AttractionDO getEleWithStatus(Integer id, boolean available, int findFromPersistence, boolean loadPicture);


    AttractionDO save(AttractionDO attractionDO);
//    AttractionDO insert(AttractionDO attractionDO);
//    AttractionDO update(AttractionDO attractionDO);
    boolean delete(Integer id);

    List<Map<String, Object>> listPictureDest(AttractionDO attractionDO, String destPrefix, ServletContext context);

    boolean writePicToDest(AttractionPictureDO ele, String destPath, ServletContext context);

    void addPicture(AttractionDO attractionDO, AttractionPictureDO pictureDO);

    void addPicture(AttractionDO attractionDO, byte[] pic);

    void removePicture(AttractionDO attractionDO, Integer id, ServletContext context);

    void removePicture(AttractionDO attractionDO, String fileName, ServletContext context);
}
