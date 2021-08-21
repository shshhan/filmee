package com.filmee.myapp.domain;

import lombok.Data;

@Data
public class LoginDTO {

	private String email;
	private String password;
	
	private boolean rememberMe;
	
}//end class
