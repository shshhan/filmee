package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.JoinDTO;

public interface JoinMapper {

	public abstract int insertMember(JoinDTO dto) throws Exception;
	
}//end interface
