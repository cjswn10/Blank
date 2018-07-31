package com.blank.controller;

import java.io.File;
import java.io.FileOutputStream;
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
import com.blank.vo.DiaryVo;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class DiaryController {

	@Autowired
	private DiaryDao dao;

	public void setDao(DiaryDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/member/mainDetailDiary.do")
	public ModelAndView mainDetailDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
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
	public String listFavoriteDiary(int fmno, HttpSession session) {
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
	
	//�쇨린 ����
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
			mav.addObject("msg", "���� �ㅽ��");
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

	
	//�쇨린 ����
	@RequestMapping(value="/member/updateDiary.do", method=RequestMethod.POST)
	public ModelAndView diaryUpdateSubmit(DiaryVo d, HttpSession session, HttpServletRequest request) {		
		
		
		int no = d.getDno(); 
		
		
		d.setDtype("000");
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
		

		
		//
		//이전 파일을 가져오기 위한 map
		Map map = new HashMap();
		map.put("dno", d.getDno());
		
		String oldDfile = (dao.detailDiary(map)).getDfile();
		String oldDphoto = (dao.detailDiary(map)).getDphoto();
		
		System.out.println("---------olddfile"+oldDfile);
		System.out.println("---------olddfile"+oldDphoto);
		/*
		String oldDphoto = d.getDphoto();
		String oldDfile = d.getDfile();		
		System.out.println();
		 */
		
		String path = request.getRealPath("resources/upload");
		String pathG = request.getRealPath("resources/upload2");
		System.out.println(path);
		System.out.println(pathG);

		MultipartFile upload = d.getUpload();
		MultipartFile uploadG = d.getUploadG();
		
		String orgname = upload.getOriginalFilename();
	    String dphoto = "x";
	       
	    //사진이름 바꾸기
       if(orgname != null && !orgname.equals("")) {
    	   
	       String exc = orgname.substring(orgname.lastIndexOf(".")+1, orgname.length());
	       //���μ��瑜� �ы�⑦�� ���대�
	       dphoto = bno + "b" + no + "." + exc;
	       System.out.println("dphoto:"+dphoto);
	       File saveFile = new File(path + "/" + dphoto);
	       try {
	    	   upload.transferTo(saveFile);
	       } catch (Exception e) {
	    	   // TODO: handle exception
	    	   System.out.println(e.getMessage());
	       }
       
       }

       /////////////////////////////////////////////////////
		if (!dphoto.equals("x")) {
			
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
		
		System.out.println("22222222222222222");
		
		String orgnameG = uploadG.getOriginalFilename();
		String dfile = "x";
		
		if(orgnameG != null && !orgnameG.equals("")) {
			
			String excG = orgnameG.substring(orgnameG.lastIndexOf(".")+1, orgnameG.length());
			//���μ��瑜� �ы�⑦�� ���대�
			dfile = bno + "b" + no + "grim." + excG;
			System.out.println(dfile);
			//���쇨꼍濡�瑜� �ы�⑦�� �대�
		    File saveFile = new File(pathG + "/" + dfile);
			     
	       try {
	    	   upload.transferTo(saveFile);
	       } catch (Exception e) {
	    	   // TODO: handle exception
	    	   System.out.println(e.getMessage());
	       }
		}
		System.out.println("444");
		/////////////////////////////////////////////////////
		if (!dfile.equals("x")) {
			System.out.println("555");
			d.setDfile(dfile);
			d.setDtype(d.getDtype().substring(0, 2) + "1");
			try {
				byte[] dataG = uploadG.getBytes();
				FileOutputStream fosG = new FileOutputStream(pathG + "/" + dfile);
				fosG.write(dataG);
				fosG.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		

		int re = dao.updateDiary(d);
		System.out.println("re입니다." + re);
		if (re > 0) {
			mav.setViewName("redirect:/member/diary.do?mno="+mno+"&bno="+bno);
			
			if (!dphoto.equals("x")) {
				System.out.println("666photo");
				File file = new File(path + "/" + oldDphoto);

				file.delete();
			}
			if (!dfile.equals("x")) {
				System.out.println("777file");
				File fileG = new File(pathG + "/" + oldDfile);
				
				fileG.delete();
			}
			
			
		}else {
			mav.addObject("msg", "���� �ㅽ��");
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
		
		
		
		return mav;
	}
	
	//�쇨린 ����
	@RequestMapping("/member/detailDiary.do")
	public ModelAndView detailDiary(int dno) {
		Map map = new HashMap();
		map.put("dno", dno);
		ModelAndView mav = new ModelAndView();
		mav.addObject("d", dao.detailDiary(map));
		return mav;
	}
	
	//�쇨린 ���� ��
	@RequestMapping(value="/member/insertDiary.do", method=RequestMethod.GET)
	public void diaryInsertForm() {

	}
	
	//�쇨린 ����
	@RequestMapping(value="/member/insertDiary.do",  method=RequestMethod.POST)
	public ModelAndView diaryInsertSubmit(DiaryVo d, HttpServletRequest request, HttpSession session) {
		int mno = (Integer) session.getAttribute("mno");
		int bno = (Integer) session.getAttribute("bno");

		int no = dao.diaryNextNo();
		d.setDno(no);
		
		d.setDtype("000");
		//洹몃┝ ���� �ㅼ��
		if (d.getDfile() != null) {
			d.setDtype("100");
		}
		
		//trim �댁�� �⑥�쇳��(萸��쇨� �쇱��源�..?)
		if (d.getDcontent() != null) {
			d.setDtype(d.getDtype().substring(0, 1) + "1" + d.getDtype().substring(2));
		}

		d.setDphoto("");
		d.setDfile("");

		String path = request.getRealPath("resources/upload");
		String pathG = request.getRealPath("resources/upload2");
		System.out.println(path);
		System.out.println(pathG);

		
		MultipartFile upload = d.getUpload();
		MultipartFile uploadG = d.getUploadG();
		//String dphoto = upload.getOriginalFilename();
		/////////////////////////////////////////////////////
		 
		
		String ser_id = request.getParameter("ser_id");
	       Boolean success = false;
	       ModelAndView view = new ModelAndView();
	       //�����대�
	       String orgname = upload.getOriginalFilename();
	       String dphoto = "x";
	       
	       if(orgname != null && !orgname.equals("")) {
	    	   
		       String exc = orgname.substring(orgname.lastIndexOf(".")+1, orgname.length());
		       //���μ��瑜� �ы�⑦�� ���대�
		       dphoto = bno + "b" + no + "." + exc;
		       System.out.println(dphoto);
		       //���쇨꼍濡�瑜� �ы�⑦�� �대�
		       File saveFile = new File(path + "/" + dphoto);
		     
		       try {
		    	   upload.transferTo(saveFile);
		       } catch (Exception e) {
		    	   // TODO: handle exception
		    	   System.out.println(e.getMessage());
		       }
	       
	       }
		/////////////////////////////////////////////////////
		if (!dphoto.equals("x")) {
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
		
	       String orgnameG = uploadG.getOriginalFilename();
	       String dfile = "x";
	       
	       if(orgnameG != null && !orgnameG.equals("")) {
	    	   
		       String excG = orgnameG.substring(orgnameG.lastIndexOf(".")+1, orgnameG.length());
		       //���μ��瑜� �ы�⑦�� ���대�
		       dfile = bno + "b" + no + "grim." + excG;
		       System.out.println(dfile);
		       //���쇨꼍濡�瑜� �ы�⑦�� �대�
		       File saveFileG = new File(pathG + "/" + dfile);
		     
		       try {
		    	   upload.transferTo(saveFileG);
		       } catch (Exception e) {
		    	   // TODO: handle exception
		    	   System.out.println(e.getMessage());
		       }
	       
	       }
		/////////////////////////////////////////////////////
		if (!dfile.equals("x")) {
			d.setDfile(dfile);
			d.setDtype(d.getDtype().substring(0, 2) + "1");
			try {
				byte[] dataG = uploadG.getBytes();
				FileOutputStream fosG = new FileOutputStream(pathG + "/" + dfile);
				fosG.write(dataG);
				fosG.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

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
			mav.addObject("msg", "���� �ㅽ��");
			mav.setViewName("/member/error");
		}

		return mav;
	}

	@RequestMapping("/member/diary.do")
	public void diary() {

	}

	//�쇨린 紐⑸�
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