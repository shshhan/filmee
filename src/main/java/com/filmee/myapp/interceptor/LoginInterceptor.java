package com.filmee.myapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
public class LoginInterceptor
	implements HandlerInterceptor{
	
	public static final String rememberMeKey = "__REMEMBER_ME__"; 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");

		HttpSession session = request.getSession();
		
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);	//기존에 로그인 성공여부 확인
		
		if(user != null) {			//기존 로그인 정보가 있다면 삭제
			session.removeAttribute(MainController.loginKey);
			
			log.info(">>>>> LoginKey removed. >>>>>");

		}//if
	
		return true;
	}//preHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("postHandle(request, response, handler, {}) invoked.", modelAndView);
			
		//Session Scope에 로그인 정보 바인딩
		
		UserVO user = (UserVO)modelAndView.getModelMap().get(MainController.loginKey);
		
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute(MainController.loginKey, user);
			log.info(">>>>> LoginKey on SessionScope. >>>>>");
			
			//RememberMe Cookie 생성 및 전송
			if(request.getParameter("rememberMe") != null){
				Cookie rememberMeCookie = 
						new Cookie(LoginInterceptor.rememberMeKey, session.getId());
				
				rememberMeCookie.setMaxAge(60*60*24*7);
				rememberMeCookie.setPath("/");
				
				response.addCookie(rememberMeCookie);
				log.info(">>>>> RememberMeCookie added in Response. >>>>>");
			}//if (rememberMe on)
			
			//기존 URL로 Redirect
			if(session.getAttribute(AuthInterceptor.requestURIKey) != null){
				String originalRequestURI = (String)session.getAttribute(AuthInterceptor.requestURIKey);
				String originalQueryString = (String)session.getAttribute(AuthInterceptor.queryStringKey);
				
				if(originalRequestURI != null) {
					response.sendRedirect(
							originalRequestURI +
							(originalQueryString != null && !"".equals(originalQueryString) ?
									"?"+originalQueryString : "")
							);
					log.info(">>>>> Redirected to OriginalURI.");
				}//if
						
				session.removeAttribute(AuthInterceptor.requestURIKey);
				session.removeAttribute(AuthInterceptor.queryStringKey);
				
			}else {		
				response.sendRedirect("/main");	//일단 로그인 성공하면 메인으로. 근데 기존에 있던 곳으로 돌아가야하지 않을까?
					//authInterceptor에서 넘어왔다면 url바꿔서 보낼 수 있는데 만약 어딘가에서 로그인을 눌러 들어온거라면
					//loginInterceptor preHandle에서 새롭게 url을 받을 시 auth에서 넘어온 것과 부딪힐듯
			}//if(originalURL != null) - else							

		}else {
			response.sendRedirect("/main/loginFailed");
		}//if(user != null) - else
	
	}//postHandle


}
