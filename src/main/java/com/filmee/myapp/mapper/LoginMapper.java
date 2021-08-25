package com.filmee.myapp.mapper;

import java.util.Date;

import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;

public interface LoginMapper {

	public abstract UserVO selectUser(LoginDTO dto) throws Exception;
	
	public abstract String selectSaltByEmail(String email) throws Exception;
	
	public abstract int updateUserRememberMe(String email, String rememberCookie, Date rememberAge) throws Exception;

	public abstract UserVO selectUserWithCookie(String cookieValue) throws Exception;
}//end interface
