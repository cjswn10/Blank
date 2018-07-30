package com.blank.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GrimpanController {

	@RequestMapping("/member/grimpan.do")
	public void grimpan() {

	}

	@RequestMapping(value = "grimpan2.do", produces = "text/plain;charset=utf-8", method = RequestMethod.POST)
	@ResponseBody
	public void makePngFile(String imageUrl, HttpServletRequest request) {

		// imgbase64 (imgbase64data:image/png;base64,iVBORw0KGgoAA 占쏙옙 占쏙옙占쏙옙)
		// saveFilePath (占쏙옙占쏙옙占쏙옙)
		// savename (占쏙옙占쏙옙占싱몌옙)

		System.out.println(imageUrl);
		try {
			// create a buffered image
			BufferedImage image = null;

			String[] base64Arr = imageUrl.split(","); // image/png;base64, 占쏙옙 占싸븝옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쌜억옙
			byte[] imageByte = Base64.decodeBase64(base64Arr[1]); // base64 to byte array占쏙옙 占쏙옙占쏙옙

			ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);
			bis.close();

			String path = request.getRealPath("resources/upload2");
			System.out.println(path);
			File file = new File(path);
			String savename = "seongin";
			File outputfile = new File(file + savename + ".png");
			ImageIO.write(image, "png", outputfile); // 占쏙옙占싹삼옙占쏙옙

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/*
	 * 
	 * 
	 * @RequestMapping("/canvasUpload") public String
	 * page_canvasUpload(HttpServletRequest request, ModelMap model) { return
	 * "/canv/canvasUpload"; }
	 * 
	 * @RequestMapping("/ajax_canvasIpload_proc")
	 * 
	 * @ResponseBody public String ajax_canvasUpload_proc(HttpServletRequest
	 * request, String strImg) { String uploadpath = "uploadfile\\"; String folder =
	 * request.getServletPath().getRealpath("/")+uploadpath; String fullpath ="";
	 * String []strParts = strImg.split(","); String rstStrImg = strParts[1];
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd_hhmmss"); String filenm
	 * = sdf.format(new Date().toString()+"_testimgg2.png");
	 * 
	 * BufferedImage image = null; byte[] byteImage;
	 * 
	 * BASE64Decoder decoder = new BASE64Decoder(); byteImage =
	 * decoder.decodeBuffer(rstStrImg); ByteArrayInputStream bis = new
	 * ByteArrayInputStream(byteImage); image = Image().read(bis); bis.close();
	 * 
	 * fullpath = folder+filenm; File folderObj = new File(folder);
	 * if(!folderObj.isDirectory())folderObj.mkdir(); File ouputFile = new
	 * File(fullpath); if(ouputFile.exists())ouputFile.delete();
	 * ImageIO.write(image, "png", ouputFile); return uploadpath+filenm;
	 * 
	 * }
	 */

}