package com.blank.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import com.blank.db.MemberManager;
import com.blank.vo.MemberVo;

@Repository
public class MemberDao {

	//ȸ������
	public int memberInsert(MemberVo m) {
		return MemberManager.memberInsert(m);
	}
	//���̵� �ߺ�üũ
	public int memberCheckId(Map map) {

		return MemberManager.checkId(map);
		
	}
	//�α���
	public Boolean login(Map map) {
		return MemberManager.login(map);
	}
	//ȸ����ȣ ��������
	public int mno(Map map)
	{
		return MemberManager.mno(map);
	}
	//ȸ����ȣ �ڵ�����
	public int memberNextMno()
	{
		return MemberManager.memberNextMno();
	}
	//ȸ����������
	public int updateMember(MemberVo mv) {
		// TODO Auto-generated method stub
		return MemberManager.updateMember(mv);
	}
	//ȸ������ �޾ƿ���
	public MemberVo getMember(Map map) {
		// TODO Auto-generated method stub
		return MemberManager.getMember(map);
	}
	
	public List<MemberVo> mainSearchId(Map map)
	{
		return MemberManager.mainSearchId(map);
	}
	
	//ȸ�� ���̵� ã��
	public String searchId(Map map)
	{
		return MemberManager.searchId(map);
	}
	//ȸ�� ��й�ȣ ã��
	public String searchPwd(Map map)
	{
		return MemberManager.searchPwd(map);
	}

}
