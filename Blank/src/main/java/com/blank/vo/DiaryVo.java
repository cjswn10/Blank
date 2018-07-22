package com.blank.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class DiaryVo {
	private int dno;
	private String dtitle;
	private Date ddate;
	private String dtype;
	private String dfile;
	private String dweather;
	private String dphoto;
	private String dfont;
	private Date dwritedate;
	private String dcontent;
	private int serect;
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

	public DiaryVo(int dno, String dtitle, Date ddate, String dtype, String dfile, String dweather, String dphoto,
			String dfont, Date dwritedate, String dcontent, int serect, int bno) {
		super();
		this.dno = dno;
		this.dtitle = dtitle;
		this.ddate = ddate;
		this.dtype = dtype;
		this.dfile = dfile;
		this.dweather = dweather;
		this.dphoto = dphoto;
		this.dfont = dfont;
		this.dwritedate = dwritedate;
		this.dcontent = dcontent;
		this.serect = serect;
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

	public String getDweather() {
		return dweather;
	}

	public void setDweather(String dweather) {
		this.dweather = dweather;
	}

	public String getDphoto() {
		return dphoto;
	}

	public void setDphoto(String dphoto) {
		this.dphoto = dphoto;
	}

	public String getDfont() {
		return dfont;
	}

	public void setDfont(String dfont) {
		this.dfont = dfont;
	}

	public Date getDwritedate() {
		return dwritedate;
	}

	public void setDwritedate(Date dwritedate) {
		this.dwritedate = dwritedate;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public int getSerect() {
		return serect;
	}

	public void setSerect(int serect) {
		this.serect = serect;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

}
