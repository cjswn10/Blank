package com.blank.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GrimpanController {

	@RequestMapping("/member/grimpan.do")
	public void grimpan() {
		
	}
	
	
	@RequestMapping(value="/grimpan2.do",produces="text/plain;charset=utf-8",method=RequestMethod.POST)
	@ResponseBody
	public void makePngFile(String imageUrl,HttpServletRequest request){
		/**
		 * imgbase64 (imgbase64data:image/png;base64,iVBORw0KGgoAA 로 시작)
		 * saveFilePath (저장경로)
		 * savename (파일이름)
		 */ 
		try {
			// create a buffered image
			BufferedImage image = null;
			
			String[] base64Arr = imageUrl.split(","); // image/png;base64, 이 부분 버리기 위한 작업
			byte[] imageByte = Base64.decodeBase64(base64Arr[1]); // base64 to byte array로 변경
			
			ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);
			bis.close();
			
			
			String path = request.getRealPath("resources/upload2");
			File file = new File(path);
			String savename = "seongin";
			File outputfile = new File(file+ savename + ".png");
			ImageIO.write(image, "png", outputfile); // 파일생성
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}