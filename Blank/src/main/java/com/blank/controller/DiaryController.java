package com.blank.controller;

import java.io.FileOutputStream;
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
import com.fasterxml.jackson.databind.ObjectMapper;


/*
 * ���̾ ���ǻ���
 * dtype�� �׸��ۻ���(db����) ������ ������1 ������ 0 
 * ex)�׸�:O ��:O ����:X 	=> dtype="110"
 */

@Controller
public class DiaryController {

	@Autowired
	private DiaryDao dao;

	public void setDao(DiaryDao dao) {
		this.dao = dao;
	}
	
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
		//int mno = Integer.parseInt(request.getParameter("mno"));
		//int bno = Integer.parseInt(request.getParameter("bno"));
		int mno = 1000;
		int bno = 2;
		
		d.setMno(mno);
		d.setBno(bno);
		
		d.setDtype("000");
		//Ÿ�� �� �ֱ�
		if(d.getDfile() != null) {
			d.setDtype("100");
		}
		//trim �ֱ�
		if(d.getDcontent() != null) {
			d.setDtype(d.getDtype().substring(0, 1) + "1" + d.getDtype().substring(2));
		}
		
		d.setDphoto("");
		
		String path = request.getRealPath("resources/upload");
		System.out.println(path);
		
		MultipartFile upload = d.getUpload();
		String dphoto = upload.getOriginalFilename();
		if (dphoto != null && !dphoto.equals("")) {
			d.setDphoto(dphoto);
			d.setDtype(d.getDtype().substring(0, 2) + "1");
			try {
				byte[]data = upload.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + dphoto);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int no = dao.diaryNextNo();
		d.setDno(no);
		
		Map map = new HashMap();
		map.put("dno", d.getDno());
		map.put("dtitle", d.getDtitle());
		map.put("ddate", d.getDdate());
		map.put("dweather", d.getDweather());
		map.put("dfont", d.getDfont());
		map.put("dtype", d.getDtype());
		map.put("dfile", d.getDfile());
		map.put("dcontent", d.getDcontent());
		map.put("dphoto", d.getDphoto());
		map.put("secret", d.getSecret());
		map.put("mno", d.getMno());
		map.put("bno", d.getBno());
		
		ModelAndView mav = new ModelAndView("redirect:/diary.do");

		int re = dao.insertDiary(map);
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
