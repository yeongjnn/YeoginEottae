package com.party.like.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.like.dao.LikeDAO;
import com.party.like.vo.LikeVO;
import com.party.room.vo.RoomVO;


@Service("likeService")
public class LikeServiceImpl implements LikeService {
	

    @Autowired
    private LikeDAO likeDAO;
    
    @Override
    @Transactional   
    public ArrayList<LikeVO> likeListView(LikeVO likeVO) {
        return likeDAO.likeListView(likeVO);
    }
    
    
    public void addLike(LikeVO likeVO) {
        likeDAO.addLike(likeVO);
    }

	
	  public void removeLike(LikeVO likeVO) { 
		  
		  likeDAO.removeLike(likeVO);
	  
	 }


	

	@Override
	public boolean checkLikeStatus(LikeVO likeVO) {
	    int result = likeDAO.checkLikeStatus(likeVO.getRoom_num(), likeVO.getMem_num());
	    return result > 0; // 좋아요가 있으면 true, 없으면 false를 반환
	}


	@Transactional
	public RoomVO getOneRoom(int room_num) {
		return likeDAO.getOneRoom(room_num);
	}
}