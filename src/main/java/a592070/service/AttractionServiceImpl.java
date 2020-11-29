package a592070.service;

import a592070.dao.AttractionDAO;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;
import global.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;
import utils.IOUtils;
import utils.StringUtil;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Transactional(rollbackFor = {Exception.class})
public class AttractionServiceImpl implements AttractionService{
    @Autowired@Qualifier("attractionDao")
    private AttractionDAO dao;

    @Override
    public AttractionDO getEle(Integer id){
        return getEle(id, false);
    }

    @Override
    public AttractionDO getEle(Integer id, boolean findFromPersistence) {
        if(id == null || id==0) return null;
        return dao.getEle(id, findFromPersistence);
    }

    @Override
    public AttractionDO save(AttractionDO attractionDO) {
        if(attractionDO.getSn() == null || attractionDO.getSn()==0){
            Integer insertPk = dao.insert(attractionDO);
            return getEle(insertPk, true);
        }
        return dao.update(attractionDO);
    }

//    @Override
//    public AttractionDO insert(AttractionDO attractionDO) {
//        return dao.insert(attractionDO);
//    }
//    @Override
//    public AttractionDO update(AttractionDO attractionDO) {
//        return dao.update(attractionDO);
//    }

    @Override
    public boolean delete(Integer id) {
        AttractionDO ele = getEle(id);
        if(ele != null){
            dao.delete(ele);
            return true;
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> listPictureDest(AttractionDO attractionDO, String destPrefix, ServletContext context) {
        List<AttractionPictureDO> attractionPic = attractionDO.getAttractionPic();

        List<Map<String, Object>> list = new ArrayList<>();
        for (AttractionPictureDO ele : attractionPic) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", ele.getId());
            map.put("filename", ele.getPicFileName());

            // /WEB-INF/assets/attraction/xxx/xxx.jpg
            String dest = Constant.WEB_INF_PATH + destPrefix + File.separator + ele.getPicFileName();
            if(writePicToDest(ele, dest, context)) map.put("dest", destPrefix+"/"+ele.getPicFileName());

            list.add(map);
        }
        return list;
    }


    @Override
    public boolean writePicToDest(AttractionPictureDO ele, String destPath, ServletContext context) {
        boolean flag = false;
        String realPath = context.getRealPath(destPath);
        try {
            if(!new File(realPath).exists()) {
                assert ele.getPicture() != null;

                // File.pathSeparator  ;
                // File.separator  \
                String dirPath = realPath.substring(0, realPath.lastIndexOf(File.separator));

                File fileDir = new File(dirPath);
                if (!fileDir.exists()) fileDir.mkdir();
                IOUtils.writeFileToDest(realPath, ele.getPicture());
            }
            flag = true;
        } catch (Throwable e) {
            e.printStackTrace();
        }
        return flag;
    }
    private void removePicFromDest(AttractionPictureDO ele, ServletContext context){
        String path = Constant.ATTRACTION_PIC_PATH + File.separator + ele.getAttraction().getSn() + File.separator + ele.getPicFileName();
        String realPath = context.getRealPath(path);
        File file = new File(realPath);

        assert file.exists();
        System.out.println("delete file: " +realPath + "\n" + file.delete());

    }

    @Override
    public void addPicture(AttractionDO attractionDO, AttractionPictureDO pictureDO){
        attractionDO.addPic(pictureDO);
    }
    @Override
    public void addPicture(AttractionDO attractionDO, byte[] pic){
        AttractionPictureDO pictureDO = new AttractionPictureDO();
        pictureDO.setPicture(pic);
        pictureDO.setPicFileName(IOUtils.fileNameByUUID(pic)+".jpg");
        attractionDO.addPic(pictureDO);
    }
    @Override
    public void removePicture(AttractionDO attractionDO, Integer id, ServletContext context){
        List<AttractionPictureDO> pictureDOList = attractionDO.getAttractionPic();

        ListIterator<AttractionPictureDO> iterator = pictureDOList.listIterator();
        while(iterator.hasNext()){
            AttractionPictureDO next = iterator.next();
            if(id.equals(next.getId())){
                iterator.remove();
                try {
                    removePicFromDest(next, context);
                }catch (Throwable e){
                    e.printStackTrace();
                }
            }
        }
    }
    @Override
    public void removePicture(AttractionDO attractionDO, String fileName, ServletContext context){
        List<AttractionPictureDO> pictureDOList = attractionDO.getAttractionPic();

        ListIterator<AttractionPictureDO> iterator = pictureDOList.listIterator();
        while(iterator.hasNext()){
            AttractionPictureDO next = iterator.next();
            if(next.getPicFileName().equals(fileName)){
                iterator.remove();
                try {
                    removePicFromDest(next, context);
                }catch (Throwable e){
                    e.printStackTrace();
                }
            }
        }
    }

}
