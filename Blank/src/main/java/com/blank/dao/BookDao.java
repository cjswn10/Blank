package com.blank.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blank.db.BookManager;
import com.blank.vo.BookVo;
import com.blank.vo.MemberVo;

@Repository
public class BookDao {
	
	public List<BookVo> listFavoriteBook(Map map){
		return BookManager.listFavoriteBook(map);
	}

	//占싹깍옙占쏙옙 占쏙옙占�
	public List<BookVo> listBook(Map map)
	{
		return BookManager.listBook(map);
	}
	//占싹깍옙占쏙옙 占쏢세븝옙占쏙옙
	public BookVo detailBook(Map map)
	{
		return BookManager.detailBook(map);
	}
	//占싹깍옙占쏙옙 占쏙옙占쏙옙
	public int insertBook(BookVo b)
	{
		return BookManager.insertBook(b);
	}
	//占싹깍옙占쏙옙 占쏙옙占쏙옙
	public int updateBook(BookVo b)
	{
		return BookManager.updateBook(b);
	}
	//占싹깍옙占쏙옙 占쏙옙占쏙옙
	public int deleteBook(Map map)
	{
		return BookManager.deleteBook(map);
	}
	//占싹깍옙占쏙옙 占쏙옙호占쌘듸옙占쏙옙占쏙옙
	public int bookNextBno()
	{
		return BookManager.bookNextBno();
	}
}
