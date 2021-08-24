package com.filmee.myapp.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.JoinDTO;
import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.JoinService;
import com.filmee.myapp.service.LoginService;

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
		
		UserVO user = this.loginService.login(dto);
		
		if(user != null) {
			model.addAttribute(MainController.loginKey, user);
			
			if(dto.isRememberMe()) {
				String rememberCookie = session.getId();
				
				String email = dto.getEmail();
				
				Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24*7) );
				
				this.loginService.setUserRememberMe(email, rememberCookie, rememberAge);
			}//if
			
		}//if
		
	}//loginPost
	
	@GetMapping("/loginFailed")
	public String loginFailed(RedirectAttributes rttrs) {
		log.debug("loginFailed({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("message", "login_failed");
		
		return "redirect:/main";	//로그인 실패시 메세지와 함께 다시 로그인창
	}//loginFailed

	@GetMapping("/checkEmail")
	public @ResponseBody int check(String email) throws Exception {
		log.debug("idCheck({}) invoked.", email);
		
		int result = this.joinService.checkEmailDuplicated(email);
		
		return result;
	}//emailCheck
	
	@GetMapping("/join")
	public String join(RedirectAttributes rttrs) {
		log.debug("join(rttrs) invoked.");
		
		rttrs.addFlashAttribute("message", "join");
		
		return "redirect:/main";
	}
	
	@PostMapping("/joinPost")
	public String joinPost(JoinDTO dto, RedirectAttributes rttrs, Model model) throws Exception{
		log.debug("joinPost({}, rttrs, model) invoked.", dto);
		
		if( this.joinService.join(dto) == 1) {
			rttrs.addFlashAttribute("message", "join_succeeded");
		} else {
			rttrs.addFlashAttribute("message", "join_failed");
		}//if-else
		
		model.addAttribute("newMember", dto);	
		
		return "redirect:/main";
	}//joinPost
	
}//end class
