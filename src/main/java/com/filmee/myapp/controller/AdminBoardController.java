package com.filmee.myapp.controller;

import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.filmee.myapp.domain.BoardPageDTO;
import com.filmee.myapp.domain.BoardUserVO;
import com.filmee.myapp.domain.Criteria;
import com.filmee.myapp.service.BoardService;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/admin/")
public class AdminBoardController {
	
	@Autowired private BoardService service;

	//게시글 전체 목록조회
	@GetMapping("board")
	public String list(@ModelAttribute("cri")Criteria cri, Model model
			) {
		log.debug("list({},{}) invoked.",cri,model);
		Objects.requireNonNull(service);

		List<BoardUserVO> list = this.service.getList(cri);
		
		BoardPageDTO page = new BoardPageDTO(cri, this.service.getTotal(cri));
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",page);
		return "admin/board";
	}//list


}
