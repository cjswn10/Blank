package com.bit.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bit.db.MemberManager;
import com.bit.vo.MemberVo;

@Repository
public class MemberDao {

	public int memberInsert(MemberVo m) {
		return MemberManager.memberInsert(m);
	}
	
	public MemberVo memberCheckId(Map map) {
		return MemberManager.checkId(map);
	}
	
	public Boolean login(Map map) {
		return MemberManager.login(map);
	}
}
