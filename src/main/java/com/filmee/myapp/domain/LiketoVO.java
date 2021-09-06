package com.filmee.myapp.domain;

import lombok.Value;

@Value
public class LiketoVO {
	
	private Integer liketo;		//좋아요번호
	private Integer user_id;	//유저아이디
	private Integer bno;		//게시글번호
	private Integer like_check;	//유저의 좋아요 체크 여부
}
