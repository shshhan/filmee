package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.LiketoVO;

public interface LiketoMapper {
	
	//좋아요 클릭
	public abstract int likeInsert(LiketoVO likeVO);

	//좋아요 취소
	public abstract int unlike(Integer userId, Integer bno);

	//좋아요 개수
	public abstract int likeCount(Integer bno);
	
}//end interface
