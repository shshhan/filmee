package com.filmee.myapp.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.filmee.myapp.controller.MainController;
import com.filmee.myapp.domain.UserVO;
import com.filmee.myapp.service.LoginService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor
public class AuthInterceptor 
	implements HandlerInterceptor {

	public static final String requestURIKey = "__REQUEST_URI__";
	public static final String queryStringKey = "__QUERYSTRING__";
	
	@Setter(onMethod_= @Autowired)
	private LoginService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("preHandle(request, response, handler) invoked.");
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);
		
		if(user != null) {
			log.info(">>>>> Login Authenticated. >>>>>");
			
			return true;
			
		} else {
			
			//URI & QueryString session scope에 바인딩
			String originalRequestURI = request.getRequestURI();
			String originalQueryString = request.getQueryString();
			
			session.setAttribute(AuthInterceptor.requestURIKey, originalRequestURI);
			session.setAttribute(AuthInterceptor.queryStringKey, originalQueryString);
			
			//RememberMe 쿠키 있는지 확인
			Cookie rememberMeCookie = WebUtils.getCookie(request, LoginInterceptor.rememberMeKey);
			
			if(rememberMeCookie != null) {
				String rememberMe = rememberMeCookie.getValue();
				
				user = this.service.findUserWithCookie(rememberMe);
				
				if(user != null) {
					//로그인 처리
					session.setAttribute(MainController.loginKey, user);
					log.info(">>>>> LoginKey on SessionScope. >>>>>");

					//새로운 세션으로 접속 시 rememberMeCookie 갱신
					String sessionId = session.getId();
					
					this.service.setUserRememberMe(
							user.getEmail(),
							sessionId,
							new Date(System.currentTimeMillis() + (1000*60*60*24*7))
							);
									
					rememberMeCookie = new Cookie(LoginInterceptor.rememberMeKey, sessionId);
							
					rememberMeCookie.setMaxAge(60*60*24*7);
					rememberMeCookie.setPath("/");
					
					response.addCookie(rememberMeCookie);
					log.info(">>>>> RememberMeCookie Renewed. >>>>>");
					
					return true;	//요청이 컨트롤러로 전달.
					
				}	//if(user!=null)
				
			}//if(rememberMeCookie != null)
			
			response.sendRedirect("/main/login");
			log.info("Redirected to /main/login");
			
			return false;	//요청이 컨트롤러로 전달되지 못함
			
		}//if-else
		
	}//preHandle
	
}//end class
