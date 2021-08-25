package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.JoinDTO;

public interface JoinMapper {

	public abstract int insertUser(JoinDTO dto) throws Exception;
	
	public abstract int selectUserWithEmail(String email)throws Exception;
	
}//end interface
