
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


	//마이페이지
	@RequestMapping(value="/member/myPage.do")
	public ModelAndView myPage() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	

	//계정찾기
	@RequestMapping(value="search.do")
	public ModelAndView search() {
			
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	

	//id찾기
	@RequestMapping(value="searchIdPage.do")
	public ModelAndView searchId() {
				
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//비밀번호 찾기
	@RequestMapping(value="searchPwdPage.do")
	public ModelAndView searchPwd() {
					
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	//아이디 찾기
	@RequestMapping(value="searchId.do")
	@ResponseBody
	public String searchId(String name,String phone)
	{
		Map map = new HashMap();
		map.put("name", name);
		map.put("phone", phone);
		String str = "";
		String id = dao.searchId(map);
		if(id != null)
		{
			str = id;
		}
		else
		{
			str = "";
		}	
		return str;
	}
	
	//비밀번호 찾기
	@RequestMapping(value="searchPwd.do")
	@ResponseBody
	public String searchPwd(String id,String phone)
	{
		Map map = new HashMap();
		map.put("id", id);
		map.put("phone", phone);
		String str = "";
		String pwd = dao.searchPwd(map);
		if(pwd != null)
		{
			str = pwd;
		}
		else
		{
			str = "";
		}	
		return str;
	}
	
	//문의사항(contact)
	@RequestMapping(value="/member/qNa.do")
	public ModelAndView Qna() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	//로그아웃
	@RequestMapping(value="/member/logOut.do")
	public ModelAndView logOut(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/login.do");
		return mav;
	}
	

	//회원가입
	@RequestMapping(value="join.do", method=RequestMethod.GET)	
	public void joinForm() {
		
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView joinSubmit(MemberVo mv) {
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		mv.setMno(dao.memberNextMno());
		int re = dao.memberInsert(mv);
		if (re < 1) {

			mav.addObject("msg", "회원 가입 실패");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	
	//아이디 중복확인
	@RequestMapping(value="checkId.do")
	@ResponseBody
	public String checkId(@RequestParam("id")String id) {
		
		Map map = new HashMap();
		map.put("id", id);
		int rowcount = dao.memberCheckId(map);
        return String.valueOf(rowcount);

	
	}
	

	//로그인
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
			//id, 회원번호 세션 생성
			session.setAttribute("id", id);
			session.setAttribute("mno", dao.mno(map));
			mav.setViewName("redirect:/member/main.do");
		}

		//mav.setViewName("redirect:/member/main.do");
		return mav;
	}

	
	//회원정보 수정 시 비밀번호 확인
	@RequestMapping(value="/member/pwdCheck.do", method=RequestMethod.GET)
	public void pwdCheckForm() {
		
	}
	
	
	@RequestMapping(value="/member/pwdCheck.do", method=RequestMethod.POST)
	public ModelAndView pwdCheck(String id, String pwd,int mno) {
		ModelAndView mav = new ModelAndView();
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("mno", mno);
		Boolean r = dao.login(map);
		if (r == true) {
			mav.setViewName("/member/updateMember");
			mav.addObject("m", dao.getMember(map));
		}
		else
		{

			mav.addObject("msg", "비밀번호가 일치하지 않습니다.");
		}	
		
		return mav;
	}
	
	//회원정보 수정
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.GET)
	public void memberUpdateForm() {
		
	}
	
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVo mv) {
		
		ModelAndView mav = new ModelAndView("redirect:/member/myPage.do");
		
		int re = dao.updateMember(mv);
		if (re < 1) {
			mav.addObject("msg", "회원정보 수정 실패");
			mav.setViewName("/member/error");
		}
		
		return mav;
	}
	
	//아이디 검색(친구일기장)
	@RequestMapping(value="/member/mainSearchId.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String mainSearchId(String id,HttpSession session)
	{
		Map map = new HashMap();
		map.put("id", id);
		//session.setAttribute("serchMno", dao.mno(map));
		String str = "";
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			if(id != "")
			{
				str = mapper.writeValueAsString(dao.mainSearchId(map)); 
			}
			else
			{
				str = "";
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
			
		return str;
	}
	

	
}

