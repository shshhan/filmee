package com.filmee.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.JoinDTO;
import com.filmee.myapp.util.FilmeeUtil;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
)
public class JoinMapperTests {

	@Setter(onMethod_= @Autowired)
	private JoinMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(mapper);
		log.info("\t+++++ mapper : {}", this.mapper);
	}//setup

	@Test
	public void testInsertUser() throws Exception {
		log.debug("testInsertUser() invoked.");
		
		JoinDTO dto = new JoinDTO();
		dto.setEmail("22@22.com");
		dto.setNickname("testing");
		dto.setPassword("123");
		
		String salt = FilmeeUtil.getSalt();
		String hashedPw = FilmeeUtil.hashing(dto.getPassword(), salt);
		
		dto.setPassword(hashedPw);
		dto.setSalt(salt);
		
		int affectedLines = this.mapper.insertUser(dto);
		
		log.info("affectedLines : {}", affectedLines);		
		
	}//testInsertUser
	
	@Test
	public void testSelectUserWithEmail() throws Exception{
		log.debug("testSelectUserWithEmail invoked.");
		
		String email = "123@13.com";
		
		int result = this.mapper.selectUserWithEmail(email);
		
		log.info("result : {}", result);
	}//testSelectUserWithEmail
	
	
}//end class
