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
import com.filmee.myapp.service.MailSendService;
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
	
	@Setter(onMethod_=@Autowired)
	private MailSendService mailService;
	
	public static final String loginKey = "__LOGIN__";
	
	//View-Controller : main, logout
	
	@GetMapping("login")
	public String login(RedirectAttributes rttrs) {
		log.debug("login(rttrs) invoked.");
		
		rttrs.addFlashAttribute("message", "login_required");
		
		return "redirect:/main";		
	}//login
		
	@PostMapping("loginPost")
	public void loginPost(LoginDTO dto, Model model, HttpSession session, RedirectAttributes rttrs) throws Exception {
		log.debug("loginPost({}, model, {}) invoked.", dto, session);
		
		String salt = this.loginService.getUserSalt(dto.getEmail());
		String hashedPw = FilmeeUtil.hashing(dto.getPassword(), salt);
		dto.setPassword(hashedPw);
		
		UserVO user = this.loginService.login(dto);
		
		if(user != null) {
			model.addAttribute(MainController.loginKey, user);	//로그인 정보를 model에 저장
			
			if(dto.isRememberMe()) {	//Remember me on이면 DB에 쿠키정보 저장
				String rememberCookie = session.getId();
				
				String email = dto.getEmail();
				
				Date rememberAge = new Date(System.currentTimeMillis() + (1000*60*60*24*7) );
				
				this.loginService.setUserRememberMe(email, rememberCookie, rememberAge);
			}//if(dto.isRememberMe())
						
		}//if(user != null)
		
		
		
		
	}//loginPost
	
	@GetMapping("/loginFailed/noInfo")
	public String loginFailedNoInfo(RedirectAttributes rttrs) {
		log.debug("loginFailed({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("message", "login_failed_no_info");
		
		return "redirect:/main";	//로그인 실패시 메세지와 함께 다시 로그인창
	}//loginFailedNoInfo
	
	@GetMapping("/loginFailed/unauthorized")
	public String loginFailedUnauthorized(RedirectAttributes rttrs) {
		log.debug("loginFailed({}) invoked.", rttrs);
		
		rttrs.addFlashAttribute("message", "email_unauthorized");
		
		return "redirect:/main";	//로그인 실패시 메세지와 함께 다시 로그인창
	}//loginFailedNoInfo

	
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
		
		String authCode = mailService.sendAuthMail(dto.getEmail());
		dto.setAuthCode(authCode);
		
		if( this.joinService.join(dto) == 1) {	// 정상 회원가입 처리됐다면
			rttrs.addFlashAttribute("message", "just_joinned");
		} else {
			rttrs.addFlashAttribute("message", "join_failed");
		}//if-else
		
		model.addAttribute("newMember", dto);	
		
		return "redirect:/main";
	}//joinPost
		
	@GetMapping("/emailAuthorized")
	public String emailAuthorized(String email, String authCode, RedirectAttributes rttrs) throws Exception {
		log.debug("emailAuthroized({}, {}) invoked.", email, authCode);
		
		if(this.joinService.isEmailAuthorized(email, authCode)) {
			rttrs.addFlashAttribute("message", "join_complete");
		} else {
			rttrs.addFlashAttribute("message", "email_unauthroized");
		}//if-else	
		
		return "redirect:/main";
	}//emailAuthroized
	
}//end class
