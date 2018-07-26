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
	
	@RequestMapping("/member/favoritesBook.do")
	public void FavoriteBook() {
		
	}
	
	@RequestMapping("/member/listFavoriteBook.do")
	@ResponseBody
	public String listFavoriteBook(int mno) {
		Map map = new HashMap();
		map.put("mno", mno);
		String str = "";
		List<BookVo> list = dao.listFavoriteBook(map);	
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return str;
	}
	
	
	//�ϱ��� ��� ��������
	@RequestMapping("/member/book.do")
	public void list()
	{}
	
	
	//�ϱ��� ���
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
	
	//�ϱ��� �󼼺���
	@RequestMapping("/member/detailBook.do")
	public ModelAndView detailBook(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
	
	//�ϱ��� �ۼ� Form
	@RequestMapping(value="/member/insertBook.do",method=RequestMethod.GET)
	public void insertBookForm()
	{}
	
	//�ϱ��� �ۼ� Submit
	@RequestMapping(value="/member/insertBook.do",method=RequestMethod.POST)
	public ModelAndView insertBook(BookVo b,int mno)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/book.do");
		b.setBno(dao.bookNextBno());
		b.setMno(mno);
		int re = dao.insertBook(b);
		if(re<1)
		{
			mav.addObject("msg", "�ϱ��忡 �ۼ������� �Ͽ����ϴ�.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	
	//�ϱ��� ���� Form
	@RequestMapping(value="/member/updateBook.do",method=RequestMethod.GET)
	public ModelAndView updateBookForm(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
		
	//�ϱ��� ���� Submit
	@RequestMapping(value="/member/updateBook.do",method=RequestMethod.POST)
	public ModelAndView updateBook(BookVo b)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/book.do");
		int re = dao.updateBook(b);
		if(re<1)
		{
			mav.addObject("msg", "�ϱ��忡 ���������� �Ͽ����ϴ�.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	
	//�ϱ��� ����
	@RequestMapping(value="/member/deleteBook.do")
	public ModelAndView deleteBook(int bno)
	{
		ModelAndView mav = new ModelAndView("redirect:/member/book.do");
		Map map = new HashMap();
		map.put("bno", bno);
		int re = dao.deleteBook(map);
		if(re<1)
		{
			mav.addObject("msg", "�ϱ��� ���������� �Ͽ����ϴ�.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
}	
