package com.party.reservation.vo;

// 예약 날짜 & 시간 중복 방지를 위한 VO
public class Res_TimeVO {

	private int res_time_num; // res_time 테이블 pk
	private int room_num; // 해당 파티룸
	private int sleeping; // 숙박 여부
	private String reserve_date; // 예약 날짜
	private int reserve_time; // 예약 시간

	public int getRes_time_num() {
		return res_time_num;
	}

	public void setRes_time_num(int res_time_num) {
		this.res_time_num = res_time_num;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getSleeping() {
		return sleeping;
	}

	public void setSleeping(int sleeping) {
		this.sleeping = sleeping;
	}

	public String getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}

	public int getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(int reserve_time) {
		this.reserve_time = reserve_time;
	}

}
