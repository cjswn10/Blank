package com.blank.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blank.db.BookManager;
import com.blank.vo.BookVo;
import com.blank.vo.MemberVo;

@Repository
public class BookDao {

	//�ϱ��� ���
	public List<BookVo> listBook(Map map)
	{
		return BookManager.listBook(map);
	}
	//�ϱ��� �󼼺���
	public BookVo detailBook(Map map)
	{
		return BookManager.detailBook(map);
	}
	//�ϱ��� ����
	public int insertBook(BookVo b)
	{
		return BookManager.insertBook(b);
	}
	//�ϱ��� ����
	public int updateBook(BookVo b)
	{
		return BookManager.updateBook(b);
	}
	//�ϱ��� ����
	public int deleteBook(int dno,int bno)
	{
		return BookManager.deleteBook(dno,bno);
	}
	//�ϱ��� ��ȣ�ڵ�����
	public int bookNextBno()
	{
		return BookManager.bookNextBno();
	}
}
