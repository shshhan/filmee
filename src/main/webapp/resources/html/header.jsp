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

        <!---------- BootStrap ---------->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

        <!---------- jQuery ---------->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
        
        <!---------- Social Login ---------->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

        <!---------- Google Recpatch ---------->
        <script src="https://www.google.com/recaptcha/api.js"></script>
        
        <!---------- External JS ---------->
    	<script src="/resources/js/header.js"></script>
        
        <script>

            Kakao.init('b5e0e2fa190deb08c9102e95e2a6e15b');
            // console.log(Kakao.isInitialized());

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
	        
            //====== Google Recaptcha ======
            function onSubmit(token) {
                console.log("token:", token);
                document.getElementById("demo-form").submit();
            }//onSubmit
            
	        
            $(function() {
                console.log('jq started.');
        
                //로그인 여부에 따라 보여주는 header 변경
                if("${__LOGIN__}".length > 0){	//로그인 돼있을 경우
                    $(".strangerHeadermenu").attr("style", "display:none");
                    $(".memberHeadermenu").attr("style", "display:inline");
                }//if

                //전달된 message가 있으면 alert
                switch("${message}"){

                    //회원가입 성공시
                    case 'just_joinned' :
                        $("#alert_modal p").text("회원가입완료! 이메일 인증 완료 후 로그인 가능합니다.");
                        $("#alert_modal").modal("show");
                        break;
                        
                    //소셜로그인을 통해 회원가입시
                    case 'social_join' :
                        $("#alert_modal p").text("소셜 회원가입완료! 간편 로그인으로 이용 가능합니다.");
                        $("#alert_modal").modal("show");
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
                        
                    //비밀번호 변경시
                    case 'pw_changed' :
                        $("#alert_modal p").text("비밀번호가 변경되었습니다.");
                        $("#alert_modal").modal("show");
                        break;

                    //회원 탈퇴시
                     case 'account_deleted' :
                        $("#alert_modal p").text("회원탈퇴가 정상적으로 처리되었습니다.");
                        $("#alert_modal").modal("show");
                        break;
                    
                    //오류, 정보 불일치 등으로 실패시
                    case 'task_failed' :
                        $("#alert_modal p").text("오류 발생! 다시 시도해주세요. 이 메세지가 반복될 시 관리자에게 문의해주세요. ");
                        $("#alert_modal").modal("show");
                        break;
                        
                    default :
                };	//switch-case

                //login modal에서 join 버튼 누를 시 login modal 닫고 join modal 띄움
                $("#close_login_open_join").on('click', function(){
                    $("#login").modal("hide");
                    $("#join").modal("show");   
                });//close_login_open_join

                //modal 새로 열 때 input 초기화
                $("#login, #join, #social_join").on('show.bs.modal',function(){
                    $(this).find('form')[0].reset();
                });//modal hidden.bs.modal            

                //social_join_modal 닫을 때 새로고침
                $('#social_join, #join').on('hidden.bs.modal', function(){           
                    location.reload();  // 카카오 간편로그인을 통한 회원가입, 일반회원가입 모두 시도 중에 창을 꺼버리면 checkEmail()과 isEmailChecked, isPwValid 변수의 상태가 변경되어 있기 때문에, 새로고침을 통해 위 세 항목을 초기화 시키지 않으면 새롭게 join modal을 열었을 때 않은 결과가 발생한다.
                });//social join on hidden


                //login modal에서 sign in 버튼 누를 시
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
                                    }//if

                                    break;

                                    case '3':
                                        console.log("longinNum : 3");
                                        
                                	if(data.isRememberMe == 'true'){    //RemeberMe 체크하고 로그인 했을 시
                                        //RemberMe 쿠키의 이름과 값, 유효기간 설정
                                        let rememberMeCookie = 
                                        "__REMEMBER_ME__=" + data.cookieValue + ";expires=" + data.rememberAge + ";path=/";
                                        
                                        //만든 설정대로 쿠키 생성
                                        document.cookie = rememberMeCookie;
                                    }//if
                                    
                                    if(uriCookie != null){
                                        location.href=uriCookie;
                                    } else{
                                        location.reload();
                                    }//if-else
                                    
                                    break;
                                }//switch-case
                                
                        } //success
                        
                    });//ajax
			    });//onclick .login_submit_btn


                
                //login modal에서 카카오 로그인 누를 시
                Kakao.Auth.createLoginButton({
                    container: "#kakao_login",
                    size : "medium",
                    success: function(object){
                        console.log(object);

                        Kakao.API.request({
                            url:'/v2/user/me',
                            data : {
                                property_keys: ["kakao_account.email"]
                            },
                            success: function(userData){
                                $("#login").modal("hide");
                                
                                var kakao_email = "SOC.KAKAO_" + userData.kakao_account.email;
                                
                                console.log("isEmailExist before:", isEmailExist);
                                checkEmail(kakao_email);    
                                console.log("isEmailExist after:", isEmailExist);

                                if(isEmailExist){
                                    //로그인
                                    $("#login_email").val(kakao_email);
                                    $(".login_submit_btn").trigger("click");
                                } else{
                                    //회원가입
                                    isEmailChecked = true;
                                    isPwValid = true;
                                    
                                    $("#social_join_email").val(kakao_email);
                                    $("#social_join").modal("show");
                                }
                            }//success
                            
                        });//Kakao.API.request
                    },
                    fail: function(error){
                        alert('error');
                        console.log(error);
                    }
                });//Kakao.Auth.lgoin
                

                
                //logout 누를시
                $("#logout_a").on('click', function(){
                    if (!Kakao.Auth.getAccessToken()) {
                        console.log('Not logged in.');
                    }
                    Kakao.Auth.logout(function() {
                        console.log(Kakao.Auth.getAccessToken());
                    });

                    location.href="/main/logout";
                });//logout on click


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
            
            #forgot_password{
            	margin-left : 125px;
            }
            
            #kakao_login{
                margin : auto;
                /* margin-top: 27px; */
            }

            /* #kakao-login-btn{
                width : 266px;
                height : 40px;
            } */

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
                        <a class="nav-link memberHeadermenu" id="logout_a" aria-current="page" href="#" style='display: none'>Logout</a>
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
    <div class="modal fade" id="alert_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"> 
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
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>SIGN IN</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="login_form" method="POST">
                        <div class="mb-3">
                            <label for="login_email" class="form-label"><b>Email</b></label>
                            <input type="email" class="form-control" id="login_email" name="email" placeholder="이메일 주소" autocomplete="username">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label"><b>Password</b></label><br>
                            <input type="password" class="form-control" id="login_password" name="password" placeholder="비밀번호" autocomplete="current-password">
                            <div id="forgot_password"><a href="/main/forgotPw">forgot password</a></div>
                        </div>
                        <div class="form-check">
   						    <label class="form-check-label" for="rememberMe">Remember me</label>
                            <input class="form-check-input" type="checkbox" name="rememberMe" id="rememberMe">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="button" 
                            class="btn btn-primary login_submit_btn g-recaptcha" data-sitekey="6Lde0E4cAAAAALC52i_2yWY1ihnWWwRKIHtrtlln"
                            data-callback='onSubmit' 
                            data-action='submit'>SIGN IN</button>
                     	</div>
                    </form>
                    <p>&nbsp;</p>
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-primary" id="close_login_open_join">JOIN</button>
                        <p>&nbsp;</p>
                        <div id="kakao_login"></div>
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
                        <input type="email" class="form-control" id="join_email" name="email" placeholder="이메일 주소" autocomplete="username"
                        oninput="javascript:checkEmail( $('#join_email').val() )">
                    	<p class='input_message' id='email_message'></p>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label"><b>password</b></label>
                        <input type="password" class="form-control" id="join_password" name="password" placeholder="비밀번호" oninput="javascript:checkPw()" autocomplete="new-password">
                        <p class='input_message' id='pw_message'></p>
                    </div>
                    <div class="mb-3">
                        <label for="nickname" class="form-label"><b>nickname</b></label>
                        <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임" oninput="javascript:checkNickname($('#nickname').val())">
                        <p class='input_message nickname'></p>
                        </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary sign_up_btn" disabled><b>SIGN UP</b></button>
                        <!-- <button type="submit" 
                        class="btn btn-primary sign_up_btn g-recaptcha" data-sitekey="6Lde0E4cAAAAALC52i_2yWY1ihnWWwRKIHtrtlln"
                        data-callback='onSubmit'
                        data-action='submit' disabled>SIGN UP</button> -->

                    </div>
                </form>
            </div>
        </div>
        </div>
    </div>

    <!-- socail_ join Modal -->
    <div class="modal fade" id="social_join" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
            <h2 class="modal-title" id="staticBackdropLabel"><b>SOCIAL SIGN UP</b></h2>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/main/joinPost" method="POST">
                    <div class="mb-3">
                        <input type="hidden" name="email" id="social_join_email">
                        <input type="hidden" name="password">
                        <input type="hidden" name="fromWhere" id="fromWhere">

                        <label for="nickname" class="form-label"><b>nickname</b></label>
                        <input type="text" class="form-control" id="social_nickname" name="nickname" placeholder="닉네임" oninput="javascript:checkNickname($('#social_nickname').val())">
                        <p class='input_message nickname'></p>
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
    <!-- <div class="modal fade" id="new_password" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
    </div> -->
  
	</body>

</html>