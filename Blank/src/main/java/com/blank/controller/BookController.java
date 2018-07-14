package com.blank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.BookDao;
import com.blank.vo.BookVo;

@Controller
public class BookController {

	@Autowired
	private BookDao dao;

	public void setDao(BookDao dao) {
		this.dao = dao;
	}
	
	//�ϱ��� ���
	@RequestMapping("listBook.do")
	public ModelAndView listBook()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listBook());
		return mav;
	}
	
	//�ϱ��� �󼼺���
	@RequestMapping("detailBook.do")
	public ModelAndView detailBook(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
	
	//�ϱ��� �ۼ� Form
	@RequestMapping(value="insertBook.do",method=RequestMethod.GET)
	public void insertBookForm()
	{}
	
	//�ϱ��� �ۼ� Submit
	@RequestMapping(value="insertBook.do",method=RequestMethod.POST)
	public ModelAndView insertBook(BookVo b)
	{
		ModelAndView mav = new ModelAndView("redirect:/listBook.do");
		b.setBno(dao.bookNextBno());
		int re = dao.insertBook(b);
		if(re<1)
		{
			mav.addObject("msg", "�ϱ��忡 �ۼ������� �Ͽ����ϴ�.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	//�ϱ��� ���� Form
	@RequestMapping(value="updateBook.do",method=RequestMethod.GET)
	public ModelAndView updateBookForm(int bno)
	{
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("bno", bno);
		mav.addObject("b", dao.detailBook(map));
		return mav;
	}
		
	//�ϱ��� ���� Submit
	@RequestMapping(value="updateBook.do",method=RequestMethod.POST)
	public ModelAndView updateBook(BookVo b)
	{
		ModelAndView mav = new ModelAndView("redirect:/listBook.do");
		int re = dao.updateBook(b);
		if(re<1)
		{
			mav.addObject("msg", "�ϱ��忡 ���������� �Ͽ����ϴ�.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	//�ϱ��� ����
	@RequestMapping("deleteBook.do")
	public ModelAndView deleteBook(int bno)
	{
		ModelAndView mav = new ModelAndView("redirect:/listBook.do");
		Map map = new HashMap();
		map.put("bno", bno);
		int re = dao.deleteBook(map);
		if(re<1)
		{
			mav.addObject("msg", "�ϱ��忡 ���������� �Ͽ����ϴ�.");
			mav.setViewName("error");
		}
		return mav;
	}
}	
