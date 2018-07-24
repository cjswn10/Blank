package com.blank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.FavoriteDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FavoriteController {
	@Autowired
	private FavoriteDao dao;

	public void setDao(FavoriteDao dao) {
		this.dao = dao;
	}
	@RequestMapping("/favorite.do")
	public void listview()
	{
		
	}
	
	@RequestMapping("/listFavorite.do")
	@ResponseBody
	public String list(int mno)
	{
		Map map = new HashMap();
		map.put("mno", mno);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
		str = mapper.writeValueAsString(dao.list(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
		
		
		
		
	}
	
}
