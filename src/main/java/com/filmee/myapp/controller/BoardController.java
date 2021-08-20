package com.filmee.myapp.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.BoardVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.domain.PageDTO;
import com.filmee.myapp.service.BoardService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/board/")
public class BoardController {

	@Autowired private BoardService service;
	
	@GetMapping("list")
	public String list(@ModelAttribute("cri")Criteria cri, Model model) {
		log.debug("list({},{}) invoked.",cri,model);
		Objects.requireNonNull(service);
		
		List<BoardVO> list = this.service.getList(cri);
		PageDTO page = new PageDTO(cri, this.service.getTotal(cri));
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",page);
		
		return "board/list";
	}//list
	
	@GetMapping({"get","modify"})
	public void get(
			@ModelAttribute("cri")Criteria cri, 
			@RequestParam("bno") 
			Integer bno, Model model
		) {
		log.debug("get({},{},{})invoked.",cri,bno,model);
		Objects.requireNonNull(service);
		
		BoardVO board = this.service.get(bno);
		log.info("\t+ board:{}",board);
		model.addAttribute(board);
	}//get
	
	@PostMapping("modify")
	public String modify(@ModelAttribute("cri")Criteria cri,BoardVO board, RedirectAttributes rttrs) {
		log.debug("modify({},{},{}) invoked.",cri,board,rttrs);
		Objects.requireNonNull(service);
		
		boolean isModified = this.service.modify(board);
		
		if(isModified) {
			rttrs.addAttribute("result","수정되었습니다.");
		}//if
		rttrs.addAttribute("currPage",cri.getCurrPage());
		rttrs.addAttribute("amount",cri.getAmount());
		rttrs.addAttribute("pagesPerPage",cri.getPagesPerPage());
		
		return "redirect:/board/list";
	}//modify
	
	@GetMapping("register")
	public void register(@ModelAttribute("cri")Criteria cri) {
		log.debug("GetMapping register({}) invoked.",cri);
	}//register
	
	@PostMapping("register")
	public String register(@ModelAttribute("cri")Criteria cri, BoardVO board, RedirectAttributes rttrs) {
		log.debug("register({},{},{}) invoked",cri,board,rttrs);
		Objects.requireNonNull(service);
		
		this.service.register(board);
		rttrs.addAttribute("result",board.getBno());
		rttrs.addAttribute("currPage",cri.getCurrPage());
		rttrs.addAttribute("amount",cri.getAmount());
		rttrs.addAttribute("pagesPerPage",cri.getPagesPerPage());
			
		return "board/get";
	}//register
	
	@PostMapping("remove")
	public String remove(
			@ModelAttribute("cri")Criteria cri,
			@RequestParam("bno") Integer bno, 
			RedirectAttributes rttrs) {
		log.debug("remove({},{},{}) invoked.",cri,bno,rttrs);
		
		if(this.service.remove(bno)) {
			rttrs.addAttribute("result","삭제되었습니다.");
		}//if
		rttrs.addAttribute("currPage",cri.getCurrPage());
		rttrs.addAttribute("amount",cri.getAmount());
		rttrs.addAttribute("pagesPerPage",cri.getPagesPerPage());
		
		return "redirect:/board/list";
	}//remove
	
}//end class
