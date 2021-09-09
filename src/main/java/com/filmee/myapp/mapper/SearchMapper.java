package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.domain.SearchPeopleVO;


public interface SearchMapper {
	
	public abstract List<SearchFilmVO> getFilmList(String filmTitle);
	
	public abstract List<SearchPeopleVO> getFilmsWithPeople(String peopleId);

} //end interface
