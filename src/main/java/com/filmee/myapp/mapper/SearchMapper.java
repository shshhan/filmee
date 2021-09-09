package com.filmee.myapp.mapper;

import java.util.List;

import com.filmee.myapp.domain.CriteriaSearch;
import com.filmee.myapp.domain.SearchFilmInfoVO;
import com.filmee.myapp.domain.SearchFilmVO;
import com.filmee.myapp.domain.SearchUserVO;


public interface SearchMapper {
	
	public abstract List<SearchFilmVO> getFilmList(String filmTitle);
	
	public abstract List<SearchUserVO> getUserList(String nickname);
	
	public abstract List<SearchFilmVO> getFilmListPage(CriteriaSearch cri);
	
	public abstract List<SearchFilmInfoVO> getFilmListInfo(CriteriaSearch cri);
	
	public abstract List<SearchUserVO> getUserListPage(CriteriaSearch cri);
	
	public abstract int getTotalCountFilmSearch(CriteriaSearch cri);
	
	public abstract int getTotalCountUserSearch(CriteriaSearch cri);

} //end interface
