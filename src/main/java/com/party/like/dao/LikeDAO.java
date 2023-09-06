package com.party.like.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.party.like.vo.LikeVO;
import com.party.room.vo.RoomVO;


public interface LikeDAO {
   
  
    ArrayList<LikeVO> likeListView(LikeVO likeVO);
    void addLike(LikeVO likeVO);

	void removeLike(LikeVO likeVO);
 

    int checkLikeStatus(@Param("room_num") int room_num, @Param("mem_num") int mem_num);

    RoomVO getOneRoom(int room_num);
}
