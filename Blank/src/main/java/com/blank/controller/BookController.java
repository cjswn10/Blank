package com.blank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.BookDao;
import com.blank.vo.BookVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BookController {

	@Autowired
	private BookDao dao;

	public void setDao(BookDao dao) {
		this.dao = dao;
	}
	
	//일기장 목록 뷰페이지
	@RequestMapping("listBooka.do")
	public void list()
	{}
	
	//일기장 목록
	@RequestMapping(value="listBook.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listBook()
	{
		String str = "";
		List<BookVo> list = dao.listBook();
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return str;
	}
	
	//일기장 상세보기
	@RequestMapping("detailBook.do")
	public ModelAndView detailBook(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
	
	//일기장 작성 Form
	@RequestMapping(value="insertBook.do",method=RequestMethod.GET)
	public void insertBookForm()
	{}
	
	//일기장 작성 Submit
	@RequestMapping(value="insertBook.do",method=RequestMethod.POST)
	public ModelAndView insertBook(BookVo b)
	{
		ModelAndView mav = new ModelAndView("redirect:/listBooka.do");
		b.setBno(dao.bookNextBno());
		int re = dao.insertBook(b);
		if(re<1)
		{
			mav.addObject("msg", "일기장에 작성에실패 하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	//일기장 수정 Form
	@RequestMapping(value="updateBook.do",method=RequestMethod.GET)
	public ModelAndView updateBookForm(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
		
	//일기장 수정 Submit
	@RequestMapping(value="updateBook.do",method=RequestMethod.POST)
	public ModelAndView updateBook(BookVo b)
	{
		ModelAndView mav = new ModelAndView("redirect:/listBook.do");
		int re = dao.updateBook(b);
		if(re<1)
		{
			mav.addObject("msg", "일기장에 수정에실패 하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	//일기장 삭제
	@RequestMapping(value="deleteBook.do")
	public ModelAndView deleteBook(int bno)
	{
		ModelAndView mav = new ModelAndView("redirect:/listBooka.do");
		Map map = new HashMap();
		map.put("bno", bno);
		int re = dao.deleteBook(map);
		if(re<1)
		{
			mav.addObject("msg", "일기장 삭제에실패 하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
}	
