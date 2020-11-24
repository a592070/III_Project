package azaz4498.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class UploadController {
	@RequestMapping(value = {"upload/","upload"} , method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> uploadAdmin(@RequestParam("upload") MultipartFile file){
		System.out.println("Handling image file upload-----"+"filename= "+file.getName()+"  originName= "+file.getOriginalFilename()+"  size= "+file.getSize());
		if (file.isEmpty()) {
			System.out.println("error");
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("uploaded", "1");
		map.put("url", "圖片url");
		return map;
	}
	
}
