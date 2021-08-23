package com.filmee.myapp.mapper;

import java.sql.Timestamp;

public interface JoinMapper {

	public abstract int insertMember(
			String email, String password, String nickname, char isAdmin, Timestamp joinTs
			) throws Exception;
}
