package com.blank.vo;

public class Favorite {
	
	private int fno;
	private int mno;
	private int fmno;
	public Favorite() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Favorite(int fno, int mno, int fmno) {
		super();
		this.fno = fno;
		this.mno = mno;
		this.fmno = fmno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getFmno() {
		return fmno;
	}
	public void setFmno(int fmno) {
		this.fmno = fmno;
	}
	
	

}
