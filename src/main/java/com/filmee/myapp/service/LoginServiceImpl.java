package com.filmee.myapp.service;

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
	}
	
	
	@Override
	public UserVO login(LoginDTO dto) {
		log.debug("login({}) invoked.", dto);
		
		UserVO user = this.mapper.selectUser(dto);
		
		Objects.requireNonNull(user);
		log.info("user : {}", user);

		return user;
	}


}
