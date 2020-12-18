package asx54630.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import a592070.pojo.AttractionDO;
import asx54630.model.Hotel;
import utils.PictureSupport;

@Service("writePicToDB")
@Transactional(rollbackFor = {Throwable.class})
public class WritePicToDB {
	
	@Autowired@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public WritePicToDB() {
		
		String hql = "from Hotel where (PIC is null) and (PIC_URL is not null)";
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query<Hotel> query = session.createQuery(hql, Hotel.class);
		List<Hotel> list = query.list();

        try {
            for (Hotel ele : list) {
                PictureSupport.writeToDB(ele, "picture", "pic");
                session.merge(ele);
            }
            session.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }
	}

	public WritePicToDB pic() {
		WritePicToDB wptdb = new WritePicToDB();
		return wptdb; 
	}

	
}
