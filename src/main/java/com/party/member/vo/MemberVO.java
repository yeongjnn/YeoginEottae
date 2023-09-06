package com.party.member.vo;

import java.sql.Date;

public class MemberVO {
	private int mem_num;
	private String id;
	private String pw;
	private String nickname;
	private String tel;
	private Date mem_regdate;
	private Date mem_moddate;
	private int trynum;
	
	
	
	public int getTrynum() {
		return trynum;
	}
	public void setTrynum(int trynum) {
		this.trynum = trynum;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(Date mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public Date getMem_moddate() {
		return mem_moddate;
	}
	public void setMem_moddate(Date mem_moddate) {
		this.mem_moddate = mem_moddate;
	}
	
	
}
