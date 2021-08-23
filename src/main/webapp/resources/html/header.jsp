<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/modalLogin.css">
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
  
    <script>
    $(function(){
        console.clear();
        console.log('jq started..');
        
        $("#modal_open_btn").click(function(){
            $("#modal").attr("style", "display:block");
        });
    
        $("#modal_close_btn").click(function(){
            $("#modal").attr("style", "display:none");
        });   
    }); //jp

    </script>



</head>
<body>
    <header>
        <div id="header">
            <a href="">
                <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
            </a>
            <ul id="headermenu">
                <li><a href="#" id="modal_open_btn">LOGIN</a></li>
                <li><a href="">CREATE ACCOUNT</a></li>
                <li><a href="">BOARD</a></li>
                <li>
                    <input type="search" placeholder="Search" class="search-field" />
                    <button type="submit" class="search-button">
                    </button>
                </li>
                <li> <img src="/resources/img/search.png" width="20px" height="20px">
                </li>
            </ul>
        </div>
        
        
	<div id="modal">
	   
	    <div class="modal_content">
	       <form action="/main/loginPost" method="POST">
        <div>
            <label for="email">user email</label>
            &nbsp;
            <input type="text" id="email" name="email" placeholder="email">
        </div>

        <p> </p>

        <div>
            <label for="password">password</label>
            &nbsp;
            <input type="password" id="password" name="password" placeholder="password">
        </div>

        <p></p>
        
        <div>
        	Remember Me <input type="checkbox" name="rememberMe" checked>
        </div>
       
        <button type="submit">sign in</button>
    </form>
	       
	        <button type="button" id="modal_close_btn">모달 창 닫기</button>
	       
	    </div>
	   
	    <div class="modal_layer"></div>
	</div>

    </header>    
</body>
</html>