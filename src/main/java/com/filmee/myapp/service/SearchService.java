package com.filmee.myapp.service;

import java.util.List;

import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.domain.SearchPeopleVO;


public interface SearchService {
	
	public abstract List<SearchFilmVO> searchFilmAutoComplete(String filmTitle);

	public abstract List<SearchPeopleVO> serachFilmsByPeopleName(String peopleName);
} //end interface
