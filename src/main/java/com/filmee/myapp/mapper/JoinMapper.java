package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.JoinDTO;

public interface JoinMapper {

	public abstract int insertUser(JoinDTO dto) throws Exception;
	
	public abstract int countUsersWithEmail(String email)throws Exception;
	
	public abstract int countUsersWithNickname(String nickname)throws Exception;
	
//	public abstract String selectAuthCodeWithEmail(String email)throws Exception;
	
	public abstract int updateAuthCodeAuthorized(String email, String authCode)throws Exception;
	
	
}//end interface
