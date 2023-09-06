package com.party.review.vo;

import java.sql.Date;

public class ReviewVO {

   private int rev_num;
   private int res_num;
   private String rev_content;
   private Date rev_date;
   private int star;
   private int mem_num;
   private int room_num;
   private String room_name;
   private String nickname;

   // 사진 리뷰 추가 (일단 3개)
   private String rev_img_1;
   private String rev_img_2;
   private String rev_img_3;

   public String getRev_img_1() {
      return rev_img_1;
   }

   public void setRev_img_1(String rev_img_1) {
      this.rev_img_1 = rev_img_1;
   }

   public String getRev_img_2() {
      return rev_img_2;
   }

   public void setRev_img_2(String rev_img_2) {
      this.rev_img_2 = rev_img_2;
   }

   public String getRev_img_3() {
      return rev_img_3;
   }

   public void setRev_img_3(String rev_img_3) {
      this.rev_img_3 = rev_img_3;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public String getRoom_name() {
      return room_name;
   }

   public void setRoom_name(String room_name) {
      this.room_name = room_name;
   }

   public ReviewVO() {
   }

   public int getRev_num() {
      return rev_num;
   }

   public void setRev_num(int rev_num) {
      this.rev_num = rev_num;
   }

   public int getRes_num() {
      return res_num;
   }

   public void setRes_num(int res_num) {
      this.res_num = res_num;
   }

   public String getRev_content() {
      return rev_content;
   }

   public void setRev_content(String rev_content) {
      this.rev_content = rev_content;
   }

   public Date getRev_date() {
      return rev_date;
   }

   public void setRev_date(Date rev_date) {
      this.rev_date = rev_date;
   }

   public int getStar() {
      return star;
   }

   public void setStar(int star) {
      this.star = star;
   }

   public int getMem_num() {
      return mem_num;
   }

   public void setMem_num(int mem_num) {
      this.mem_num = mem_num;
   }

   public int getRoom_num() {
      return room_num;
   }

   public void setRoom_num(int room_num) {
      this.room_num = room_num;
   }

}