package com.blank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.MainDao;

@Controller
public class MainController {

	@Autowired
	private MainDao dao;

	public void setDao(MainDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView list()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",dao.list());
		return mav;
	}
	
	
}
