package com.bit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.dao.MemberDao;
import com.bit.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.GET)	
	public void joinForm() {
		
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView joinSubmit(MemberVo mv) {
		ModelAndView mav = new ModelAndView();
		int re = dao.memberInsert(mv);
		if (re < 1) {
			mav.addObject("msg", "회원 가입 실패");
			mav.setViewName("error");
		}
		return mav;
	}
	@RequestMapping("checkId.do")
	public ModelAndView checkId(String id) {
		ModelAndView mav = new ModelAndView();		
		Map map = new HashMap();
		map.put("id", id);
		mav.addObject("m", dao.memberCheckId(map));
		
		return mav;
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public void loginForm() {
		
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView login(String id, String pwd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		Boolean r = dao.login(map);
		if (r == true) {
			session.setAttribute("id", id);
			mav.setViewName("redirect:/main.do");
		}
		return mav;
	}	
}
