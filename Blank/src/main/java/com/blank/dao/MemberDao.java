package com.blank.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import com.blank.db.MemberManager;
import com.blank.vo.LogVo;
import com.blank.vo.MemberVo;

@Repository
public class MemberDao {

	//회占쏙옙占쏙옙占쏙옙
	public int memberInsert(MemberVo m) {
		return MemberManager.memberInsert(m);
	}
	//占쏙옙占싱듸옙 占쌩븝옙체크
	public int memberCheckId(Map map) {

		return MemberManager.checkId(map);
		
	}
	//占싸깍옙占쏙옙
	public Boolean login(Map map) {
		return MemberManager.login(map);
	}
	//회占쏙옙占쏙옙호 占쏙옙占쏙옙占쏙옙占쏙옙
	public int mno(Map map)
	{
		return MemberManager.mno(map);
	}
	//회占쏙옙占쏙옙호 占쌘듸옙占쏙옙占쏙옙
	public int memberNextMno()
	{
		return MemberManager.memberNextMno();
	}
	//회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙
	public int updateMember(MemberVo mv) {
		// TODO Auto-generated method stub
		return MemberManager.updateMember(mv);
	}
	//회占쏙옙占쏙옙占쏙옙 占쌨아울옙占쏙옙
	public MemberVo getMember(Map map) {
		// TODO Auto-generated method stub
		return MemberManager.getMember(map);
	}
	
	public List<MemberVo> mainSearchId(Map map)
	{
		return MemberManager.mainSearchId(map);
	}
	
	//회占쏙옙 占쏙옙占싱듸옙 찾占쏙옙
	public String searchId(Map map)
	{
		return MemberManager.searchId(map);
	}
	//회占쏙옙 占쏙옙橘占싫� 찾占쏙옙
	public String searchPwd(Map map)
	{
		return MemberManager.searchPwd(map);
	}
	public int logRecord(LogVo l)
	{
		return MemberManager.logRecord(l);
	}

}
