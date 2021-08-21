package com.filmee.myapp.service;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.LoginDTO;
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
	public UserVO login(LoginDTO dto) throws Exception {
		log.debug("login({}) invoked.", dto);
		
		UserVO user = this.mapper.selectUser(dto);
		
		log.info("user : {}", user);

		return user;
	}//login


	@Override
	public int setUserRememberMe(
			String email, String rememberCookie, Date rememberAge
			) throws Exception {
		log.debug("login({}, {}, {}) invoked.", email, rememberCookie, rememberAge);
		
		int affectedLines = this.mapper.updateUserRememberMe(email, rememberCookie, rememberAge);

		return affectedLines;

	}//setUserRememberMe


}
