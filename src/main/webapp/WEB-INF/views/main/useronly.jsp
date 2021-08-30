<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>useronly.jsp</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>


	<script>
		$(function(){
			console.clear();
			console.log('jq started...');

   			$('#logout').click(function(){
				console.debug('#logout button clicked...');
				location.href="/main/logout";
			});	//logout
			
		});	//jq
	</script>

</head>

<body>
   <%@include file="/resources/html/header.jsp"  %>

   <h1>WEB-INF/views/main/useronly.jsp</h1>
	
	<hr>

	회원만 접근할 수 있는 주소 테스트하려고 만든 페이지
		
    <%@include file="/resources/html/footer.jsp" %>
	
</body>
</html>