package azaz4498.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import azaz4498.model.Article;
import azaz4498.model.Picture;
import azaz4498.model.PictureDAO;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;
import azaz4498.service.PictureService;

@Controller
@Lazy
@SessionAttributes(names = { "artBean", "typeBean" })
public class ArticleController {
	@Autowired
	@Qualifier("ArticleService")
	ArticleService articleService;
	@Autowired
	@Qualifier("ArticleTypeService")
	ArticleTypeService articleTypeService;
	@Autowired
	PictureService pictureService;

	@RequestMapping(path = "/Forum")
	public String ForumEntry(Model m) {
		m.addAttribute("artBean", articleService.showAllArticles());
//		return "azaz4498/F_index";
		return "azaz4498/F_JSONindex";

	}
	@RequestMapping(path = "/test")
	public String testPage() {
		return "azaz4498/test";
	}

	@RequestMapping(path = "/Article.controller.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> showArticles() {
		List<Article> artList = articleService.showAllArticles();
//		Map<String, Object> map = new HashMap<>();
//		map.put("list",artList);
		return artList;

	}

	@RequestMapping(path = "/artTypeSearch")
	public String DisplayByType(@RequestParam(name = "articleType") Integer typeId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticlesByType(typeId));
		m.addAttribute("typeBean", articleTypeService.showAllType());
		m.addAttribute("articleType", typeId);
		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/artTypeSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> dispalyByTypeJSON(@RequestParam(name = "articleType") Integer typeId)
			throws SQLException {
		List<Article> artList = articleService.showArticlesByType(typeId);
		return artList;
	}

	@RequestMapping(path = "/articleSearch")
	public String DisplayResults(@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "articleType", defaultValue = "", required = false) Integer articleType, Model m) {

		m.addAttribute("artBean", articleService.searchArticles(keyword, articleType));
		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/articleSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> DisplayJSONResults(
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "articleType", defaultValue = "", required = false) Integer articleType) {
		List<Article> artList = articleService.searchArticles(keyword, articleType);
		return artList;

	}

	@RequestMapping(path = "/editPage.controller")
	public String EditPage(@RequestParam(name = "artId") Integer articleId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticleById(articleId));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/edit.controller", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "artId") Integer articleId,
			@RequestParam(name = "userid") String userid, @RequestParam(name = "typeSelect") Integer typeId)
			throws SQLException {

		articleService.articleEdit(title, content, articleId, userid, typeId);

		return "redirect:/Forum";
	}

	@RequestMapping(path = "/delete.controller", method = RequestMethod.POST)
	public String Delete(@RequestParam(name = "artId") Integer articleId, Model m) {
		articleService.deleteArticleByAdmin(articleId);
//		ModelAndView mv = new ModelAndView("redirect:/Forum");

		return "redirect:/Forum";

	}

	@RequestMapping(path = "/insertJson")
	public void JsonInsert() throws SQLException, JsonProcessingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(new File("C:/Lab2Workspace/_tainan.json"));
		java.util.List<String> titles = node.findValuesAsText("art_title");
		java.util.List<String> types = node.findValuesAsText("art_type");
		java.util.List<String> users = node.findValuesAsText("art_userid");
		for (Integer i = 0; i < titles.size(); i++) {
			String title = titles.get(i);
			String userId = users.get(i);
			String content = "測試文章暫不提供內文";
			Integer typeId = 0;
			String type = types.get(i);
			switch (type) {
			case "遊記":
				typeId = 1;
				break;
			case "住宿":
				typeId = 2;
				break;
			case "飲食":
				typeId = 3;
				break;
			case "景點":
				typeId = 4;
				break;
			case "交通":
				typeId = 5;
				break;
			case "行程":
				typeId = 6;
				break;
			case "購物":
				typeId = 7;
				break;
			case "其他":
				typeId = 0;
				break;

			default:
				typeId = 0;
				break;
			}
			articleService.newArticle(title, typeId, content, userId);
			System.out.println("新建文章成功");
		}

	}

	@RequestMapping(path = "/statusChange.controller", method = RequestMethod.POST)
	public String statusChange(@RequestParam(name = "artId") Integer articleId) {
		articleService.switchStatus(articleId);

		return "redirect:/Forum";
	}
	
	
	@RequestMapping(path = "/imgUpload",method = RequestMethod.POST)
	public @ResponseBody Map<String, String> imgUpload(@RequestParam(name = "upload")MultipartFile uploadFile,HttpServletRequest request) throws IOException{
		Map<String, String> map = new HashMap<String, String>();
		String fileName = uploadFile.getOriginalFilename();
		String finalFileName = UUID.randomUUID()+fileName.substring(fileName.lastIndexOf("."));
		
		String path = request.getServletContext().getRealPath("/img/azaz4498")+File.separator+finalFileName;
		
		File file = new File(path);
		InputStream is = uploadFile.getInputStream();
		byte[] bytes = FileCopyUtils.copyToByteArray(is);
		uploadFile.transferTo(file);
		
		Picture picture = new Picture();
		picture.setPicFileName(finalFileName);
		picture.setPicUrl(path);
		picture.setPicture(bytes);
		Integer articleId = 41;
		picture.setRefId(articleId);
		
		Integer picId = pictureService.addPic(picture).getId();
		String imgPath = "showPic/"+picId;
		
		
		
//		articleService.uploadImg(41, bytes, path);
		System.out.println(path);
		
		map.put("finalFileName", finalFileName);
		map.put("url", imgPath);
		map.put("uploaded","true");
		is.close();
		System.out.println("imgUpload ====================");
		return map;
		
		
	}
	@RequestMapping(path="/showPic/{id}",method = RequestMethod.GET)
	public ResponseEntity<byte[]> showImg(@PathVariable(name = "id")Integer id) throws IOException{
		HttpHeaders headers = new HttpHeaders();
		Picture picture = pictureService.getPic(id);
		
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(picture.getPicture(),headers,HttpStatus.OK);
		
		return responseEntity;
		
	}
	
	
}
