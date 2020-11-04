package azaz4498.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import azaz4498.model.ArticleType;
import azaz4498.model.ArticleTypeDAO;

@Service("ArticleTypeService")
public class ArticleTypeService {
	@Autowired
	private ArticleTypeDAO atDao;
	
	public List<ArticleType> showArticleType(int typeId) throws SQLException{
		return atDao.showArticleType(typeId);
	}
}
