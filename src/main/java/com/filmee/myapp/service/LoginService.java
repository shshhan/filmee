package com.filmee.myapp.service;

import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;


public interface LoginService {
	
	public abstract UserVO login(LoginDTO dto);
}
