package com.blank.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blank.dao.DiaryDao;
import com.blank.vo.BookVo;
import com.blank.vo.DiaryVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class DiaryController {

	@Autowired
	private DiaryDao dao;

	public void setDao(DiaryDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/member/detailFavoriteDiary.do")
	public ModelAndView detailFavoriteDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	@RequestMapping("/member/favoritesDiary.do")
	public void FavoriteBook() {
		
	}
	
	@RequestMapping(value="/member/favoriteDiaryList.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listFavoriteDiary(int fmno) {
		Map map = new HashMap();
		map.put("fmno", fmno);
		String str = "";
		List<DiaryVo> list = dao.listFavoriteDiary(map);	
		try {
			
			ObjectMapper mapper = new ObjectMapper();
			str = mapper.writeValueAsString(list);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return str;
	}
	
	/*
 	//=> dtype="110"
 	 */
	//占싹깍옙 占쏙옙占쏙옙
	@RequestMapping("/member/deleteDiary.do")
	public ModelAndView deleteDiary(int dno, HttpSession session, HttpServletRequest request) {		
		
		int mno = (Integer) session.getAttribute("mno");
		int bno = (Integer) session.getAttribute("bno");
		Map map = new HashMap();

		map.put("dno", dno);		
		
		String path = request.getRealPath("resources/upload");
		String oldFname = dao.detailDiary(map).getDphoto();		
				
		ModelAndView mav = new ModelAndView("redirect:/member/diary.do?mno="+mno+"&bno="+bno);
		int re = dao.deleteDiary(map);
		if (re < 1) {
			mav.addObject("msg", "占쏙옙占쏙옙 占쏙옙占쏙옙");
			mav.setViewName("/member/error");
		}
		if (re > 0 && oldFname != null && !oldFname.equals("")) {
			File file = new File(path + "/" + oldFname);
			file.delete();

		}
		return mav;
	}

	@RequestMapping(value="/member/updateDiary.do", method=RequestMethod.GET)
	public ModelAndView diaryUpdateForm(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}

	
	//占싹깍옙 占쏙옙占쏙옙 
	@RequestMapping(value="/member/updateDiary.do", method=RequestMethod.POST)
	public ModelAndView diaryUpdateSubmit(DiaryVo d, HttpSession session, HttpServletRequest request) {		
		/*Map map = new HashMap();
		map.put("d", d);*/

		String dtype = d.getDtype();
		System.out.println(dtype);

		if (d.getDfile() != null) {
			d.setDtype("100");
		}
		
		if(d.getDcontent() != null) {
			d.setDtype(d.getDtype().substring(0, 1) + "1" + d.getDtype().substring(2));
		}

		int mno = (Integer) session.getAttribute("mno");
		int bno = (Integer) session.getAttribute("bno");
		ModelAndView mav = new ModelAndView();

		
		
		String oldDphoto = d.getDphoto();		
		

		String path = request.getRealPath("resources/upload");
		System.out.println(path);

		MultipartFile upload = d.getUpload();
		String dphoto = upload.getOriginalFilename();
		if (dphoto != null && !dphoto.equals("")) {			
			d.setDtype(d.getDtype().substring(0, 2) + "1");
			d.setDphoto(dphoto);
			try {
				byte[] data = upload.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + dphoto);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


		int re = dao.updateDiary(d);
		
		if (re > 0) {

			mav.setViewName("redirect:/member/diary.do?mno="+mno+"&bno="+bno);
		}else {
			mav.addObject("msg", "占쏙옙占쏙옙 占쏙옙占쏙옙");
			mav.setViewName("/member/error");			
		}
		
//		d.setDphoto(oldDphoto);
//		String fname = null;
//		
//		if (d.getDphoto() != null) {
//			fname = d.getDphoto();
//		}
//		if (fname != null && !fname.equals("")) {
//			d.setDphoto(fname);
//		}
		
		
		if (re > 0 && !dphoto.equals("") && dphoto != null && !dphoto.equals("")) {
			File file = new File(path + "/" + oldDphoto);

			file.delete();
		}
		return mav;
	}
	
	//占싹깍옙 占쏙옙
	@RequestMapping("/member/detailDiary.do")
	public ModelAndView detailDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	//占싹깍옙占쌜쇽옙 占쏙옙
	@RequestMapping(value="/member/insertDiary.do", method=RequestMethod.GET)
	public void diaryInsertForm() {

	}
	
	//占싹깍옙 占쌜쇽옙
	@RequestMapping(value="/member/insertDiary.do",  method=RequestMethod.POST)
	public ModelAndView diaryInsertSubmit(DiaryVo d, HttpServletRequest request, HttpSession session) {
		int mno = (Integer) session.getAttribute("mno");
		int bno = (Integer) session.getAttribute("bno");

		d.setDtype("000");
		//占쌓몌옙 占쏙옙占쏙옙 占쏙옙
		if (d.getDfile() != null) {
			d.setDtype("100");
		}
		
		//trim 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쌔억옙占쏙옙
		if (d.getDcontent() != null) {
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
				byte[] data = upload.getBytes();
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

		ModelAndView mav = new ModelAndView("redirect:/member/diary.do?mno=" + mno + "&bno=" + bno);

		int re = dao.insertDiary(map);
		if (re < 1) {
			mav.addObject("msg", "占쌜쇽옙 占쏙옙占쏙옙");
			mav.setViewName("/member/error");
		}

		return mav;
	}

	@RequestMapping("/member/diary.do")
	public void diary() {

	}

	//일기 목록
	@RequestMapping(value="/member/listDiary.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listDiary(int bno, int mno, HttpSession session) {
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("mno", mno);

		session.setAttribute("bno", bno);
		session.setAttribute("mno", mno);

		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.listDiary(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	

	
}
