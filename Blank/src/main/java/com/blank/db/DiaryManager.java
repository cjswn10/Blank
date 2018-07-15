package com.blank.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.blank.vo.DiaryVo;

public class DiaryManager {

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
	
	public static int deleteDiary(Map map) {
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.delete("diary.deleteDiary", map);		
		session.close();
		return re;
	}
	
	public static int updateDiary(DiaryVo d) {
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.update("diary.updateDiary", d);
		session.close();
		return re;
	}
	
	public static DiaryVo detailDiary(Map map) {
		DiaryVo d = null;
		SqlSession session = factory.openSession();
		d = session.selectOne("diary.detailDiary", map);
		session.close();
		return d;
	}
	
	public static int insertDiary(DiaryVo d) {
		int re =  -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("diary.insertDiary", d);
		session.close();		
		return re;
		
	}
	
	public static int diaryNextNo()
	{
		int dno = 0;
		SqlSession session = factory.openSession();
		dno = session.selectOne("diary.diaryNextNo");
		session.close();
		return dno;
	}
	
	public static List<DiaryVo> listDiary(){
		List<DiaryVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("diary.selectAll");
		session.close();
		return list;
	}
}