package com.party.board.service;

import java.util.ArrayList;

import com.party.board.vo.BoardVO;



public interface BoardService {
	ArrayList <BoardVO> getAllBoard();
	
	void boardInsert(BoardVO boardVO);
	
	void answerUpdate(BoardVO boardVO);
	
	void answerInsert(BoardVO boardVO);
	
	ArrayList <BoardVO> answerOpen(int b_num);
	
	void boardDelete(BoardVO boardVO);
}
