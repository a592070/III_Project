package azaz4498.model;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.ResponseEntity;
@Lazy
public class PictureDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public  PictureDAO() {
	}
	
	public List<Picture> getPictures(int articleId) {
		Query<Picture> query = sessionFactory.getCurrentSession().createQuery("From Picture where REF_ID=?1",Picture.class);
		query.setParameter(1, articleId);
		List<Picture> list = query.list();
		return list;
	}
	
	public Picture newPic(Picture picture) throws IOException {
		if (picture!=null) {
			sessionFactory.getCurrentSession().save(picture);
		}
		
		return picture;
	}
	
	public Picture getPic(Integer id) {
		Picture result = sessionFactory.getCurrentSession().get(Picture.class, id);
		return result;
	}
	
	
}
