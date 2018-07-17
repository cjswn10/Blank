package com.blank.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.DiaryDao;
import com.blank.vo.DiaryVo;

@Controller
public class DiaryController {

	@Autowired
	private DiaryDao dao;

	public void setDao(DiaryDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("deleteDiary.do")
	public ModelAndView deleteDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView("redirect:/listDiary.do");
		int re = dao.deleteDiary(map);
		if (re < 1) {
			mav.addObject("msg", "삭제 실패");
		}
		return mav;
	}
	
	@RequestMapping(value="updateDiary.do", method=RequestMethod.GET)
	public ModelAndView diaryUpdateForm(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
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
	
	@RequestMapping("detailDiary.do")
	public ModelAndView detailDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	@RequestMapping(value="insertDiary.do", method=RequestMethod.GET)
	public void diaryInsertForm() {
		
	}
	
	@RequestMapping(value="insertDiary.do",  method=RequestMethod.POST)
	public ModelAndView diaryInsertSubmit(DiaryVo d, HttpServletRequest request) {
		d.setDfile("");
		String path = request.getRealPath("resources/upload");
		System.out.println(path);
		
		MultipartFile upload = d.getUpload();
		String dfile = upload.getOriginalFilename();
		if (dfile != null && !dfile.equals("")) {
			d.setDfile(dfile);
			try {
				byte[]data = upload.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + dfile);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int no = dao.diaryNextNo();
		d.setDno(no);
		ModelAndView mav = new ModelAndView("redirect:/listDiary.do");
		int re = dao.insertDiary(d);
		if (re < 1) {
			mav.addObject("msg", "일기 등록 실패");
			mav.setViewName("error");
		}	
		
		return mav;				
	}
	
	@RequestMapping("listDiary.do")
	public ModelAndView listDiary() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listDiary());
		return mav;
	}
}
