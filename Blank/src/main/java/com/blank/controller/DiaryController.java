package com.blank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		ModelAndView mav = new ModelAndView("redirect:/listDiary.do");
		int re = dao.updateDiary(d);
		if (re < 1) {
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
	public ModelAndView diaryInsertSubmit(DiaryVo d) {
		int no = dao.diaryNextNo();
		d.setDno(no);
		/*Map map = new HashMap();
		map.put("d", d);*/
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
