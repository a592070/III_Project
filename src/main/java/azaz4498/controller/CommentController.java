package azaz4498.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import azaz4498.model.Comment;
import azaz4498.service.CommentService;

@Controller
@Lazy
public class CommentController {
	@Autowired
	CommentService commentService;
	
	@RequestMapping(path = "/newComment.controller",method = RequestMethod.POST)
	public @ResponseBody Comment newComment(@RequestParam(name = "c_content")String content,@RequestParam(name="artId")Integer articleId, @RequestParam(name="c_userId")String userId) throws SQLException{
		Comment comment =commentService.newComment(content, articleId, userId);
		return comment;
	}
}

