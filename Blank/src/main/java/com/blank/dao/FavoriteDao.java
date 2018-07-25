package com.blank.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blank.db.FavoriteManager;
import com.blank.vo.FavoriteVo;

@Repository
public class FavoriteDao {

	public List<FavoriteVo> list(Map map)
	{
		
		return FavoriteManager.list(map);
	}
	
	public int delete(Map map)
	{
		return FavoriteManager.delete(map);
	}
}
