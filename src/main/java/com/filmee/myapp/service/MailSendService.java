package com.filmee.myapp.service;

public interface MailSendService {
	
	public abstract String getAuthCode(int size);
	
	public abstract String sendAuthMail(String email);
	
}//end interface
