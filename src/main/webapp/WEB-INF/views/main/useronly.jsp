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
   <h1>WEB-INF/views/main/useronly.jsp</h1>
	
	<hr>
	
	<button type="button" id="logout">로그아웃</button>
	
</body>
</html>