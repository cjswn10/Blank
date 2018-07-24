package com.blank.vo;

import org.springframework.web.multipart.MultipartFile;

public class GrimpanVo {

	private int bno;
	private int mno;
	private int dno;

	private MultipartFile upload;

	public GrimpanVo() {

		super();
		// TODO Auto-generated constructor stub
	}

	public GrimpanVo(int bno, int mno, int dno) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.dno = dno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

}
