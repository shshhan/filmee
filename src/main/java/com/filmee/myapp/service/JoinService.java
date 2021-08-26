package com.filmee.myapp.service;

import com.filmee.myapp.domain.JoinDTO;

public interface JoinService {

	public abstract int join(JoinDTO dto) throws Exception;
	
	public abstract int checkEmailDuplicated(String email) throws Exception;
	
	public abstract int checkNicknameDuplicated(String nickname) throws Exception;
}//end interface
