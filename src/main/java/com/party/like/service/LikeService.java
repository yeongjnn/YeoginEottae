package com.party.like.service;

import java.util.ArrayList;
import java.util.List;

import com.party.like.vo.LikeVO;
import com.party.room.vo.RoomVO;

public interface LikeService {
	
    void addLike(LikeVO likeVO);


//    ArrayList<LikeVO> likeListView();

	void removeLike(LikeVO likeVO);


	ArrayList<LikeVO> likeListView(LikeVO likeVO);

	

	boolean checkLikeStatus(LikeVO likeVO);

	RoomVO getOneRoom(int room_num);
}