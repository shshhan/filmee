package com.filmee.myapp.util;

import java.security.NoSuchAlgorithmException;

import org.junit.Test;

import com.filmee.myapp.domain.JoinDTO;
import com.filmee.myapp.util.FilmeeUtil;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class HashingTest {

	@Test
	public void testHashing() throws NoSuchAlgorithmException {
		JoinDTO dto = new JoinDTO();
		dto.setPassword("111");
		
		String salt =FilmeeUtil.getSalt();
		
		log.info("salt.length : {}", salt.length());
		
		String password = FilmeeUtil.hashing(dto.getPassword(), salt);

		log.info("password : {}", password);
		log.info("password.length : {}", password.length());
		
	
	}//testHashing
	

}
