<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main.jsp</title>
</head>
<body>
	    <%@include file="/resources/html/header.jsp"  %>
	
	<h1>WEB-INF/views/main/main.jsp</h1>
	
	<hr>

	<button type="button" id="logout">로그아웃</button>
	
	<hr>
	<p></p>
	
	<div id="root">
   
    <button type="button" id="modal_open_btn">모달 창 열기</button>
       
	</div>	

</body>
</html>