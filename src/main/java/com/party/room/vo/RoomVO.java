package com.party.room.vo;

import java.sql.Date;

public class RoomVO {

	private int room_num;
	private String room_name;
	private String purpose;
	private int price;
	private float width;
	private String bed;
	private String music;
	private String room_img_1;
	private String room_img_2;
	private String room_img_3;
	private String explanation;
	private Date room_regdate;
	private Date room_moddate;
	
	
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public float getWidth() {
		return width;
	}
	public void setWidth(float width) {
		this.width = width;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getRoom_img_1() {
		return room_img_1;
	}
	public void setRoom_img_1(String room_img_1) {
		this.room_img_1 = room_img_1;
	}
	public String getRoom_img_2() {
		return room_img_2;
	}
	public void setRoom_img_2(String room_img_2) {
		this.room_img_2 = room_img_2;
	}
	public String getRoom_img_3() {
		return room_img_3;
	}
	public void setRoom_img_3(String room_img_3) {
		this.room_img_3 = room_img_3;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public Date getRoom_regdate() {
		return room_regdate;
	}
	public void setRoom_regdate(Date room_regdate) {
		this.room_regdate = room_regdate;
	}
	public Date getRoom_moddate() {
		return room_moddate;
	}
	public void setRoom_moddate(Date room_moddate) {
		this.room_moddate = room_moddate;
	}
	
	
	

}
