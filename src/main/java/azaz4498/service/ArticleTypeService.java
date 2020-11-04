package azaz4498.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import azaz4498.model.ArticleType;
import azaz4498.model.ArticleTypeDAO;

@Transactional
public class ArticleTypeService {
	@Autowired@Qualifier("ArticleTypeDAO")
	private ArticleTypeDAO atDao;
	
	public List<ArticleType> showArticleType(int typeId) throws SQLException{
		return atDao.showArticleType(typeId);
	}
	
	public List<ArticleType> showAllType(){
		return atDao.showAllType();
	}
}
