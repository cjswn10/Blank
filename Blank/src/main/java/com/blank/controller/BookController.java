package com.blank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.BookDao;
import com.blank.vo.BookVo;
import com.blank.vo.MemberVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BookController {

	@Autowired
	private BookDao dao;

	public void setDao(BookDao dao) {
		this.dao = dao;
	}
	
		
	//book.jsp
	@RequestMapping("/member/book.do")
	public void list()
	{}
	
	
	//listBook
	@RequestMapping(value="/member/listBook.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listBook(int mno)
	{
		
		Map map = new HashMap();
		map.put("mno", mno);
		String str = "";
		List<BookVo> list = dao.listBook(map);	
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return str;
	}
	
	//detailBook
	@RequestMapping("/member/detailBook.do")
	public ModelAndView detailBook(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
	
	//insertBook(GET)
	@RequestMapping(value="/member/insertBook.do",method=RequestMethod.GET)
	public void insertBookForm()
	{}
	
	//insertBook(POST)
	@RequestMapping(value="/member/insertBook.do",method=RequestMethod.POST)
	public ModelAndView insertBook(BookVo b,int mno)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/book.do");
		b.setBno(dao.bookNextBno());
		b.setMno(mno);
		int re = dao.insertBook(b);
		if(re<1)
		{
			mav.addObject("msg", "占싹깍옙占썲에 占쌜쇽옙占쏙옙占쏙옙占쏙옙 占싹울옙占쏙옙占싹댐옙.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	
	//updateBook(GET)
	@RequestMapping(value="/member/updateBook.do",method=RequestMethod.GET)
	public ModelAndView updateBookForm(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
		
	//updateBook(POST)
	@RequestMapping(value="/member/updateBook.do",method=RequestMethod.POST)
	public ModelAndView updateBook(BookVo b)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/book.do");
		int re = dao.updateBook(b);
		if(re<1)
		{
			mav.addObject("msg", "占싹깍옙占썲에 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싹울옙占쏙옙占싹댐옙.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	
	//deleteBook
	@RequestMapping(value="/member/deleteBook.do")
	public ModelAndView deleteBook(int bno)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/book.do");
		Map map = new HashMap();
		map.put("bno", bno);
		int re = dao.deleteBook(map);
		if(re<1)
		{
			mav.addObject("msg", "占싹깍옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싹울옙占쏙옙占싹댐옙.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
}	
