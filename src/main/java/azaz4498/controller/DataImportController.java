package azaz4498.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;

@Controller
@Lazy
public class DataImportController {
	@Autowired
	ArticleService articleService;
	@Autowired
	ArticleTypeService articleTypeService;

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
}
