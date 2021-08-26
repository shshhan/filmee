package com.filmee.myapp.service;

import java.util.Objects;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filmee.myapp.domain.JoinDTO;
import com.filmee.myapp.mapper.JoinMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class JoinServiceImpl 
	implements JoinService, InitializingBean {

	@Setter(onMethod_=@Autowired)
	private JoinMapper mapper;
	
	
	@Override
	public void afterPropertiesSet() throws Exception {
		log.debug("afterPropertiesSet() invoked.");
		
		Objects.requireNonNull(this.mapper);
	}//afterPropertiesSet
	
	
	@Override
	public int join(JoinDTO dto) throws Exception {
		log.debug("join({}) invoked.", dto);
		
		int affectedLines = this.mapper.insertUser(dto);
		
		return affectedLines;
	}//join


	@Override
	public int checkEmailDuplicated(String email) throws Exception {
		log.debug("checkEmailDuplicated({}) invoked.", email);
		
		int result = this.mapper.selectUserWithEmail(email);
		
		return result;
	}//checkEmailDuplicated
	
	@Override
	public int checkNicknameDuplicated(String nickname) throws Exception {
		log.debug("checkNicknameDuplicated({}) invoked.", nickname);
		
		int result = this.mapper.selectUserWithNickname(nickname);
		
		return result;
	}//checkNicknameDuplicated


}//end class
