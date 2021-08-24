package com.filmee.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.JoinDTO;

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
	public void testInsertMember() throws Exception {
		log.debug("testInsertMember() invoked.");
		
		JoinDTO dto = new JoinDTO();
		dto.setEmail("123@123.com");
		dto.setNickname("현아천재짱짱");
		dto.setPassword("123");
		
		int affectedLines = this.mapper.insertMember(dto);
		
		log.info("affectedLines : {}", affectedLines);
		
	}//testInsertMember
	
	@Test
	public void testSelectMemberWithEmail() throws Exception{
		log.debug("testSelectMemberWithEmail invoked.");
		
		String email = "123@13.com";
		
		int result = this.mapper.selectMemberWithEmail(email);
		
		log.info("result : {}", result);
	}//testSelectMemberWithEmail
	
	
}//end class
