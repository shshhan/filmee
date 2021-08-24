<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/header.css">
    
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
  
    <script>
    $(function(){
        console.clear();
        console.log('jq started..');
        
        var loginFailMessage = "${loginFailMessage}";
        if(loginFailMessage.length > 0){
            alert(loginFailMessage);
            
            $("#loginModal").attr("style", "display:block");
        }//if
        
        
        var loginKey = "${__LOGIN__}";
        console.log('logkinKey : ', loginKey);
        
       if(loginKey.length > 0){
            $("#strangerHeadermenu").attr("style", "display:none");
        }else{
        	$("#memberHeadermenu").attr("style", "display:none");
        }//if-else
        
        	
        $("#login_modal_a").click(function(){
            $("#loginModal").attr("style", "display:block");
        });//login_modal_a
    
        $(".modal_close_btn").click(function(){
            $("#loginModal").attr("style", "display:none");
            $("#joinModal").attr("style", "display:none");
        });//modal_close_btn
      
        $("#join_modal_a").click(function(){
            $("#joinModal").attr("style", "display:block");
        });//join_modal_a
        
        
        $("logout_a").click(function(e){
        	e.preventDefault;

            location.href="/main/logout";
        });//logout_a
        

    });//jquery

    </script>

</head>
<body>
    <header>
        <div id="header">
            <a href="">
                <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
            </a>     
            <ul id="strangerHeadermenu">
                <li><a href="#" id="login_modal_a">LOGIN</a></li>
                <li><a href="#" id="join_modal_a">CREATE ACCOUNT</a></li>
                <li><a href="/main/strangerPage">STRANGER</a></li>                              
                <li><a href="/main/useronly">BOARD</a></li>                              
                <li>
                    <input type="search" placeholder="Search" class="search-field" />
                    <button type="submit" class="search-button">
                    </button>
                </li>
                <li> <img src="/resources/img/search.png" width="20px" height="20px">
                </li>
            </ul>
            <ul id="memberHeadermenu">
             	 <li><a href="/main/logout" id="logout_a">LOG OUT</a></li>
                <li><a href="#" id="">~~~~</a></li>
                <li><a href="/main/strangerPage">STRANGER</a></li>                              
                <li><a href="/main/useronly">BOARD</a></li>                              
                <li>
                    <input type="search" placeholder="Search" class="search-field" />
                    <button type="submit" class="search-button">
                    </button>
                </li>
                <li> <img src="/resources/img/search.png" width="20px" height="20px">
                </li>
            </ul>
     
        </div>
        
	    <div id="loginModal">
            <div class="modal_content">
                <form action="/main/loginPost" method="POST">
                    <div>
                        <label for="loginEmail">user email</label><br>
                        <input type="email" id="loginEmail" name="email" placeholder="email">
                    </div>
                    <p>&nbsp;</p>
                    <div>
                        <label for="loginPassword">password</label><br>
                        <input type="password" id="loginPassword" name="password" placeholder="password">
                    </div>
                    <p>&nbsp;</p>
                    <div>
                        Remember Me <input type="checkbox" name="rememberMe" checked>
                    </div>
                    <button type="submit">sign in</button>
                </form>
                <button type="button" class="modal_close_btn">close</button>
            </div>
            <div class="modal_layer"></div>
        </div>

        <div id="joinModal">
            <div class="modal_content">
                <form action="" method="POST">
                    <div>
                        <label for="joinEmail">EMAIL</label><br>
                        <input type="email" id="joinEmail" name="email" placeholder="email">
                    </div>
                    <p>&nbsp;</p>
                    <div>
                        <label for="joinNickname">NICKNAME</label><br>
                        <input type="text" id="joinNickname" name="nickname" placeholder="nickname">
                    </div>
                    <p>&nbsp;</p>
                    <div>
                        <label for="joinPassword">password</label><br>
                        <input type="password" id="joinPassword" name="password" placeholder="password">
                    </div>
                    <button type="submit">JOIN</button>
                </form>
                <button type="button" class="modal_close_btn">close</button>
            </div>
            <div class="modal_layer"></div>
        </div>

    </header>    
</body>
</html>