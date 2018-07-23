package com.blank.vo;


import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class DiaryVo {
	private int dno;
	private String dtitle;
	private Date ddate;
	private String dweather;
	private String dfont;
	private String dtype;
	private String dfile;
	private String dcontent;
	private String dphoto;
	private int secret;
	private Date wdate;
 	private int mno;
	private int bno;

	private MultipartFile upload;

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public DiaryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DiaryVo(int dno, String dtitle, Date ddate, String dweather, String dfont, String dtype, String dfile,
			String dcontent, String dphoto, int secret, Date wdate, int mno, int bno) {
		super();
		this.dno = dno;
		this.dtitle = dtitle;
		this.ddate = ddate;
		this.dweather = dweather;
		this.dfont = dfont;
		this.dtype = dtype;
		this.dfile = dfile;
		this.dcontent = dcontent;
		this.dphoto = dphoto;
		this.secret = secret;
		this.wdate = wdate;
		this.mno = mno;
		this.bno = bno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	public Date getDdate() {
		return ddate;
	}

	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	public String getDweather() {
		return dweather;
	}

	public void setDweather(String dweather) {
		this.dweather = dweather;
	}

	public String getDfont() {
		return dfont;
	}

	public void setDfont(String dfont) {
		this.dfont = dfont;
	}

	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	public String getDfile() {
		return dfile;
	}

	public void setDfile(String dfile) {
		this.dfile = dfile;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public String getDphoto() {
		return dphoto;
	}

	public void setDphoto(String dphoto) {
		this.dphoto = dphoto;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	
}