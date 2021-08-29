package com.filmee.myapp.service;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.UserDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.mapper.LoginMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class LoginServiceImpl 
	implements LoginService, InitializingBean {


	@Setter(onMethod_=@Autowired)
	private LoginMapper mapper;

	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	
	@Override
	public UserVO login(UserDTO dto) throws Exception {
		log.debug("login({}) invoked.", dto);
		
		UserVO user = this.mapper.selectUser(dto);
		
		log.info("user : {}", user);

		return user;
	}//login

	@Override
	public String getUserSalt(String email) throws Exception {
		log.debug("getUserSalt({}) invoked.", email);
		
		String salt = this.mapper.selectSaltWithEmail(email);
		
		log.info("salt : {}", salt);
		
		return salt;
	}//getUserSalt
	

	@Override
	public int setUserRememberMe(
			String email, String rememberCookie, Date rememberAge
			) throws Exception {
		log.debug("setUserRememberMe({}, {}, {}) invoked.", email, rememberCookie, rememberAge);
		
		int affectedLines = this.mapper.updateUserRememberMe(email, rememberCookie, rememberAge);

		return affectedLines;

	}//setUserRememberMe


	@Override
	public UserVO findUserWithCookie(String cookieValue) throws Exception {
		log.debug("findUserWithCookie({}) invoked.", cookieValue);
		
		UserVO user = this.mapper.selectUserWithCookie(cookieValue);
		
		log.info("user : {}", user);

		return user;
	}//findUserWithCookie


	@Override
	public boolean changePassword(UserDTO dto) throws Exception {
		log.debug("changePassword({}) invoked.", dto);
		
		if(this.mapper.updatePassword(dto) == 1) {
			return true;
		}else {
			return false;
		}//if-else
		
	}//modifyPwToTempPw
	
}//end class
