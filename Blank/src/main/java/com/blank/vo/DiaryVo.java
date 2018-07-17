package com.blank.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DiaryVo {
	private int dno;
	private String dtitle;
	private Date ddate;
	private String dtype;
	private String dfile;
	private String dfont;
	private String dweather;

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

	public DiaryVo(int dno, String dtitle, Date ddate, String dtype, String dfile, String dfont, String dweather) {
		super();
		this.dno = dno;
		this.dtitle = dtitle;
		this.ddate = ddate;
		this.dtype = dtype;
		this.dfile = dfile;
		this.dfont = dfont;
		this.dweather = dweather;
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

	public String getDfont() {
		return dfont;
	}

	public void setDfont(String dfont) {
		this.dfont = dfont;
	}

	public String getDweather() {
		return dweather;
	}

	public void setDweather(String dweather) {
		this.dweather = dweather;
	}
}
