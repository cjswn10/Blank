
package com.blank.controller;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import com.blank.vo.LogVo;
import com.blank.vo.MemberVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberDao dao;

	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	

	//筌띾뜆�뵠占쎈읂占쎌뵠筌욑옙
	@RequestMapping(value="/member/myPage.do")
	public ModelAndView myPage() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	

	//�④쑴�젟筌≪뼐由�
	@RequestMapping(value="search.do")
	public ModelAndView search() {
			
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	


	//id筌≪뼐由�
	@RequestMapping(value="searchIdPage.do")
	public ModelAndView searchId() {
				
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//�뜮袁⑨옙甕곕뜇�깈 筌≪뼐由�
	@RequestMapping(value="searchPwdPage.do")
	public ModelAndView searchPwd() {
					
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	//占쎈툡占쎌뵠占쎈탵 筌≪뼐由�
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
	
	//�뜮袁⑨옙甕곕뜇�깈 筌≪뼐由�
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
	
	//�눧紐꾩벥占쎄텢占쎈퉮(contact)
	@RequestMapping(value="/member/qNa.do")
	public ModelAndView Qna() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}


	//嚥≪뮄�젃占쎈툡占쎌뜍
	@RequestMapping(value="/member/logOut.do")
	public ModelAndView logOut(HttpSession session,LogVo l,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			InetAddress addr = InetAddress.getLocalHost();
			String ip = addr.getHostAddress();
			
			l.setIp(ip);
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		String id = request.getParameter("id");
		
		l.setId("["+id+"] 님이 로그아웃 하였습니다.");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");

		Calendar today = Calendar.getInstance();
		
		String todays = format.format(today.getTime());
		
		l.setLdate(todays);
		
		int re = dao.logRecord(l);
		if(re > 0)
		{
			mav.addObject("msg", "성공");
			mav.setViewName("redirect:/member/main.do");
		}
		else
		{
			mav.addObject("msg", "실패");
			mav.setViewName("error");
		}
		session.invalidate();
		mav.setViewName("redirect:/login.do");
		return mav;
	}
	

	//占쎌돳占쎌뜚揶쏉옙占쎌뿯
	@RequestMapping(value="join.do", method=RequestMethod.GET)	
	public void joinForm() {
		
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView joinSubmit(MemberVo mv) {
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		mv.setMno(dao.memberNextMno());
		int re = dao.memberInsert(mv);
		if (re < 1) {

			mav.addObject("msg", "占쎌돳占쎌뜚 揶쏉옙占쎌뿯 占쎈뼄占쎈솭");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	

	//占쎈툡占쎌뵠占쎈탵 餓λ쵎�궗占쎌넇占쎌뵥
	@RequestMapping(value="checkId.do")
	@ResponseBody
	public String checkId(@RequestParam("id")String id) {
		
		Map map = new HashMap();
		map.put("id", id);
		int rowcount = dao.memberCheckId(map);
        return String.valueOf(rowcount);

	
	}
	
	@RequestMapping(value="/member/checkId2.do")
	@ResponseBody
	public String checkId2(@RequestParam("id")String id,HttpSession session) {
		
		Map map = new HashMap();
		map.put("id", id);
		int rowcount = dao.memberCheckId(map);
        return String.valueOf(rowcount);
        
	
	}
	

	//嚥≪뮄�젃占쎌뵥
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public void loginForm() {
		
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView login(String id, String pwd, HttpSession session,LogVo l) {
		ModelAndView mav = new ModelAndView();
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		
		Boolean r = dao.login(map);
		if (r == true) {

			//id, 占쎌돳占쎌뜚甕곕뜇�깈 占쎄쉭占쎈�� 占쎄문占쎄쉐
			session.setAttribute("id", id);
			session.setAttribute("mno", dao.mno(map));
			mav.setViewName("redirect:/member/main.do");
		}
		try {
			
			InetAddress addr = InetAddress.getLocalHost();
			String ip = addr.getHostAddress();
			
			l.setIp(ip);
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		l.setId("["+id+"] 님이 로그인 하였습니다.");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");

		Calendar today = Calendar.getInstance();
		
		String todays = format.format(today.getTime());
		
		l.setLdate(todays);
		
		int re = dao.logRecord(l);
		if(re > 0)
		{
			mav.addObject("msg", "성공");
			mav.setViewName("redirect:/member/main.do");
		}
		else
		{
			mav.addObject("msg", "실패");
			mav.setViewName("error");
		}
		
		//mav.setViewName("redirect:/member/main.do");
		return mav;
	}

	//占쎌돳占쎌뜚占쎌젟癰귨옙 占쎈땾占쎌젟 占쎈뻻 �뜮袁⑨옙甕곕뜇�깈 占쎌넇占쎌뵥
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

			mav.addObject("msg", "�뜮袁⑨옙甕곕뜇�깈揶쏉옙 占쎌뵬燁살꼹釉�筌욑옙 占쎈륫占쎈뮸占쎈빍占쎈뼄.");
		}	
		
		return mav;
	}
	

	//占쎌돳占쎌뜚占쎌젟癰귨옙 占쎈땾占쎌젟
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.GET)
	public void memberUpdateForm() {
		
	}
	
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVo mv) {
		
		ModelAndView mav = new ModelAndView("redirect:/member/myPage.do");
		
		int re = dao.updateMember(mv);
		if (re < 1) {
			mav.addObject("msg", "占쎌돳占쎌뜚占쎌젟癰귨옙 占쎈땾占쎌젟 占쎈뼄占쎈솭");
			mav.setViewName("/member/error");
		}
		
		return mav;
	}
	
	//占쎈툡占쎌뵠占쎈탵 野껓옙占쎄퉳(燁살뮄�럡占쎌뵬疫꿸퀣�삢)
	@RequestMapping(value="/member/mainSearchId.do",produces="text/plain;charset=utf-8")
	@ResponseBody
	public String mainSearchId(String id,HttpSession session)
	{
		Map map = new HashMap();
		map.put("id", id);
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
	
	//占쎌돳占쎌뜚甕곕뜇�깈嚥∽옙 id占쎈르占쎈툡占쎄땀疫뀐옙
	@RequestMapping(value="/member/getId.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getIdByMno(int mno) {
		Map map = new HashMap();
		map.put("mno", mno);
		String id = dao.getMember(map).getId();
		return id;
	}
}

