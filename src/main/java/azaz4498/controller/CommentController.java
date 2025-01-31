package azaz4498.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import azaz4498.model.Comment;
import azaz4498.model.MultiComment;
import azaz4498.service.CommentService;
import azaz4498.service.MultiCommentService;
import rambo0021.pojo.AccountBean;

@Controller
@Lazy
@SessionAttributes(names = "userBean")
public class CommentController {
	@Autowired
	CommentService commentService;
	@Autowired
	MultiCommentService multiCommentService;
	
	@RequestMapping(path = "/newComment.controller",method = RequestMethod.POST)
	public @ResponseBody Comment newComment(@RequestParam(name = "c_content")String content,@RequestParam(name="artId")Integer artId,HttpSession session) throws SQLException{
		AccountBean account =(AccountBean) session.getAttribute("userBean");
		
		Comment comment =commentService.newComment(content, artId, account.getUserName());
		return comment;
	}
	@RequestMapping(path = "/newMultiComment.controller", method = RequestMethod.POST)
	public @ResponseBody MultiComment newMultiComment(HttpSession session,@RequestParam(name = "mc_content") String content,@RequestParam(name = "comId") int comId,String userId) {
		AccountBean account =(AccountBean) session.getAttribute("userBean");
		MultiComment multiComment = multiCommentService.newMultiComment(content, comId, account.getUserName());
		return multiComment;
	}
	@RequestMapping(path = "/deleteComment/{comId}",method = RequestMethod.POST)
	public @ResponseBody boolean deleteComment(@PathVariable(name = "comId")int comId, @RequestParam(name = "user")String userId) {
		return commentService.deleteComment(comId, userId);
	}
	@RequestMapping(path = "/deleteMultiComment/{comId}",method = RequestMethod.POST)
	public @ResponseBody boolean deleteMultiComment(@PathVariable(name = "comId")int comId, @RequestParam(name = "user")String userId) {
		return multiCommentService.deleteMultiComment(comId, userId);
	}
	@RequestMapping(path="/editComment" ,method = RequestMethod.POST)
	public @ResponseBody Comment commentEdit(@RequestParam(name = "content")String content, 
			@RequestParam(name = "id")int commentId, 
			@RequestParam(name = "user")String userid) throws SQLException {
		
		return commentService.commentEdit(content, commentId, userid);
	}
	@RequestMapping(path="/editMultiComment" ,method = RequestMethod.POST)
	public @ResponseBody MultiComment multiCommentEdit(@RequestParam(name="content")String content,
			@RequestParam(name="id")int id,
			@RequestParam(name="user")String userId) {
		return multiCommentService.editMultiComment(content, id, userId);
	}
	
}

