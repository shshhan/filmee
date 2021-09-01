package com.filmee.myapp.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
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

		//Session Scope에서 기존 로그인 정보 획득
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);	
		
		//기존 로그인 정보가 있다면 삭제
		if(user != null) {			
			session.removeAttribute(MainController.loginKey);
			
			log.info(">>>>> LoginKey removed. >>>>>");
		}//if
	
		return true;
	}//preHandle
	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("postHandle(request, response, handler, {}) invoked.", modelAndView);
		
		//MainController의 loginPost에서 Session Scope에 추가해둔 로그인 정보 획득
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute(MainController.loginKey);

		if( user != null && request.getParameter("rememberMe") != null){	//자동로그인 체크 후 로그인 성공했으면		
			Cookie rememberMeCookie = 		 ///현재 sessionId를 값으로 갖는 RememberMe 쿠키 생성
				new Cookie(LoginInterceptor.rememberMeKey, session.getId());
			
			rememberMeCookie.setMaxAge(60*60*24*7);		//쿠키 유효기간 7일
			rememberMeCookie.setPath("/");				//쿠키 경로 : 모든 경로
			
			response.addCookie(rememberMeCookie);		//응답문서에 쿠키 추가
			log.info(">>>>> RememberMeCookie added in Response. >>>>>");
		}//if
		
//		//Session Scope에서 기존 URI 획득 (로그인이 필요한 URI로 요청이 들어와 AuthInterceptor를 거친 경우)
//		String originalRequestURI = (String)session.getAttribute(AuthInterceptor.requestURIKey);
//		
//		if(originalRequestURI != null) {  //기존 URI가 있었다면 쿼리스트링까지 획득
//			String originalQueryString = (String)session.getAttribute(AuthInterceptor.queryStringKey);
//			
//			response.sendRedirect(
//						originalRequestURI +
//						(originalQueryString != null && !"".equals(originalQueryString) ?
//								"?"+originalQueryString : "")
//						);										//쿼리 스트링이 null이나 공백이 아니라면 URI+QueryString으로 Redirect
//				log.info(">>>>> Redirected to OriginalURI.");
//		}//if
//		
//		//Session Scope에 등록된 기존 URI 및 QueryString 삭제
//		session.removeAttribute(AuthInterceptor.requestURIKey);
//		session.removeAttribute(AuthInterceptor.queryStringKey);

	}//postHandle


}//end class
