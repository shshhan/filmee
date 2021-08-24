package com.filmee.myapp.service;

import com.filmee.myapp.domain.JoinDTO;

public interface JoinService {

	public abstract int join(JoinDTO dto) throws Exception;
	
	public abstract int checkEmailDuplicated(String email) throws Exception;
}//end interface
