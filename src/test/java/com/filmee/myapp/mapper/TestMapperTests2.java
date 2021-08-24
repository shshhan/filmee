package com.filmee.myapp.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.Objects;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.filmee.myapp.domain.TestVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"
)
public class TestMapperTests2 {

	@Setter(onMethod_= @Autowired)
	private TestMapper mapper;
	
	@Before
	public void setup() {
		log.debug("setup() invoked.");
		
		assertNotNull(mapper);
		log.info("\t+++++ mapper : {}", this.mapper);
	}//setup

	@Test
	public void testSelectJoinnedTable() throws Exception {
		log.debug("testSelectJoinnedTable() invoked.");
		
		List<TestVO> testVO = this.mapper.selectJoinnedTable(7);
		
		Objects.requireNonNull(testVO);
		testVO.forEach(log::info);
		
	}//testInsertMember

}//end class
