package com.blank.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.DiaryDao;
import com.blank.vo.DiaryVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class DiaryController {

	@Autowired
	private DiaryDao dao;

	public void setDao(DiaryDao dao) {
		this.dao = dao;
	}
/*
 * 다이어리 주의사항
 * dtype은 그림글사진(db순서) 순서로 있으면1 없으면 0 
 * ex)그림:O 글:O 사진:X 	=> dtype="110"
 */
	
	
	//일기 삭제
	@RequestMapping("deleteDiary.do")
	public ModelAndView deleteDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView("redirect:/diary.do");
		int re = dao.deleteDiary(map);
		if (re < 1) {
			mav.addObject("msg", "삭제 실패");
		}
		return mav;
	}
	
	//일기 수정 폼
	@RequestMapping(value="updateDiary.do", method=RequestMethod.GET)
	public ModelAndView diaryUpdateForm(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	//일기 수정 실행
	@RequestMapping(value="updateDiary.do", method=RequestMethod.POST)
	public ModelAndView diaryUpdateSubmit(DiaryVo d) {
		/*Map map = new HashMap();
		map.put("d", d);*/
		ModelAndView mav = new ModelAndView();
		int re = dao.updateDiary(d);
		if (re > 0) {
			mav.setViewName("redirect:/listDiary.do");
		}else {
			mav.addObject("msg", "일기  수정 실패");
			mav.setViewName("error");			
		}		
		return mav;				
	}
	
	//일기 상세
	@RequestMapping("detailDiary.do")
	public ModelAndView detailDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	//일기 등록 폼
	@RequestMapping(value="insertDiary.do", method=RequestMethod.GET)
	public void diaryInsertForm() {
		
	}
	
		//일기 등록 실행
	@RequestMapping(value="insertDiary.do",  method=RequestMethod.POST)
	public ModelAndView diaryInsertSubmit(DiaryVo d, HttpServletRequest request) {
		//int mno = Integer.parseInt(request.getParameter("mno"));
		//int bno = Integer.parseInt(request.getParameter("bno"));
		int mno = 1000;
		int bno = 2;
		
		d.setMno(mno);
		d.setBno(bno);
		
		d.setDtype("000");
		//타입 값 넣기
		if(d.getDfile() != null) {
			d.setDtype("100");
		}
		//trim 넣기
		if(d.getDcontent() != null) {
			d.setDtype(d.getDtype().substring(0, 1) + "1" + d.getDtype().substring(2));
		}
		
		d.setDphoto("");
		
		String path = request.getRealPath("resources/upload");
		System.out.println(path);
		
		MultipartFile upload = d.getUpload();
		String dphoto = upload.getOriginalFilename();
		if (dphoto != null && !dphoto.equals("")) {
			d.setDphoto(dphoto);
			d.setDtype(d.getDtype().substring(0, 2) + "1");
			try {
				byte[]data = upload.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + dphoto);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int no = dao.diaryNextNo();
		d.setDno(no);
		
		Map map = new HashMap();
		map.put("dno", d.getDno());
		map.put("dtitle", d.getDtitle());
		map.put("ddate", d.getDdate());
		map.put("dweather", d.getDweather());
		map.put("dfont", d.getDfont());
		map.put("dtype", d.getDtype());
		map.put("dfile", d.getDfile());
		map.put("dcontent", d.getDcontent());
		map.put("dphoto", d.getDphoto());
		map.put("secret", d.getSecret());
		map.put("mno", d.getMno());
		map.put("bno", d.getBno());
		
		ModelAndView mav = new ModelAndView("redirect:/diary.do");

		int re = dao.insertDiary(map);
		if (re < 1) {
			mav.addObject("msg", "일기 등록 실패");
			mav.setViewName("error");
		}	
		
		return mav;				
	}
	
	@RequestMapping("diary.do")
	public void diary() {
		
	}
	
	//일기 목록
	@RequestMapping(value="listDiary.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listDiary(int bno, HttpSession session) {		
		Map map = new HashMap();
		map.put("bno", bno);
		
		session.setAttribute("bno", bno);
		
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.listDiary(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
}

