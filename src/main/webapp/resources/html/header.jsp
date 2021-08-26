<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
    <link rel="stylesheet" href="/resources/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="/resources/js/header.js"></script>
    <script>

        $(function(){
            console.clear();
            console.log('jq started');
       
            // 로그인 여부에 따라 보여주는 header 변경
            var loginKey = "${__LOGIN__}";

            console.log(loginKey);

            if(loginKey.length > 0){
                $("#strangerHeadermenu>li").attr("style", "display:none");
                $("#memberHeadermenu>li").attr("style", "display:inline");
            }

            //전달된 message가 있으면 alert
            var message = "${message}";

            switch(message){
                case 'login_required' :              
                    // $("#alert_modal p").text("로그인이 필요한 서비스입니다.");
                    // $("#alert_modal").modal("show");
                    
                    // var myModalEl = document.getElementById('alert_modal');
                    // myModalEl.addEventListener('hidden.bs.modal',function(){
                    //     $("#login").modal("show");
                    // });
                    $("#login").modal("show");
                    break;
                    
                case 'login_failed' :
                    // $("#alert_modal p").text("등록되지 않은 ID 혹은 비밀번호 입니다.");
                    // $("#alert_modal").modal("show");

                    // var myModalEl = document.getElementById('alert_modal');
                    // myModalEl.addEventListener('hidden.bs.modal',function(){
                    //     $("#login").modal("show");
                    // });
                    $("#login").modal("show");
                    break;
            
                case 'join' :
                    $("#join").modal("show");   
                    break;

                case 'join_succeeded' :
                    // $("#alert_modal p").text("회원가입이 완료되었습니다.");
                    $("#alert_modal").modal("show");
                    break;
                    
                case 'join_failed' :
                    // $("#alert_modal p").text("회원가입에 실패했습니다.");
                    $("#alert_modal").modal("show");
                    break;

                default :
            }	//switch-case

            $("#close_login_open_join").click(function(){
                $("#login").modal("hide");
                $("#join").modal("show");   
            });//close_login_open_join

        });//jq
    </script>

</head>
<body>
    <header>
        <div id="header">
            <a href="">
                <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
            </a>
            <!-- header for nonUser -->
            <ul id="strangerHeadermenu">
                <li><a href="#" id="login_a" data-bs-toggle="modal" data-bs-target="#login">LOGIN</a></li>
                <li><a href="#" data-bs-toggle="modal" data-bs-target="#join">CREATE ACCOUNT</a></li>
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
            <!-- header for user -->
            <ul id="memberHeadermenu">
             	 <li><a href="/main/logout">LOG OUT</a></li>
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
    </header>

    <!-- alert Modal -->
    <!-- <div class="modal fade" id="alert_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <p style="font-size: 15px; text-align: center;"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div> -->


    <!-- login Modal -->
    <div class="modal fade" id="login" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>LOGIN</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/main/loginPost" method="POST">
                        <div class="mb-3">
                            <label for="login_email" class="form-label"><b>Email</b></label>
                            <input type="email" class="form-control" id="login_email" name="email" placeholder="name@example.com" autocomplete="username">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><b>password</b></label>
                            <input type="password" class="form-control" id="login_password" name="password" placeholder="password" autocomplete="current-password">
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                            <input class="form-check-input" type="checkbox" name="rememberMe" id="rememberMe">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">SIGN IN</button>
                        </div>
                    </form>
                    <p>&nbsp;</p>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" type="button" id="close_login_open_join">JOIN</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- join Modal -->
    <div class="modal fade" id="join" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
            <h2 class="modal-title" id="staticBackdropLabel"><B>join</B></h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/main/joinPost" method="POST">
                    <div class="mb-3">
                        <label for="join_email" class="form-label"><b>Email</b></label>
                        <input type="email" class="form-control" id="join_email" name="email"placeholder="name@example.com" oninput="javascript:checkEmail()">
                    	<p id='email_message'></p>
                    </div>
                    <!-- <div class="input-group mb-3">
                        <label for="email" class="form-label"><b>Email</b></label>
                        <input type="email" class="form-control" id="email" placeholder="name@example.com" aria-label="name@example.com" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">check</button>
                        </div> -->
                    <div class="mb-3">
                        <label for="password" class="form-label"><b>password</b></label>
                        <input type="password" class="form-control" id="join_password" name="password" placeholder="password" oninput="javascript:checkPw()" autocomplete="new-password">
                        <p id='pw_message'></p>
                    </div>
                    <div class="mb-3">
                        <label for="nickname" class="form-label"><b>nickname</b></label>
                        <input type="text" class="form-control" id="nickname" name="nickname" placeholder="John" oninput="javascript:checkNickname()">
                        <p id='nick_message'></p>
                        </div>
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary sign_up_btn" type="submit" disabled><b>SIGN UP</b></button>
                    </div>
                </form>
            </div>
        </div>
        </div>
    </div>

</body>
</html>