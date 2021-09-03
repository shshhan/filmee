<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
	<head>
    	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>header</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
    	
    	<script src="/resources/js/header.js"></script>
        
        <script>

	      //====== 쿠키 ======
	
	        function getCookie(key){
	        	let cookieKey = key + "=";
	        	let result = "";
	        	const cookieArr = document.cookie.split(";");   //cookie를 가져와서 ;를 단위로 나눠 배열로 저장
	
	        	for(let i =0; i<cookieArr.length; i++){ //각 쿠키의 길이만큼 순회
	        		if(cookieArr[i][0] === " "){        //쿠키의 첫문자가 공백이라면
	        			cookieArr[i] = cookieArr[i].substring(1);   //공백을 제외한 값을 다시 저장
	        		}//if
	
	        		if(cookieArr[i].indexOf(cookieKey) === 0){  //쿠키를 순회하며 내가 지정한 쿠키의 이름으로 시작하는 쿠키 검색
	        			result = cookieArr[i].slice(cookieKey.length, cookieArr[i].length); //쿠키의 값만 result 변수에 저장
	        			console.log("Cookie : ", cookieKey+result);
	
	        			return result; //내가 찾고자 했던 쿠키의 값을 반환
	        		}//if
	        	}//for
	
	        }//getCookie
	
	        function deleteCookie(name){
	        	document.cookie = name + "=;expires= Thu, 02 Sep 2021 00:00:10 GMT;domain=localhost;path=/;"
	        }//deleteCookie
	        
	        
            $(function() {
                console.log('jq started.');
        
                //로그인 여부에 따라 보여주는 header 변경
                if("${__LOGIN__}".length > 0){	//로그인 돼있을 경우
                    $(".strangerHeadermenu").attr("style", "display:none");
                    $(".memberHeadermenu").attr("style", "display:inline");
                }//if

                //전달된 message가 있으면 alert
                switch("${message}"){
                    //====== 회원가입 관련 ======

                    //회원가입 버튼을 누를 시
                    // case 'join' :
                    //     $("#join").modal("show");   
                    //     break;

                    //회원가입을 마쳤을 시
                    case 'just_joinned' :
                        $("#alert_modal p").text("회원가입완료! 이메일 인증 완료 후 로그인 가능합니다.");
                        $("#alert_modal").modal("show");
                        break;

                    //회원가입 실패시
                    case 'join_failed' :
                        $("#alert_modal p").text("회원가입에 실패했습니다.");
                        $("#alert_modal").modal("show");
                        break;

                        //alert modal 닫기 버튼을 누르면 바로 login modal을 띄움
                        var myModalEl = document.getElementById('alert_modal');
                        myModalEl.addEventListener('hidden.bs.modal',function(){
                            $("#join").modal("show");
                        });
                        break;
                    
                    //회원가입 후 이메일 인증까지 마쳤을 시
                    case 'join_complete' :
                        $("#alert_modal p").text("이메일 인증이 완료되었습니다. 로그인 가능합니다.");
                        $("#alert_modal").modal("show");
                        break;

                    //임시비밀번호 발송시
                    case 'temp_pw_sent' :
                        $("#alert_modal p").text("임시비밀번호를 발송했습니다.");
                        $("#alert_modal").modal("show");
                        break;
                    
                    //비밀번호 찾기에서 미가입 이메일 입력시
                    case 'no_info_forgot_pw' :
                        $("#alert_modal p").text("등록되지 않은 이메일 주소입니다.");
                        $("#alert_modal").modal("show");
                        break;
                    
                    case 'pw_changed' :
                        $("#alert_modal p").text("비밀번호가 변경되었습니다.");
                        $("#alert_modal").modal("show");
                        break;

                    default :
                };	//switch-case
                               
                $(".login_submit_btn").on('click', function(){
                    console.log("SIGN in btn clicked.");

                    let formData = $("#login_form").serialize();
                    console.log("formData :", formData);

                    $.ajax({
                    	async : true,
                        data : formData,
                        type : 'post',
                        url : "/main/loginPost",
                        dataType : 'json',
                        success : function(data){
                            console.log("data :", data);
                            console.log("cookieValue:",data.cookieValue);
                            console.log("data.loginNum:",data.loginNum);
                            console.log("data.isRememberMe:", data.isRememberMe);
                            
                            let uriCookie = getCookie("__ORIGINAL_REQUEST_URI__");
                            console.log("uriCookie :", uriCookie);

                            let alertModalEl = document.getElementById('alert_modal');

                            switch(data.loginNum){
                                case '1' :
                                	console.log("longinNum : 1");
                                    $("#login").modal("hide");

                                    $("#alert_modal p").text("등록되지 않은 이메일 혹은 비밀번호입니다.");
                                    $("#alert_modal").modal("show");

                                    alertModalEl.addEventListener('hidden.bs.modal',function(){
                                        $("#login").modal("show");
                                    });
                            
                                    break;
                                    
                                case '2':
                                	console.log("longinNum : 2");

                                    $("#login").modal("hide");

                                    $("#alert_modal p").text("이메일 인증 후 로그인 가능합니다.");
                                    $("#alert_modal").modal("show");
                           
                                    
                                    if(uriCookie != null){      //
                                        alertModalEl.addEventListener('hidden.bs.modal',function(){
                                            deleteCookie("__ORIGINAL_REQUEST_URI__");
                                            history.go(-1);
                                        });//modal close listener
                                    }//ifk

                                    break;

                                case '3':
                                	console.log("longinNum : 3");

                                	if(data.isRememberMe == 'true'){    //RemeberMe 체크하고 로그인 했을 시
                                        
                                        //RemberMe 쿠키의 이름과 값, 유효기간 설정
                                        let rememberMeCookie = 
                                        "__REMEMBER_ME__=" + data.cookieValue + ";expires=" + data.rememberAge;
                                        
                                        //만든 설정대로 쿠키 생성
                                        document.cookie = rememberMeCookie;
                                    }//if
                                    
                                    if(uriCookie != null){
                                        location.href=uriCookie;
                                    } else{
                                        location.reload();
                                    }//if-else
                                    // //Session Scope에서 기존 URI 획득 (로그인이 필요한 URI로 요청이 들어와 AuthInterceptor를 거친 경우)                                                    
                                    // var originalRequestURI = "${__REQUEST_URI__}";
									// console.log("originalRequestURI :", originalRequestURI);
                                    
                                    // if(originalRequestURI.length > 0){      //기존 URI가 있었다면 쿼리스트링까지 획득
                                    //     var originalQueryString = "${__QUERYSTRING__}";
    								// 	console.log("originalQueryString :", originalQueryString);

                                    //      //쿼리 스트링이 null이나 공백이 아니라면 URI+QueryString으로 Redirect
                                    //     var uri = 
                                    //     originalRequestURI + ( (originalQueryString != null) && ( !(originalQueryString==="") ) ? "?"+originalQueryString : "" );  
                                        
                                    //     // console.log("uri :", uri);

                                    //     location.href=uri;  
                                    // }else{          //기존 URI가 없었다면 main으로 Redirect	(로그인 버튼으로 직접 요청이 들어온 경우)
                                    //    location.reload();
                                    // }//if-else

                                    break;
                            }//switch-case

                        } //success

                    });//ajax
			    });//onclick .login_submit_btn

                //login modal에서 join 버튼 누를 시 login modal 닫고 join modal 띄움
                $("#close_login_open_join").click(function(){
                    $("#login").modal("hide");
                    $("#join").modal("show");   
                });//close_login_open_join
                
        
                $('#header_search').on('propertychange change keyup paste input', function() {

                    var filmTitle = $('#header_search').val();
                    var filmTitleComplete = {filmTitle : filmTitle};

                    $.ajax({
                        url:'/search/searchFilmAutoComplete',
                        type:'post',
                        data: filmTitleComplete,
                        success : function(listFilm) { 
                            
                            $('#autocomplete_result_list').css('display', 'inline-block');
                            $('#autocomplete_result_list').css('z-index', 3);
                            
                            $('.searchTrTemp').remove();
                    
                            console.log('length :' + listFilm.length);
                            
                            for(var i = 0; i < listFilm.length; i++) {
                                console.log('poster : ' + listFilm[i].poster);
                                console.log('title : ' + listFilm[i].title);
                                
                                $('#searchTr').append("<tr class='searchTrTemp' id='searchTr"+i+"'>");
                                $('#searchTr'+i).append("<td class='searchTd' id='searchTd"+i+"' style='width: 300px'>");                    			
                                
                                $('#searchTd'+i).append("<a href='#'><img src='https://www.themoviedb.org/t/p/original"+listFilm[i].poster+"' style='width:150px; height:100px; float: left;'></a>");
                                $('#searchTd'+i).append("<a href='#' id='searchTitle' style='float: left;'>"+listFilm[i].title+"</a>");
                            
                            } //for
                            
                        } //success
                    
                    }); //ajax
                    
                }); //propertychange change keyup paste input

            }); //.jq        

        </script>
    	
    	<style>    		

			#header{
			    width: 998px;
			    height: 150px;
			    margin: 0 auto;
			    background-color: rgba(240, 230, 230, 0);
			    font-size: 20px;
			    font-family: 'Florencesans SC Exp';
			}
			
            #header_nav_logo {
			    width: 200px;
			    margin: 0;
			}

            #autocomplete_result_list {
                position: absolute;
                top: 90px;
                right: 100px;
                
                width: 300px;

                list-style: none;
            }
            
            #header_select {
            	width: 100px;
            	height: 38px;
            }
            
            #header_search {
            	width: 300px;
            	height: 38px;
            }
    		
    	</style>
	</head>
	<body>
	
		<header>
            <div id='header'>
	        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                  <a class="navbar-brand" href="/main"><img id='header_nav_logo'  src='../resources/img/filmeeLogo.png'></a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  
                  
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link strangerHeadermenu" data-bs-toggle="modal" data-bs-target="#login" aria-current="page" href="#" style='display: inline-block'>Login</a>
                        <a class="nav-link memberHeadermenu" aria-current="page" href="/main/logout" style='display: none'>Logout</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link strangerHeadermenu" data-bs-toggle="modal" data-bs-target="#join" href="#" style='display: inline-block'>Join</a>
                        <a class="nav-link memberHeadermenu" href="#" style='display: none'>Mypage</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/board/list">Board</a>
                      </li>                                           
                    </ul>
                    
                    
                    
                    
                    <form class="d-flex">
                        <select id='header_select' class="form-select" aria-label="Default select example">                            
                            <option value="1" selected>film</option>
                            <option value="2">user</option>                            
                        </select>  
                      	<input id='header_search' class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style='width: 300px'>
                      	<table id='autocomplete_result_list' class='table table-hover' style='display: none; background-color: white;'>
                          <tr id='searchTr'><th style='display: none;'></th></tr>
                                                                         
                      	</table>
                      	<button class="btn btn-secondary" type="submit" style='width: 80px; font-size: 13px;'>Search</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
    	</header>

    <!-- alert Modal -->
    <!-- <div class="modal fade" id="alert_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
    <div class="modal fade" id="alert_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"> 
                <!-- <div class="modal-header"> -->
                    <!-- <h2 class="modal-title" id="staticBackdropLabel"><B>LOGIN</B></h2> -->
                    <!-- <p style="font-size: 15px; text-align: center;"></p> -->
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                <!-- </div> -->
                <div class="modal-body">
                    <p style="font-size: 16px; text-align: center;"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <!-- login Modal -->
    <div class="modal fade" id="login" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered  modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>SIGN IN</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="login_form" method="POST">
                        <div class="mb-3">
                            <label for="login_email" class="form-label"><b>Email</b></label>
                            <input type="email" class="form-control" id="login_email" name="email" placeholder="name@example.com" autocomplete="username">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><b>Password</b></label><br>
                            <input type="password" class="form-control" id="login_password" name="password" placeholder="password" autocomplete="current-password">
                            <div><a href="/main/forgotPw" style="color: #C2DBFE ;">Forgot Password</a></div>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                            <input class="form-check-input" type="checkbox" name="rememberMe" id="rememberMe">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="button" class="btn btn-primary login_submit_btn">SIGN IN</button>
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
            <h2 class="modal-title" id="staticBackdropLabel"><B>SIGN UP</B></h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/main/joinPost" method="POST">
                    <div class="mb-3">
                        <label for="join_email" class="form-label"><b>Email</b></label>
                        <input type="email" class="form-control" id="join_email" name="email"placeholder="name@example.com" autocomplete="username" oninput="checkEmail($('#join_email').val())">
                    	<p id='email_message'></p>
                    </div>
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

    <!-- new_password Modal -->
    <div class="modal fade" id="new_password" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>FORGOT PASSWORD</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h2>가입 이메일 주소로 비밀번호 재설정 링크 전송.</h2>
                    <h3>수신 이메일은 비밀번호 재설정 후 반드시 삭제</h3>
                    <form action="#" method="POST">
                        <div class="mb-3">
                            <label for="new_password_email" class="form-label"><b>Email</b></label>
                            <input type="email" class="form-control" id="new_password_email" name="email" placeholder="name@example.com" autocomplete="username">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">SEND</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>





	</body>

</html>