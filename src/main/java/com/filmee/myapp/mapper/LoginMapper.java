package com.filmee.myapp.mapper;

import java.util.Date;

import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;

public interface LoginMapper {

	public abstract UserVO selectUser(LoginDTO dto) throws Exception;
	
	public abstract int updateUserRememberMe(String email, String rememberCookie, Date rememberAge) throws Exception;
}
