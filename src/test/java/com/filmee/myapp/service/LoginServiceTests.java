package com.filmee.myapp.service;

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
public class LoginServiceTests {

	
	@Setter(onMethod_= @Autowired)
	private LoginService service;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(service);
		log.info("\t+++++ service : {}", this.service);
	}//setup

	@Test
	public void testLogin() {
		log.debug("testLogin() invoked.");
		
		LoginDTO dto = new LoginDTO();
		dto.setEmail("EMAIL1@GMAIL.COM");
		dto.setPassword("PASS1");
		dto.setRememberme("F");
		
		UserVO user = this.service.login(dto);
		
		log.info("user : {}", user);
		
	}//setup

	@After
	public void tearDown() {
		log.debug("tearDown() invoked.");
	}//setup
	
}//end class

