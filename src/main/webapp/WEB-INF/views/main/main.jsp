<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">
    </head>

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
    

<body>
    <%@include file="/resources/html/header.jsp"  %>

    <section id="section">
            
 
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
        <section class="feature">
            <div class="inWrap">
                <div class="fInner swiper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem01.jpg" alt="">도리를 찾아서</span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem02.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem03.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem04.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem05.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem06.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem07.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem08.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem09.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem10.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem11.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem12.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem13.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem14.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem15.jpg" alt=""></span></a></li>
                        <li class="swiper-slide"><a href="#"><span><img src="/resources/img/fitem16.jpg" alt=""></span></a></li>
                    </ul>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
                <div class="button">
                    <div class="back"><a href="#"><span class="hidden">back</span></a></div>
                    <div class="next"><a href="#"><span class="hidden">next</span></a></div>
                </div>
            </div>
        </section>

        <section class="feature">
            <div class="inWrap">
                <div class="Finner wriper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide"><a href="#"><img src="/resources/img/fitem01.jpg" alt=""></a></li>
                        <li class="swiper-slide"><a href="#">제목.작성자.좋.댓</a></li>
                        <li class="swiper-slide"><a href="#"><img src="/resources/img/fitem01.jpg" alt=""></a></li>
                        <li class="swiper-slide"><a href="#">제목.작성자.좋.댓</a></li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#del_acc_modal">
            회원탈퇴
        </button>
  
        <!-- Modal -->
        <div class="modal fade" id="del_acc_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"><b>DELETE ACCOUNT</b></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    지금 탈퇴하면 같은 이메일로 회원가입 못함
                    그리고 지나가다가 새똥맞음 ㅋㅋ
                    <form action="/main/deleteAccount" id="del_acc_form" method="POST">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="agree_cb">
                            <label class="form-check-label" for="flexCheckDefault">
                            정말로 탈퇴하시겠습니까?
                            </label>
                        </div>
                        <hr>
                        <div class = row align-items-center">
                            <input type="hidden" name="userId" value="${__LOGIN__.userId}">
                            <button type="button" class="btn btn-secondary col" id="del_acc_btn" disabled>회탈ㄱ</button>
                            <button type="button" class="btn btn-primary col" data-bs-dismiss="modal">안할거임</button>
                        </div>
                    </form>
                </div>
                <!-- <div class="modal-footer row align-items-center">
                    <button type="button" class="btn btn-secondary col" id="del_acc_btn">회탈ㄱ</button>
                    <button type="button" class="btn btn-primary col" data-bs-dismiss="modal">안할거임</button>
                </div> -->
            </div>
            </div>
        </div>

    </section>  
    <%@include file="/resources/html/footer.jsp" %>
      
</body>
</html>