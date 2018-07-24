package com.blank.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blank.db.FavoriteManager;
import com.blank.vo.FavoriteVo;

@Repository
public class FavoriteDao {

	public List<String> list(Map map)
	{
		System.out.println("dao¿‘¥œ¥Ÿ" + map.get("mno"));
		return FavoriteManager.list(map);
	}
}
