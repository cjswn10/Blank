package com.blank.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import com.blank.db.MemberManager;
import com.blank.vo.MemberVo;

@Repository
public class MemberDao {

	public int memberInsert(MemberVo m) {
		return MemberManager.memberInsert(m);
	}
	
	public int memberCheckId(Map map) {

		return MemberManager.checkId(map);
		
	}
	
	public Boolean login(Map map) {
		return MemberManager.login(map);
	}
	
	public int memberNextMno()
	{
		return MemberManager.memberNextMno();
	}
}
