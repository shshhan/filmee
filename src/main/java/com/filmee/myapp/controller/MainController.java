package com.filmee.myapp.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.filmee.myapp.domain.LoginDTO;
import com.filmee.myapp.domain.UserVO;
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
	private LoginService service;
	
	public static final String loginKey = "__LOGIN__";
	
	//View-Controller : main, logout
	
	@PostMapping("loginPost")
	public void loginPost(LoginDTO dto, Model model, HttpSession session) throws Exception {
		log.debug("loginPost({}, model, {}) invoked.", dto, session);
		
		UserVO user = this.service.login(dto);
		
		if(user != null) {
			model.addAttribute(MainController.loginKey, user);
			
			if(dto.isRememberMe()) {
				String rememberCookie = session.getId();
				
				String email = dto.getEmail();
				
				Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24*7) );
				
				this.service.setUserRememberMe(email, rememberCookie, rememberAge);
			}//if
			
		}//if
		
	}//loginPost
	
	@GetMapping("/loginFailed")
	public String loginFailed(RedirectAttributes rttrs) {
		log.debug("loginFailed({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("failMessage", "등록되지 않은 Email 혹은 비밀번호입니다.");
		
		return "redirect:/main/login";	//로그인 실패시 메세지와 함께 다시 로그인창
	}//loginFailed
		
}//end class
