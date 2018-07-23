package com.blank.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.MemberDao;
import com.blank.vo.MemberVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	//���ã��
	@RequestMapping(value="favorite.do")
	public ModelAndView favorite()
	{
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//����������
	@RequestMapping(value="myPage.do")
	public ModelAndView myPage() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//Q&A
	@RequestMapping(value="qNa.do")
	public ModelAndView Qna() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//�α׾ƿ�
	@RequestMapping(value="logOut.do")
	public ModelAndView logOut(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/login.do");
		return mav;
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.GET)	
	public void joinForm() {
		
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView joinSubmit(MemberVo mv) {
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		mv.setMno(dao.memberNextMno());
		int re = dao.memberInsert(mv);
		if (re < 1) {
			mav.addObject("msg", "ȸ�� ���� ����");
			mav.setViewName("error");
			System.out.println("error");
		}
		return mav;
	}
	
	//���̵��ߺ�üũ
	@RequestMapping(value="checkId.do")
	@ResponseBody
	public String checkId(@RequestParam("id")String id) {
		
		Map map = new HashMap();
		map.put("id", id);
		int rowcount = dao.memberCheckId(map);
        return String.valueOf(rowcount);

	
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public void loginForm() {
		
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView login(String id, String pwd, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(id);
		System.out.println(pwd);
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		Boolean r = dao.login(map);
		if (r == true) {
			
			//���̵� ��������
			session.setAttribute("id", id);
			
			//ȸ����ȣ ��������
			session.setAttribute("mno", dao.mno(map));
//			mav.setViewName("redirect:/main.do");
			//�ϴ� ����ƴϿ��� �α��� �ǰ� �س����Կ�
		}
		System.out.println("----------------------------------------main");
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}	
	
	//��й�ȣ ����
	@RequestMapping(value="pwdCheck.do", method=RequestMethod.GET)
	public void pwdCheckForm() {
		
	}
	
	@RequestMapping(value="pwdCheck.do", method=RequestMethod.POST)
	public ModelAndView pwdCheck(String id, String pwd,int mno) {
		ModelAndView mav = new ModelAndView();
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("mno", mno);
		Boolean r = dao.login(map);
		if (r == true) {
			mav.setViewName("updateMember");
			mav.addObject("m", dao.getMember(map));
		}
		else
		{
			mav.addObject("msg", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}	
		
		return mav;
	}
	
	//ȸ������ ����
	@RequestMapping(value="updateMember.do", method=RequestMethod.GET)
	public void memberUpdateForm() {
		
	}
	
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVo mv) {
		
		ModelAndView mav = new ModelAndView("redirect:/myPage.do");
		
		int re = dao.updateMember(mv);
		if (re < 1) {
			mav.addObject("msg", "ȸ������ ���� ����");
			mav.setViewName("error");
		}
		
		return mav;
	}
	
}
