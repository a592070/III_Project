package azaz4498.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import azaz4498.model.Picture;
import azaz4498.service.ArticleService;
import azaz4498.service.ArticleTypeService;
import azaz4498.service.PictureService;

@Controller
@Lazy
@SessionAttributes(names = { "artBean", "typeBean" })
public class ImageUploadController {
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

	

	@RequestMapping(value = { "/admin/imgUpload/{artId}", "/admin/imgUpload","/imgUpload/{artId}", "/imgUpload" }, method = RequestMethod.POST)
	public @ResponseBody Map<String, String> imgUpload(@RequestParam(name = "upload") MultipartFile uploadFile,
			HttpServletRequest request, @PathVariable(name = "artId", required = false) Integer articleId)
			throws IOException {
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

	@RequestMapping(value =  {"admin/showPic/{picId}","showPic/{picId}"}, method = RequestMethod.GET)
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
