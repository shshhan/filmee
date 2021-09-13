package com.filmee.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.CriteriaFilmReview;
import com.filmee.myapp.domain.CriteriaReview;
import com.filmee.myapp.domain.FilmGenreVO;
import com.filmee.myapp.domain.FilmPeopleVO;
import com.filmee.myapp.domain.FilmVO;
import com.filmee.myapp.domain.ReviewDTO;
import com.filmee.myapp.domain.ReviewFilmUserVO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.FilmService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/film/")
@Controller
public class FilmController {

	@Setter(onMethod_ = @Autowired)
	private FilmService service;


//	@GetMapping("info")
//	public String getFilmInfo(@RequestParam("filmid") Integer film_id, Model model) {
	@GetMapping("/{filmid}")
	public String getFilmInfo(@PathVariable("filmid") Integer film_id, Integer rno, Model model) {
		log.debug("getFilmInfo({}, {}, {}) invoked.", film_id, rno, model);

		FilmVO filmVO = this.service.getFilmInfo(film_id);
		List<FilmPeopleVO> filmPeopleVOList = this.service.getFilmPeople(film_id);
		List<FilmGenreVO> filmGenreVOList = this.service.getGenre(film_id);
		List<ReviewFilmUserVO> reviewFilmUserVOList = this.service.getList(film_id);

		assert filmVO != null;
		assert filmPeopleVOList != null;
		assert filmGenreVOList != null;
		assert reviewFilmUserVOList != null;

		// 일단 막아둠
//		log.info("\t+ filmVO: {}", filmVO);
//		filmPeopleVOList.forEach(log::info);
//		filmGenreVOList.forEach(log::info);
//		reviewFilmUserVOList.forEach(log::info);

		model.addAttribute("filmVO", filmVO);
		model.addAttribute("filmPeopleVOList", filmPeopleVOList);
		model.addAttribute("filmGenreVOList", filmGenreVOList);
		model.addAttribute("reviewFilmUserVOList", reviewFilmUserVOList);

		return "film";
	} // getFilmInfo

	// ----------------------------------------------------//

//	@GetMapping({"/review/{rno}", "modify" })  // modify는 get 성공한뒤에 생각할거.....
	@GetMapping("{filmid}/review/{rno}")
	public String getReview(@PathVariable("filmid") Integer film_id, @PathVariable("rno") Integer rno,
			@ModelAttribute("cri") CriteriaFilmReview cri, Model model) {
		log.debug("readReview({}, {}) invoked.", rno, model);

		ReviewFilmUserVO reviewFilmUserVO = this.service.get(rno);

		assert reviewFilmUserVO != null;
		log.info("\t+ reviewFilmUserVO: {}", reviewFilmUserVO);

		model.addAttribute("reviewFilmUserVO", reviewFilmUserVO);

		return "review/get";
	} // getReview


	@PostMapping("/{filmid}/review/register")
	public String register(@PathVariable("filmid") Integer film_id, 
							@ModelAttribute("reviewCri") CriteriaFilmReview cri,
							ReviewDTO review, 
							HttpSession session,
							UserVO user,
							RedirectAttributes rttrs) {
		log.debug("register({}, {}, {}, {}) invoked.", film_id, cri, review, rttrs);

//		Integer writer = (Integer) session.getAttribute("userId");

		
//		// 로그인한 사용자의 아이디
//		Integer writer = (Integer) session.getAttribute("userId");
////        review.setWriter(writer); 
////        
//		review.setWriter(writer);
////		review.setFilm_id(film_id);
//		
//		Integer filmIdPath = review.getFilm_id();
		this.service.register(review);
		

		rttrs.addFlashAttribute("result", review.getRno());

//		return "redirect:/film/" + filmIdPath; // 리뷰쓴 영화의 상세페이지나, 마이페이지의 리뷰페이지로 redirect
		return "redirect:/film/{filmid}";
	} // registerReview

	@GetMapping("/{filmid}/review/register")
	public String register(@PathVariable("filmid") Integer film_id,							
							@ModelAttribute("reviewCri") CriteriaFilmReview cri, 
							Model model) {
		log.debug("register({}, {}) invoked.", film_id, cri);
		
		FilmVO filmVO = this.service.getFilmInfo(film_id);
		

		model.addAttribute("filmVO", filmVO);

		return "review/register";
	} // register

//	@GetMapping("list")
//	public void getReviewList(Integer film_id, Model model) {
//		log.debug("list({}) invoked.", model);
//		
//		List<ReviewVO> reviewList = this.service.getList(film_id);
//		
//		Objects.requireNonNull(reviewList);
//		reviewList.forEach(log::info);
//		
//		model.addAttribute("reviewList", reviewList);
//	} // getReviewList
//
//	@PostMapping("remove")
//	public String remove(
//			@ModelAttribute("cri") Criteria cri,
//			@RequestParam("rno") Integer rno,
//			RedirectAttributes rttrs
//		) {
//		log.debug("remove({}, {}) invoked.", rno, rttrs);
//		
//		int removedReview = this.service.remove(rno);
//		if(removedReview == 1) {	// 삭제성공 일 때
//			rttrs.addFlashAttribute("result", "success");
//		} // if
//
//		rttrs.addAttribute("currPage", cri.getCurrPage());
//		rttrs.addAttribute("amount", cri.getAmount());
//		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());
//		
//		return "마이페이지-리뷰url";
//	} // remove
	
	@PostMapping("review/remove")
	public String remove(@ModelAttribute("criR")CriteriaReview criR, @RequestParam("rno") Integer rno, RedirectAttributes rttrs) {
		log.debug("deleteMyReview({}, {}) invoked.", rno, rttrs);
		
		int removed = this.service.remove(rno);
			
		rttrs.addAttribute("userid", criR.getUserid());		
		rttrs.addAttribute("currPage", criR.getCurrPage());
		rttrs.addAttribute("amount", criR.getAmount());
		rttrs.addAttribute("pagesPerPage", criR.getPagesPerPage());
		
		return "redirect:/mypage/myreviews";
	} //deleteMyReview
	
	
	
	
//	
//	@PostMapping("modify")
//	public String modify(
//			@ModelAttribute("cri") Criteria cri,
//			ReviewVO review,
//			RedirectAttributes rttrs) {
//		log.debug("modifyReview({}, {}) invoked.", review, rttrs);
//		
//		int modifiedReview = this.service.modify(review);
//		
//		if(modifiedReview == 1) {
//			rttrs.addFlashAttribute("result", "success");
//		} // if
//		
//		rttrs.addAttribute("currPage", cri.getCurrPage());
//		rttrs.addAttribute("amount", cri.getAmount());
//		rttrs.addAttribute("pagesPerPage", cri.getPagesPerPage());
//		
//		return "redirect:/film/modify";
//	} //modify
//	
//	@GetMapping("listPerPage")
//	public String listPerPage(
//			@ModelAttribute("cri")
//			Criteria cri,
//			Model model
//		) {
//		log.debug("listPerPage({}) invoked.", model);
//		
//		List<ReviewVO> reviewList = this.service.getListWithPaging(cri);
//		
//		Objects.requireNonNull(reviewList);
//		reviewList.forEach(log::info);
//		
//		PageDTO pageDTO = new PageDTO(cri, this.service.getTotalCount(cri));
//		
//		model.addAttribute("reviewList", reviewList);
//		model.addAttribute("pageMaker", pageDTO);
//		
//		return "film/list";
//	} // listPerPage
	
	
		// 좋아요
		@PostMapping("like/{rno}/{userid}")
		public ResponseEntity<String> likeIt( 
				@PathVariable("bno") int rno,
				@PathVariable("userid") int userid
			){
			log.debug("likeIt({},{}) invoked.", rno,userid);
			
			int aLine = this.service.likeCheck(rno, userid);
			
			return aLine == 1 ?
					new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}//likeIt
		
		//좋아요 취소
		@PostMapping("unlike/{rno}/{userid}")
		public ResponseEntity<String> unLike(
				@PathVariable("bno") int rno,
				@PathVariable("userid") int userid
				){
			log.debug("unLike({},{}) invoked.", rno,userid);
			
			int aLine = this.service.likeUncheck(rno, userid);
			
			return aLine == 1 ?
					new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}//unLike

} // end class
