package azaz4498.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import azaz4498.model.Article;
import azaz4498.model.Picture;
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
	@Autowired
	private ServletContext context;
	
	@RequestMapping(path = "/previewTest")
	public String previewPageTest() {
		return "azaz4498/articlePreview";
	}
	@RequestMapping(path = "/preview.controller", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> articlePreview(@RequestParam(name = "artTitle")String artTitle,@RequestParam(name = "artContent")String artContent, @RequestParam(name = "artUserid")String artUserid, @RequestParam(name = "artType")String artType ) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("artTitle", artTitle);
		map.put("artContent", artContent);
		map.put("artUserid",artUserid);
		map.put("artType", artType);
		
		
		return map;
		
	}
	
	@RequestMapping(path = "/admin/Forum")
	public String ForumEntry(Model m) {
		m.addAttribute("artBean", articleService.showAllArticles());
//		return "azaz4498/F_index";
		return "azaz4498/F_JSONindex";
	}

	@RequestMapping(path = "/admin/Article.controller.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> showArticles() {
		List<Article> artList = articleService.showAllArticles();
//		Map<String, Object> map = new HashMap<>();
//		map.put("list",artList);
		return artList;

	}

	@RequestMapping(path = "/admin/artTypeSearch")
	public String DisplayByType(@RequestParam(name = "articleType") Integer typeId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticlesByType(typeId));
		m.addAttribute("typeBean", articleTypeService.showAllType());
		m.addAttribute("articleType", typeId);
		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/admin/artTypeSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> dispalyByTypeJSON(@RequestParam(name = "articleType") Integer typeId)
			throws SQLException {
		List<Article> artList = articleService.showArticlesByType(typeId);
		return artList;
	}

	@RequestMapping(path = "/admin/articleSearch")
	public String DisplayResults(@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "articleType", defaultValue = "", required = false) Integer articleType, Model m) {

		m.addAttribute("artBean", articleService.searchArticles(keyword, articleType));
		return "azaz4498/F_index";

	}

	@RequestMapping(path = "/admin/articleSearch.json", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	public @ResponseBody List<Article> DisplayJSONResults(
			@RequestParam(name = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(name = "articleType", defaultValue = "", required = false) Integer articleType) {
		List<Article> artList = articleService.searchArticles(keyword, articleType);
		return artList;

	}

	@RequestMapping(path = "/admin/editPage.controller")
	public String EditPage(@RequestParam(name = "artId") Integer articleId, Model m) throws SQLException {
		m.addAttribute("artBean", articleService.showArticleById(articleId));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/admin/newArticlePage.controller")
	public String newArticlePage() {

		return "azaz4498/newArticle_backend";
	}

	@RequestMapping(path = "/admin/edit.controller", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, @RequestParam(name = "artId") Integer articleId,
			@RequestParam(name = "userid") String userid, @RequestParam(name = "typeSelect") Integer typeId, Model m)
			throws SQLException {

		articleService.articleEdit(title, content, articleId, userid, typeId);
		m.addAttribute("artBean", articleService.showArticleById(articleId));

		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/admin/newArticle.controller", method = RequestMethod.POST)
	public String newArticleBackend(@RequestParam(name = "articleTitle") String title,
			@RequestParam(name = "articleContent") String content, 
			@RequestParam(name = "typeSelect") Integer typeId,Model m) throws SQLException {
		String userid = "Admin";
		Article article = articleService.newArticle(title, typeId, content, userid);
		Integer id = article.getArtId();
		m.addAttribute("artBean", articleService.showArticleById(id));
		return "azaz4498/editPage";
	}

	@RequestMapping(path = "/admin/delete.controller", method = RequestMethod.POST)
	public String Delete(@RequestParam(name = "artId") Integer articleId, Model m) {
		articleService.deleteArticleByAdmin(articleId);
//		ModelAndView mv = new ModelAndView("redirect:/Forum");
		return "redirect:/admin/Forum";

	}

	@RequestMapping(path = "/admin/insertJson")
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

	@RequestMapping(path = "/admin/statusChange.controller", method = RequestMethod.POST)
	public String statusChange(@RequestParam(name = "artId") Integer articleId) {
		articleService.switchStatus(articleId);

		return "redirect:/admin/Forum";
	}

	@RequestMapping(path = "/admin/imgUpload/{artId}", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> imgUpload(@RequestParam(name = "upload") MultipartFile uploadFile,
			HttpServletRequest request, @PathVariable(name = "artId") Integer articleId) throws IOException {
		Map<String, String> map = new HashMap<String, String>();

		String fileName = uploadFile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."));
		String finalFileName = UUID.randomUUID() + fileType;
		String targetUrl = "/img/azaz4498" + File.separator + finalFileName;

		String path = request.getServletContext().getRealPath(targetUrl);

		File file = new File(path);
		InputStream is = uploadFile.getInputStream();
		byte[] bytes = FileCopyUtils.copyToByteArray(is);
		uploadFile.transferTo(file);

		Picture picture = new Picture();
		picture.setPicFileName(finalFileName);
		picture.setPicUrl(path);
		picture.setPicture(bytes);
		picture.setRefId(articleId);

		Integer picId = pictureService.addPic(picture).getId();
		String imgPath = "showPic/" + picId;

		map.put("finalFileName", finalFileName);
		map.put("url", imgPath);
		map.put("uploaded", "true");
		is.close();
		return map;

	}

	@RequestMapping(path = "admin/showPic/{picId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> showImg(@PathVariable(name = "picId") Integer picId) throws IOException {
		HttpHeaders headers = new HttpHeaders();
		Picture picture = pictureService.getPic(picId);
		headers.setContentType(MediaType.IMAGE_JPEG);
		headers.setContentType(MediaType.IMAGE_PNG);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(picture.getPicture(), headers,
				HttpStatus.OK);

		return responseEntity;

	}

}
