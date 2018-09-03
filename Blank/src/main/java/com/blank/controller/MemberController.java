
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

	

	//嶺뚮씭�쐠占쎈턄�뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕
	@RequestMapping(value="/member/myPage.do")
	public ModelAndView myPage() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	

	//占썩몿�뫒占쎌젧嶺뚢돦堉먪뵳占�
	@RequestMapping(value="search.do")
	public ModelAndView search() {
			
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	


	//id嶺뚢돦堉먪뵳占�
	@RequestMapping(value="searchIdPage.do")
	public ModelAndView searchId() {
				
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//占쎈쑏熬곣뫅�삕�뵓怨뺣쐡占쎄퉰 嶺뚢돦堉먪뵳占�
	@RequestMapping(value="searchPwdPage.do")
	public ModelAndView searchPwd() {
					
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	//�뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏 嶺뚢돦堉먪뵳占�
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
	
	//占쎈쑏熬곣뫅�삕�뵓怨뺣쐡占쎄퉰 嶺뚢돦堉먪뵳占�
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
	
	//占쎈닱筌뤾쑴踰ε뜝�럡�뀬�뜝�럥�돫(contact)
	@RequestMapping(value="/member/qNa.do")
	public ModelAndView Qna() {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}


	//�슖�돦裕꾬옙�쟽�뜝�럥�닡�뜝�럩�쐨
	@RequestMapping(value="/member/logOut.do")
	public ModelAndView logOut(HttpSession session,LogVo l,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		try {
			
			String ip = request.getHeader("X-FORWARDED-FOR");
			//System.out.println("TEST : X-FORWARDED-FOR : "+ip);

			if (ip == null) {

				ip = request.getHeader("Proxy-Client-IP");
				//System.out.println("TEST : Proxy-Client-IP : "+ip);

			}

			if (ip == null) {

				ip = request.getHeader("WL-Proxy-Client-IP");
				//System.out.println("TEST : WL-Proxy-Client-IP : "+ip);

			}

			if (ip == null) {

				ip = request.getHeader("HTTP_CLIENT_IP");
				//System.out.println("TEST : HTTP_CLIENT_IP : "+ip);

			}

			if (ip == null) {

				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
				//System.out.println("TEST : HTTP_X_FORWARDED_FOR : "+ip);

			}

			if (ip == null) {

				ip = request.getRemoteAddr();

			}
			
			l.setIp(ip);
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		String id = request.getParameter("id");
		
		l.setId(id);
		l.setRecord("로그아웃");
		
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
	

	//�뜝�럩�뤂�뜝�럩�쐸�뤆�룊�삕�뜝�럩肉�
	@RequestMapping(value="join.do", method=RequestMethod.GET)	
	public void joinForm() {
		
	}
	
	@RequestMapping(value="join.do", method=RequestMethod.POST)
	public ModelAndView joinSubmit(MemberVo mv) {
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		mv.setMno(dao.memberNextMno());
		int re = dao.memberInsert(mv);
		if (re < 1) {

			mav.addObject("msg", "�뜝�럩�뤂�뜝�럩�쐸 �뤆�룊�삕�뜝�럩肉� �뜝�럥堉꾢뜝�럥�넮");
			mav.setViewName("/member/error");
		}
		return mav;
	}
	

	//�뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏 繞벿살탮占쎄텢�뜝�럩�꼪�뜝�럩逾�
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
	

	//�슖�돦裕꾬옙�쟽�뜝�럩逾�
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public void loginForm() {
		
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView login(String id, String pwd, HttpSession session,LogVo l,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwd", pwd);
		
		Boolean r = dao.login(map);
		if (r == true) {

			//id, mno 세션생성
			session.setAttribute("id", id);
			session.setAttribute("mno", dao.mno(map));
			mav.setViewName("redirect:/member/main.do");
		}
		try {
			
			String ip = request.getHeader("X-FORWARDED-FOR");
			//System.out.println("TEST : X-FORWARDED-FOR : "+ip);

			if (ip == null) {

				ip = request.getHeader("Proxy-Client-IP");
				//System.out.println("TEST : Proxy-Client-IP : "+ip);

			}

			if (ip == null) {

				ip = request.getHeader("WL-Proxy-Client-IP");
				//System.out.println("TEST : WL-Proxy-Client-IP : "+ip);

			}

			if (ip == null) {

				ip = request.getHeader("HTTP_CLIENT_IP");
				//System.out.println("TEST : HTTP_CLIENT_IP : "+ip);

			}

			if (ip == null) {

				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
				//System.out.println("TEST : HTTP_X_FORWARDED_FOR : "+ip);

			}

			if (ip == null) {

				ip = request.getRemoteAddr();

			}
			
			l.setIp(ip);
			     
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
		l.setId(id);
		l.setRecord("로그인");
		
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
		
		//로그인 하고 3시간5분 동안 페이지를 이동하지않으면 세션 삭제(즉, 자동 로그아웃)
		session.setMaxInactiveInterval(185*60);
		
		return mav;
	}

	//�뜝�럩�뤂�뜝�럩�쐸�뜝�럩�젧�솻洹⑥삕 �뜝�럥�빢�뜝�럩�젧 �뜝�럥六� 占쎈쑏熬곣뫅�삕�뵓怨뺣쐡占쎄퉰 �뜝�럩�꼪�뜝�럩逾�
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

			mav.addObject("msg", "占쎈쑏熬곣뫅�삕�뵓怨뺣쐡占쎄퉰�뤆�룊�삕 �뜝�럩逾х뇖�궡瑗백뇡占썹춯�쉻�삕 �뜝�럥瑜ュ뜝�럥裕멨뜝�럥鍮띶뜝�럥堉�.");
		}	
		
		return mav;
	}
	

	//�뜝�럩�뤂�뜝�럩�쐸�뜝�럩�젧�솻洹⑥삕 �뜝�럥�빢�뜝�럩�젧
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.GET)
	public void memberUpdateForm() {
		
	}
	
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVo mv) {
		
		ModelAndView mav = new ModelAndView("redirect:/member/myPage.do");
		
		int re = dao.updateMember(mv);
		if (re < 1) {
			mav.addObject("msg", "�뜝�럩�뤂�뜝�럩�쐸�뜝�럩�젧�솻洹⑥삕 �뜝�럥�빢�뜝�럩�젧 �뜝�럥堉꾢뜝�럥�넮");
			mav.setViewName("/member/error");
		}
		
		return mav;
	}
	
	//�뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏 �뇦猿볦삕�뜝�럡�돰(�뇖�궡裕꾬옙�윞�뜝�럩逾х뼨轅명�ｏ옙�궋)
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
	
	//�뜝�럩�뤂�뜝�럩�쐸�뵓怨뺣쐡占쎄퉰�슖�댙�삕 id�뜝�럥瑜닷뜝�럥�닡�뜝�럡���뼨�먯삕
	@RequestMapping(value="/member/getId.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getIdByMno(int mno) {
		Map map = new HashMap();
		map.put("mno", mno);
		String id = dao.getMember(map).getId();
		return id;
	}
}

