package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;

public interface BoardMapper {
	
	public abstract List<BoardVO> getList(Criteria cri); 	//메인 list 가져오기
	public abstract BoardVO select(Integer bno);			//상세조회
	public abstract int insertSelectKey(BoardVO board);		//작성
	public abstract int update(BoardVO board);	//수정
	public abstract int delete(Integer bno);	//삭제
	
	public abstract int getTotalCount(Criteria cri);	//게시판의 총 게시물 개수
	
}//end interface 
