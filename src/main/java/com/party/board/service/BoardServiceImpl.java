package com.party.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.party.board.dao.BoardDAO;
import com.party.board.vo.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bdao;
	
	@Override
	@Transactional
	public ArrayList <BoardVO> getAllBoard(){
		return bdao.getAllBoard();
	}		
	
	public void boardInsert(BoardVO boardVO) {
		bdao.boardInsert(boardVO);	
	}
	
	public void answerUpdate(BoardVO boardVO) {
		bdao.answerUpdate(boardVO);
	}
	
	public void answerInsert(BoardVO boardVO) {
		bdao.answerInsert(boardVO);	
	}
	
	public ArrayList <BoardVO> answerOpen(int b_num){
		return bdao.answerOpen(b_num);
	}	
	
	public void boardDelete(BoardVO boardVO) {
		bdao.boardDelete(boardVO);
	}
	
	
}
