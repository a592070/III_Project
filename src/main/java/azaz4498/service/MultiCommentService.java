package azaz4498.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import azaz4498.model.MultiComment;
import azaz4498.model.MultiCommentDAO;
@Transactional
public class MultiCommentService {
@Autowired@Qualifier("MultiCommentDAO")
private MultiCommentDAO mDao;

public List<MultiComment> getMultiCommentsByComId(int commentId){
	return mDao.getMultiCommentsByComId(commentId);
}
public MultiComment newMultiComment(String content, int comId,String userId) {
	return mDao.newMultiComment(content, comId, userId);
}
public boolean deleteMultiComment(int id, String userId) {
	return mDao.deleteMultiComment(id, userId);
	
}
public MultiComment editMultiComment(String content,int id, String userId) {
	return mDao.editMultiComment(content, id, userId);
}

}
