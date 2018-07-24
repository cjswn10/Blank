package com.blank.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.blank.vo.FavoriteVo;

public class FavoriteManager {
	
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/blank/db/BlankConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public static List<String> list(Map map)
	{
		System.out.println("매니저````````````````" + map.get("mno"));
		SqlSession session = factory.openSession();

		List<String> list = session.selectList("favorite.listFavorite", map);
		System.out.println("id는==========="+list.get(0));
		session.close();
		return list;
	}
	
	
	

}
