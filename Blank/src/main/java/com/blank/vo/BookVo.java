package com.blank.vo;

public class BookVo {

	private int bno;
	private String btitle;
	private String bcolor;
	public BookVo(int bno, String btitle, String bcolor) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcolor = bcolor;
	}
	public BookVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcolor() {
		return bcolor;
	}
	public void setBcolor(String bcolor) {
		this.bcolor = bcolor;
	}
	
	
}
