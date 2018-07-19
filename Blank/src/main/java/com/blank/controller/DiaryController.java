package com.blank.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.DiaryDao;
import com.blank.vo.DiaryVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class DiaryController {

	@Autowired
	private DiaryDao dao;

	public void setDao(DiaryDao dao) {
		this.dao = dao;
	}
	/*
	 * ���̾ ���ǻ���
	 * dfont �⺻�� �������ֱ�
	 * dtype�� �׸��ۻ���(db����) ������ ������1 ������ 0 
	 * ex)��:O �׸�:O ����:X 	=> dtype=110
	 */
	
	
	//�ϱ� ����
	@RequestMapping("deleteDiary.do")
	public ModelAndView deleteDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView("redirect:/diary.do");
		int re = dao.deleteDiary(map);
		if (re < 1) {
			mav.addObject("msg", "���� ����");
		}
		return mav;
	}
	
	//�ϱ� ���� ��
	@RequestMapping(value="updateDiary.do", method=RequestMethod.GET)
	public ModelAndView diaryUpdateForm(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	//�ϱ� ���� ����
	@RequestMapping(value="updateDiary.do", method=RequestMethod.POST)
	public ModelAndView diaryUpdateSubmit(DiaryVo d) {
		/*Map map = new HashMap();
		map.put("d", d);*/
		ModelAndView mav = new ModelAndView();
		int re = dao.updateDiary(d);
		if (re > 0) {
			mav.setViewName("redirect:/listDiary.do");
		}else {
			mav.addObject("msg", "�ϱ�  ���� ����");
			mav.setViewName("error");			
		}		
		return mav;				
	}
	
	//�ϱ� ��
	@RequestMapping("detailDiary.do")
	public ModelAndView detailDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	//�ϱ� ��� ��
	@RequestMapping(value="insertDiary.do", method=RequestMethod.GET)
	public void diaryInsertForm() {
		
	}
	
	//�ϱ� ��� ����
	@RequestMapping(value="insertDiary.do",  method=RequestMethod.POST)
	public ModelAndView diaryInsertSubmit(DiaryVo d, HttpServletRequest request) {
		d.setDfile("");
		String path = request.getRealPath("resources/upload");
		System.out.println(path);
		
		MultipartFile upload = d.getUpload();
		String dfile = upload.getOriginalFilename();
		if (dfile != null && !dfile.equals("")) {
			d.setDfile(dfile);
			try {
				byte[]data = upload.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + dfile);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int no = dao.diaryNextNo();
		d.setDno(no);
		ModelAndView mav = new ModelAndView("redirect:/diary.do");
		int re = dao.insertDiary(d);
		if (re < 1) {
			mav.addObject("msg", "�ϱ� ��� ����");
			mav.setViewName("error");
		}	
		
		return mav;				
	}
	
	@RequestMapping("diary.do")
	public void diary() {
		
	}
	
	//�ϱ� ���
	@RequestMapping(value="listDiary.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listDiary() {
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.listDiary());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
}
