package com.bit.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bit.vo.MemberVo;

public class MemberManager {

	private static SqlSessionFactory factory;
	static
	{
		try {
			
			Reader reader = Resources.getResourceAsReader("com/blank/db/MemberConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	//회원가입
	public static int memberInsert(MemberVo m)
	{
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("member.insertMember", m);
		session.close();
		return re;
	}
	//회원가입시 고유회원번호 자동증가
	public static int memberNextMno()
	{
		int no = 0;
		SqlSession session = factory.openSession();
		no = session.selectOne("member.memberNextMno");
		session.close();
		return no;
	}
	
	public static boolean login(Map map) {
		boolean b = false;
		SqlSession session = factory.openSession();
		MemberVo m = session.selectOne("member.login", map);
		if (m != null) {
			b = true;
		}
		return b;
	}
	
	public static MemberVo checkId(Map map)
	{
		MemberVo mv = null;
		SqlSession session = factory.openSession();
		mv = session.selectOne("member.checkId",map);	
		session.close();
		return mv;
	}
}







