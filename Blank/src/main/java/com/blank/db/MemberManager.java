package com.blank.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.web.bind.annotation.RequestBody;

import com.blank.vo.LogVo;
import com.blank.vo.MemberVo;

public class MemberManager {

	private static SqlSessionFactory factory;
	static
	{
		try {
			
			Reader reader = Resources.getResourceAsReader("com/blank/db/BlankConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	//회占쏙옙占쏙옙占쏙옙
	public static int memberInsert(MemberVo m)
	{
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("member.insertMember", m);
		session.close();
		return re;
	}
	//회占쏙옙占쏙옙占쌉쏙옙 占쏙옙占쏙옙회占쏙옙占쏙옙호 占쌘듸옙占쏙옙占쏙옙
	public static int memberNextMno()
	{
		int no = 0;
		SqlSession session = factory.openSession();
		no = session.selectOne("member.memberNextMno");
		session.close();
		return no;
	}
	//占싸깍옙占쏙옙
	public static boolean login(Map map) {
		boolean b = false;
		SqlSession session = factory.openSession();
		MemberVo m = session.selectOne("member.login", map);
		if (m != null) {
			b = true;
		}
		return b;
	}
	
	//占쏙옙占싱듸옙 占쌩븝옙체크
	public static int checkId(Map map)
	{
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("member.checkId",map);
		session.close();
		return re;
	}
	
	//회占쏙옙占쏙옙호 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌨소듸옙
	public static int mno(Map map)
	{
		int mno = 0;
		SqlSession session = factory.openSession();
		mno = session.selectOne("member.mno",map);
		session.close();
		return mno;
	}
	
	//회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙
	public static MemberVo getMember(Map map) {
		// TODO Auto-generated method stub
		MemberVo mv = new MemberVo();
		SqlSession session = factory.openSession();
		mv = session.selectOne("member.getMember", map);
		return mv;
	}
	
	//회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占�
	public static int updateMember(MemberVo mv) {
		// TODO Auto-generated method stub
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("member.updateMember", mv);
		session.close();
		return re;
	}
	
	public static List<MemberVo> mainSearchId(Map map)
	{
		SqlSession session = factory.openSession();
		List<MemberVo> list = session.selectList("member.mainSearchId", map);
		session.close();
		return list;
	}
	
	//회占쏙옙占쏙옙占싱듸옙 찾占쏙옙
	public static String searchId(Map map)
	{
		String id = "";
		SqlSession session = factory.openSession();
		id = session.selectOne("member.searchId", map);
		session.close();
		return id;
	}
	
	//회占쏙옙占쏙옙橘占싫� 찾占쏙옙
	public static String searchPwd(Map map)
	{
		String pwd = "";
		SqlSession session = factory.openSession();
		pwd = session.selectOne("member.searchPwd", map);
		session.close();
		return pwd;
	}
		
	public static int logRecord(LogVo l)
	{
		int re = -1;
		SqlSession session = factory.openSession();
		l.setLno(logNextLno());
		re = session.insert("logRecod", l);
		session.commit();
		session.close();
		return re;
	}
	
	public static int logNextLno()
	{
		int lno = 0;
		SqlSession session = factory.openSession();
		lno = session.selectOne("member.logNextLno");
		session.close();
		return lno;
	}
}







