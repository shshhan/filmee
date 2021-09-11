<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

    <link rel="icon" href="/img/favicon_noback.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/layout.css">
    <link rel="stylesheet" href="/resources/css/swiper.css">
    <link rel="stylesheet" href="/resources/css/main.css">

    <script src="/resources/js/jquery-1.8.3.min.js"></script>
    <script src="/resources/js/swiper.js"></script>
    
    <script>
        
    	window.onload = function(){
            var swiper = new Swiper('.swiper-container', {
                        pagination: '.swiper-pagination',
                        paginationType: 'progress',
                        slidesPerView: 'auto',
                        paginationClickable: true,
                        spaceBetween: 0,
                        freeMode: true,
                        nextButton: '.next',
                        prevButton: '.back'
            });
        };

        $(function(){
            console.log('jq started');

            $("#agree_cb").on('click', function(){
                var agreeCb = $("#agree_cb").prop("checked");
                console.log("agreeCb :", agreeCb);

                if(agreeCb){
                    $("#del_acc_btn").prop("disabled", false);
                } else {
                    $("#del_acc_btn").prop("disabled", true);
                }//if-else

            });//agree_cb onclick

            $("#del_acc_btn").on('click', function(e){
                e.preventDefault();     //submit 취소

                if("${__LOGIN__.email}".includes("SOC.KAKAO_")){    //현재 로그인된 계정이 카카오 계정이라면
                    Kakao.API.request({     //카카오 간편로그인 token 해제
                        url: '/v1/user/unlink',
                        success: function(response) {
                            console.log(response);

                            $("#del_acc_form").submit();    //DB에서 탈퇴처리
                        },
                        fail: function(error) {
                            console.log(error);
                        }
                    });//Kakao.API,request

                }else {         //현재 로그인된 계정이 일반계정이라면
                    $("#del_acc_form").submit();    

                }//if-else

            });//del_acc_btn onclick
            
        });//jq
    </script>

    <style>
    
    	#container {
    		width: 998px;
    		margin: 0 auto;
    		
    		font-family: 'ELAND 초이스';
    	}
    	
    	#mainFilm {
    		position: relative;
    	}
    	
    	#mainPosterUl {
    		position: relative;
    		
    		height: 300px;
    	}
    	
    	.filmPosterList {
    		float: left;
    		
    		margin: 5px;    		
    	}
    	
    	#hoverPost {
    		z-index: 8;
    		position:absolute; 
    		top:20px; 
    		left:22px;
    	}
    	
    	.hoverEventList {
    		width:160px; 
    		height:250px; 
    		border:1px solid black;
    		
    		float:left;
    	}
    
    </style>

</head>    

<body>
    <%@include file="/resources/html/header.jsp"  %>

    <div id="container">
            
 
        <div id="mainback">
            <img class="img-fluid" src="/resources/img/common.jpg" alt="mainbackimg" width="998">
    
        </div>

        <div id="mainText">
            <p>
                Track films you’ve watched.<br> Save those you want to see.<br>Tell your friends what’s good.
            </p>
            <p></p>
            <p>
                The social network for film lovers.
            </p>
        </div>
        
        <hr>
        
        <div id='mainFilm' style='height:300px;'>
        
        	<ul id='mainPosterUl'>
        		<li class="filmPosterList" style='margin-left: 8px;'><img src='../resources/img/fitem01.jpg' ></li>    			

        		<li class="filmPosterList"><img src='../resources/img/fitem01.jpg' ></li>
        		<li class="filmPosterList"><img src='../resources/img/fitem01.jpg' ></li>
        		<li class="filmPosterList"><img src='../resources/img/fitem01.jpg' ></li>
        		<li class="filmPosterList"><img src='../resources/img/fitem01.jpg' ></li>
        	</ul>
        	
        	<ul id='hoverPost'>
        		<li class='hoverEventList'></li>
        		<li class='hoverEventList' style='margin-left: 38px;'></li>
        		<li class='hoverEventList' style='margin-left: 38px;'></li>
        		<li class='hoverEventList' style='margin-left: 38px;'></li>
        		<li class='hoverEventList' style='margin-left: 38px;'></li>
        	</ul>
        
        </div>
        
        <hr>
        
        <h1 class="display-6">Recent Reviews</h1>
        
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#del_acc_modal">
            회원탈퇴
        </button>
  
        <!-- del_acc_modal -->
        <div class="modal fade" id="del_acc_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"><b>DELETE ACCOUNT</b></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>삭제된 계정은 복구가 불가능하며, 회원님이 작성하신 게시물과 영화 리뷰를 제외한 모든 정보는 탈퇴 즉시 삭제됩니다.
                    <strong>탈퇴 하시겠습니까?</strong></h5>
                    <p>&nbsp;</p>

                    <form action="/main/deleteAccount" id="del_acc_form" method="POST">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="agree_cb">
                            <label class="form-check-label" for="agree_cb">
                            회원탈퇴에 대한 주의사항을 모두 읽었고, 이에 동의합니다.
                            </label>
                        </div>
                        <hr>
                        <div class = row align-items-center">
                            <input type="hidden" name="userId" value="${__LOGIN__.userId}">
                            <button type="button" class="btn btn-secondary col" id="del_acc_btn" disabled>회원탈퇴</button>
                            <button type="button" class="btn btn-primary col" data-bs-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>  
    <%@include file="/resources/html/footer.jsp" %>
      
</body>
</html>