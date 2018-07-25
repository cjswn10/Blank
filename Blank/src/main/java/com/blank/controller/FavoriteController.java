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
	@RequestMapping("/member/favorite.do")
	public void listview()
	{
		
	}
	
	@RequestMapping(value="/member/listFavorite.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String list(int mno)
	{
		Map map = new HashMap();
		map.put("mno", mno);
		String str = "";
		System.out.println("컨트롤러"+dao.list(map));
		ObjectMapper mapper = new ObjectMapper();
		try {
		str = mapper.writeValueAsString(dao.list(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
		
	}
	@RequestMapping("member/deleteFavorite.do")
	@ResponseBody
	public ModelAndView delete(int fno)
	{
		Map map = new HashMap();
		map.put("fno", fno);
		
		ModelAndView mav = new ModelAndView("redirect:/member/favorite.do");
		int re = dao.delete(map);
		if(re<1)
		{
			mav.addObject("msg", "삭제하였습니다.");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	
}
