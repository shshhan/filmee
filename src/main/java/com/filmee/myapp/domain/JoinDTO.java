package com.filmee.myapp.domain;

import lombok.Data;

@Data
public class JoinDTO {

	private String email;
	private String password;
	private String nickname;
	
	private String salt;
}//end class