package azaz4498.model;

import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class insertFromJson {

	public static void main(String[] args) throws IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(new File("D:/Lab2Workspace/data.json"));
		java.util.List<String>  titles = node.findValuesAsText("art_title");
		java.util.List<String>  types = node.findValuesAsText("art_type");
		for (int i = 0; i <titles.size(); i++) {
			ArticleDAO articleDAO = new ArticleDAO();
			
			
			articleDAO.newArticle(titles.get(i), typeId, content, userId);
			System.out.println(types.get(i));
			System.out.println(titles.get(i));
		}
		}
			
		
	}
