package com.blank.dao;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.blank.db.DiaryManager;
import com.blank.vo.DiaryVo;

@Repository
public class DiaryDao {
	
	public int deleteDiary(Map map) {
		return DiaryManager.deleteDiary(map);
	}
	
	public int updateDiary(DiaryVo d) {
		return DiaryManager.updateDiary(d);
	}
	
	public DiaryVo detailDiary(Map map) {
		return DiaryManager.detailDiary(map);
	}
	
	public int insertDiary(DiaryVo d) {
		return DiaryManager.insertDiary(d);
	}

	public int diaryNextNo() {
		return DiaryManager.diaryNextNo();
	}
	
	public List<DiaryVo> listDiary(Map map){
		return DiaryManager.listDiary(map);
	}
}
