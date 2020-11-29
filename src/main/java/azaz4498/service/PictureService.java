package azaz4498.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import azaz4498.model.Picture;
import azaz4498.model.PictureDAO;


@Transactional
public class PictureService {
	@Autowired
	private PictureDAO pDao;
	
	public List<Picture> getPictures(int articleId) {
		return pDao.getPictures(articleId);
	}
	
	public Picture addPic(Picture picture) throws IOException {
		return pDao.newPic(picture);
	}
	
	public Picture getPic(Integer id) {
		return pDao.getPic(id);
	}
	
}
