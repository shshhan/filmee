package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.TestVO;

public interface TestMapper {

	public abstract List<TestVO> selectJoinnedTable(Integer userId) throws Exception;
	
}
