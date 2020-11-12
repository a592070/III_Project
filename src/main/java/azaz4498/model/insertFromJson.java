package azaz4498.model;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

public class insertFromJson {

	public static void main(String[] args) throws IOException {
		ObjectMapper objectMapper=new ObjectMapper();
		objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
		
		List<Object> list= Arrays.asList(objectMapper.readValue(Paths.get("C://Users/Student/Desktop/pyWorkspace/data.json").toFile(),Object.class));
		list.forEach(System.out::println);
	}

}
