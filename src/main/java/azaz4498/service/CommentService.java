package azaz4498.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import azaz4498.model.Comment;
import azaz4498.model.CommentDAO;

@Transactional
public class CommentService {
	@Autowired@Qualifier("CommentDAO")
	private CommentDAO cDao;

	// 依文章顯示評論
	public List<Comment> showCommentsByArticle(int articleId) throws SQLException {
		return cDao.showCommentsByArticle(articleId);
	}

	// 新增評論
	public Comment newComment(String content, int articleId, String userid) throws SQLException {
		return cDao.newComment(content, articleId, userid);
	}

	// 刪除評論
	public boolean deleteComment(int commentId, String userid) {
		return cDao.deleteComment(commentId, userid);
	}

	// 編輯評論
	public Comment commentEdit(String content, int commentId, String userid) throws SQLException{
		return cDao.commentEdit(content, commentId, userid);
	}
}
