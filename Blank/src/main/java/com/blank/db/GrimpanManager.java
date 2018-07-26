package com.blank.db;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.blank.vo.GrimpanVo;

public class GrimpanManager {

	private static SqlSessionFactory factory;
	static {
		try {

			Reader reader = Resources.getResourceAsReader("com/blank/db/BlankConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public static GrimpanVo grimpan(Map map) {

		GrimpanVo g = null;
		SqlSession session = factory.openSession();
		g = session.selectOne("diary.grimpan", map);
		session.close();
		return g;
	}

}
