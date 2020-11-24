package azaz4498.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


public class UploadController {
	private HttpServletRequest request;
	@ResponseBody
	@RequestMapping(value = "/uploadId")
	public ResponseEntity<byte[]> uploadOneFile(MultipartFile multipartFile) throws IOException {
	 System.out.println("getOriginalFileName:"+ multipartFile.getOriginalFilename());
	 
	 System.out.println("getName:"+multipartFile.getName());
	 HttpHeaders headers = new HttpHeaders();
	 headers.setContentType(MediaType.IMAGE_JPEG);
	 String savePathString = request.getSession().getServletContext().getRealPath("/")+"uploadTempDir/" +multipartFile.getOriginalFilename();
	 File saveFile = new File(savePathString);
	 multipartFile.transferTo(saveFile);
	 return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(saveFile),headers,HttpStatus.OK);
 }
}
