package com.filmee.myapp.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.JoinDTO;
import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.JoinService;
import com.filmee.myapp.service.LoginService;
import com.filmee.myapp.util.FilmeeUtil;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/main/")
@Controller
public class MainController {
	
	@Setter(onMethod_=@Autowired)
	private LoginService loginService;
	
	@Setter(onMethod_=@Autowired)
	private JoinService joinService;
	
	public static final String loginKey = "__LOGIN__";
	
	//View-Controller : main, logout
	
	@GetMapping("login")
	public String login(RedirectAttributes rttrs) {
		log.debug("login(rttrs) invoked.");
		
//		rttrs.addFlashAttribute("loginFailMessage", "로그인이 필요합니다.");
		rttrs.addFlashAttribute("message", "login_required");
		
		return "redirect:/main";		
	}//login
		
	@PostMapping("loginPost")
	public void loginPost(LoginDTO dto, Model model, HttpSession session) throws Exception {
		log.debug("loginPost({}, model, {}) invoked.", dto, session);
		
		String salt = this.loginService.getUserSalt(dto.getEmail());
		String hasedPw = FilmeeUtil.hashing(dto.getPassword(), salt);
		dto.setPassword(hasedPw);
		
		UserVO user = this.loginService.login(dto);
		
		if(user != null) {
			model.addAttribute(MainController.loginKey, user);
			
			if(dto.isRememberMe()) {
				String rememberCookie = session.getId();
				
				String email = dto.getEmail();
				
				Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24*7) );
				
				this.loginService.setUserRememberMe(email, rememberCookie, rememberAge);
			}//if(dto.isRememberMe())
			
		}//if(user != null)
		
	}//loginPost
	
	@GetMapping("/loginFailed")
	public String loginFailed(RedirectAttributes rttrs) {
		log.debug("loginFailed({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("message", "login_failed");
		
		return "redirect:/main";	//로그인 실패시 메세지와 함께 다시 로그인창
	}//loginFailed

	
	@GetMapping("/join")
	public String join(RedirectAttributes rttrs) {
		log.debug("join(rttrs) invoked.");
		
		rttrs.addFlashAttribute("message", "join");
		
		return "redirect:/main";
	}//join
	
	@ResponseBody
	@GetMapping("/checkEmail")
	public Integer checkEmail(String email) throws Exception {
		log.debug("checkEmail({}) invoked.", email);
		
		int result = this.joinService.checkEmailDuplicated(email);
		log.info("result : {}", result);
		
		return result;
	}//checkEmail
	
	@ResponseBody
	@GetMapping("/checkNickname")
	public Integer checkNickname(String nickname) throws Exception {
		log.debug("checkNickname({}) invoked.", nickname);
		
		int result = this.joinService.checkNicknameDuplicated(nickname);
		log.info("result : {}", result);
		
		return result;
	}//checkNickname
	

	
	@PostMapping("/joinPost")
	public String joinPost(JoinDTO dto, RedirectAttributes rttrs, Model model) throws Exception{
		log.debug("joinPost({}, rttrs, model) invoked.", dto);
		
		String salt = FilmeeUtil.getSalt();
		String hashedPw = FilmeeUtil.hashing(dto.getPassword(), salt);
		
		dto.setPassword(hashedPw);
		dto.setSalt(salt);
		
		if( this.joinService.join(dto) == 1) {	// 정상 회원가입 처리됐다면
			rttrs.addFlashAttribute("message", "join_succeeded");
		} else {
			rttrs.addFlashAttribute("message", "join_failed");
		}//if-else
		
		model.addAttribute("newMember", dto);	
		
		return "redirect:/main";
	}//joinPost
	
}//end class
