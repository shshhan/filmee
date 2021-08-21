package com.filmee.myapp.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@ControllerAdvice				// 모든 패키지에서 발생하는 예외를 처리
//@ControllerAdvice(
//		basePackages = {"org.zerock.myapp.controller"}	//컨트롤러가 있는 패키지만 지정해서 그곳의 예외만 처리 
//		)
//@ControllerAdvice("org.zerock.myapp.controller")	//basePackages가 default이기 때문에 이렇게 해도 무방
public class CommonExceptionHandler {	//예외처리용 클래스
										//Alternative path
	
	
	
//	@ExceptionHandler({BindException.class, NullPointerException.class})		//특정 예외만을 처리하는 메서드
//	public String handleBindException() {
//		
//	}//handleXXXException
	
	@ResponseStatus(code = HttpStatus.NOT_FOUND)
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String handleNoHandlerFoundException(
			Exception e, Model model) {		//Exception 객체를 받아올 수 있음
		log.debug("handleNoHandlerFoundException(e, model) invoked.");
		
		log.error("1. Exception Type : " + e.getClass().getName());
		log.error("2. Exception Message : " + e.getMessage());
		
		model.addAttribute("exception", e);
		//화면으로 보낼 내용 있을 때 model 생성
		
		return "errorPage";	// viewResolver 작동
	}//handleNoHandlerFoundException
	
	
	@ExceptionHandler(BindException.class)
	public String handleBindException(
			Exception e, Model model) {		//Exception 객체를 받아올 수 있음
		log.debug("handleNoHandlerFoundException(e, model) invoked.");
		
		log.error("1. Exception Type : " + e.getClass().getName());
		log.error("2. Exception Message : " + e.getMessage());
		
		model.addAttribute("exception", e);
		//화면으로 보낼 내용 있을 때 model 생성
		
		return "errorPage";	// viewResolver 작동
	}//handleBindException
	
	
	@ExceptionHandler(IllegalStateException.class)
	public String handleIllegalStateException(
			Exception e, Model model) {		//Exception 객체를 받아올 수 있음
		log.debug("handleNoHandlerFoundException(e, model) invoked.");
		
		log.error("1. Exception Type : " + e.getClass().getName());
		log.error("2. Exception Message : " + e.getMessage());
		
		model.addAttribute("exception", e);
		//화면으로 보낼 내용 있을 때 model 생성
		
		return "errorPage";	// viewResolver 작동
	}//handleIllegalStateException
	
	
}//end class
