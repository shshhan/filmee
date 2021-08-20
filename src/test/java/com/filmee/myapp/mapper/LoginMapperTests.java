package com.filmee.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
)
public class LoginMapperTests {

	@Setter(onMethod_= @Autowired)
	private LoginMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(mapper);
		log.info("\t+++++ mapper : {}", this.mapper);
	}//setup

	@Test
	public void testSelectUser() {
		log.debug("testSelecUser() invoked.");
		
		LoginDTO dto = new LoginDTO();
		dto.setEmail("EMAIL1@GMAIL.COM");
		dto.setPassword("PASS1");
		dto.setRememberme("F");
		
		UserVO user = this.mapper.selectUser(dto);
		
		log.info("user : {}", user);
		
		
	}//setup

	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//setup
	
}//end class
