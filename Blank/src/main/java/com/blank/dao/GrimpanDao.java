package com.blank.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blank.db.GrimpanManager;
import com.blank.vo.GrimpanVo;
@Repository
public class GrimpanDao {
	
	public GrimpanVo grimpan(Map map) {
		return GrimpanManager.grimpan(map);
	}

}
