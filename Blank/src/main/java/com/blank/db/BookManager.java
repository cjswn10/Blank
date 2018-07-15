package com.blank.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.blank.vo.BookVo;

public class BookManager {

	private static SqlSessionFactory factory;
	static 
	{
		try {
			
			Reader reader = Resources.getResourceAsReader("com/blank/db/BookConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	//�ϱ��� ���
	public static List<BookVo> listBook()
	{
		List<BookVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("book.listBook");
		session.close();
		return list;
	}
	//�ϱ��� �󼼺���
	public static BookVo detailBook(Map map)
	{
		BookVo b = null;
		SqlSession session = factory.openSession();
		b = session.selectOne("book.detailBook", map);
		session.close();
		return b;
	}
	//�ϱ��� ����
	public static int insertBook(BookVo b)
	{
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("book.insertBook", b);
		if(re > 0)
		{
			session.commit();
		}
		else
		{
			session.rollback();
		}	
		session.close();
		return re;
	}
	//�ϱ��� ����
	public static int updateBook(BookVo b)
	{
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.update("book.updateBook", b);
		if(re > 0)
		{
			session.commit();
		}
		else
		{
			session.rollback();
		}	
		session.close();
		return re;
	}
	//�ϱ��� ����
	public static int deleteBook(Map map)
	{
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.delete("book.deleteBook", map);
		if(re > 0)
		{
			session.commit();
		}
		else
		{
			session.rollback();
		}	
		session.close();
		return re;
	}
	//�ϱ��� ��ȣ�ڵ�����
	public static int bookNextBno()
	{
		int no = 0;
		SqlSession session = factory.openSession();
		no = session.selectOne("book.bookNextBno");
		session.close();
		return no;
	}
}







