package com.filmee.myapp.mapper;

import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;

public interface LoginMapper {

	public abstract UserVO selectUser(LoginDTO dto);
}
