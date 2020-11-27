package a592070;

import a592070.dao.AttractionDAO;
import a592070.pojo.AttractionDO;
import a592070.pojo.AttractionPictureDO;
import junit.framework.TestCase;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.QueryHints;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import utils.IOUtils;
import utils.PictureSupport;

import javax.persistence.QueryHint;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringJUnitConfig(locations = {"classpath:springmvc.servlet.xml"})
//@ContextConfiguration(locations = {"classpath:springmvc.servlet.xml", "classpath:sqlBeans.xml", "classpath:a592070.beans.xml", "classpath:hibernate.cfg.xml"})
public class InitAttractionPicture extends TestCase {
    @Autowired(required = true)@Qualifier("sessionFactory")
    public SessionFactory sessionFactory;

    @Test
    public void addPic(){
        String hql = "from AttractionDO where (picture is null) and (pictureUrl is not null) ";
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Query<AttractionDO> query = session.createQuery(hql, AttractionDO.class);
        List<AttractionDO> list = query.list();
        try {
            for (AttractionDO ele : list) {
                PictureSupport.writeToDB(ele, "picture", "pic");
                session.merge(ele);
            }
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }

    @Test
    public void writePicToLocal() throws IOException {
        String local = "other/a592070ResponseJsonType/attraction";

        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Query<AttractionPictureDO> query = session.createQuery("from AttractionPictureDO order by attraction.sn", AttractionPictureDO.class);

        List<AttractionPictureDO> list = query.list();
        for (AttractionPictureDO ele : list) {
            if(ele.getPicture() == null) continue;
            String destFile = local +"/"+ ele.getAttraction().getSn();
            File file = new File(destFile);
            if(!(file.exists() && file.isDirectory())){
                file.mkdir();
            }

            String dest = destFile + "/" + UUID.nameUUIDFromBytes(ele.getPicture()) + ".jpg";
            write(dest, ele.getPicture());
            ele.setPicFileName(dest.substring(dest.lastIndexOf("/")+1));
        }

        session.getTransaction().commit();

    }
    public void write(String dest, byte[] pic) throws IOException {
        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(dest));
        out.write(pic);
        out.close();
    }

    @Test
    public void writePicToEntity() {
        String local = "src/main/webapp/WEB-INF/assets/attraction/";

        File file = new File(local);
        System.out.println(file.getAbsolutePath());
        assert file.exists() && file.isDirectory();

        File[] files = file.listFiles();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        try {
            for (File idDir : files) {
                String idDirName = idDir.getName();
                if (idDir.isDirectory()) {
                    File[] picFile = idDir.listFiles();

                    Query<AttractionDO> query = session.createQuery("from AttractionDO where sn=:id", AttractionDO.class);
                    query.setParameter("id", Integer.parseInt(idDirName));
                    AttractionDO attractionDO = query.uniqueResult();

                    for (File pic : picFile) {
//                        Query<AttractionPictureDO> query = session.createQuery("from AttractionPictureDO where attraction.sn=:id and picFileName=:picname", AttractionPictureDO.class);
//                        query.setParameter("id", Integer.parseInt(idDirName));
//                        query.setParameter("picname", pic.getName());
//                        AttractionPictureDO pictureDO = query.getSingleResult();
//                        pictureDO.setPicture(IOUtils.pathToByteArray(local));


                        AttractionPictureDO pictureDO = new AttractionPictureDO();
                        pictureDO.setPicture(IOUtils.pathToByteArray(pic.getAbsolutePath()));
                        pictureDO.setPicFileName(pic.getName());
                        attractionDO.addPic(pictureDO);
                    }
                }
            }
            session.getTransaction().commit();
        }catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
    }
}
