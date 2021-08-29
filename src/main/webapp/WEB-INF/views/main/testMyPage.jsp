<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FilMee</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        //====== 비밀번호 수정 ======

        // input에 입력시 유효성을 체크할 변수
        var isCurrentPwChecked = false;
        var isNewPwValid = false;
        var isNewPwConfirmed = false;
                
        //모든 input 태그의 유효성 검사가 성공적이면 Change버튼 활성화
        function isChangeBtnValid(){
            if(isCurrentPwChecked && isNewPwValid && isNewPwConfirmed){
                // console.log("good to go");
                $(".new_pw_submit_btn").prop("disabled", false);
            }else{
                // console.log("failed");
                $(".new_pw_submit_btn").prop("disabled", true);
            }//if-else
        }//isChangeBtnValid

        //현재 비밀번호 검증
        function checkCurrentPw(){
            var currentPw = $('#current_pw').val();

            $.ajax({
                data : {
                    email : '${__LOGIN__.email}',
                    password : currentPw
                },
                type:'post',
                url : "/main/checkCurrentPw",
                dataType:'json',
                success : function(data){
                    if(currentPw == 0){
                        isCurrentPwChecked = false;
                        $("#current_pw_message").text("");
                        // $(".new_pw_submit_btn").prop("disabled", true);
                    } else if (data == 0) {
                        isCurrentPwChecked = false;
                        $("#current_pw_message").text("현재 비밀번호와 일치하지 않습니다.❌🙅🏻🙅🏻‍♀🤦🏻‍♂🤦🏻🤷🏻‍♀🤷🏻‍♂");
                        // $(".new_pw_submit_btn").prop("disabled", true);
                    } else if (data == 1) {
                        isCurrentPwChecked = true;
                        $("#current_pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");
                        // $(".new_pw_submit_btn").prop("disabled", false);
                    }//if-elseif-elseif-elseif
                    isChangeBtnValid();
                }//success
            });//ajax
        };//checkCurrentPw

        //새비밀번호의 유효성 검증과 비밀번호 확인
        function confirmNewPw(){
            var newPw = $('#new_pw_input').val();
            npLeng=newPw.length;

            var confirmPw = $('#confirm_pw_input').val();

            if(npLeng==0){
                isNewPwValid = false;
                $("#new_pw_message").text("");
                // $("#new_pw_input").css("background-color", "");
            }else if(npLeng < 6){
                isNewPwValid = false;
                $("#new_pw_message").text("비밀번호는 6자리 이상이어야 합니다.❌🙅🏻🙅🏻‍♀🤦🏻‍♂🤦🏻🤷🏻‍♀🤷🏻‍♂");
                // $("#new_pw_input").css("background-color", "#FFCECE");
            }else{
                isNewPwValid = true;
                $("#new_pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");
                // $("#new_pw_input").css("background-color", "#C2DBFE");
            }//if-elseif-else

            if(confirmPw.length == 0){
                isNewPwConfirmed = false;
                $("#confirm_pw_message").text("");
                // $(".new_pw_submit_btn").prop("disabled", true);
                // $("#confirm_pw_input").css("background-color", "");
            }else if(confirmPw != newPw){
                isNewPwConfirmed = false;
                $("#confirm_pw_message").text("비밀번호가 일치하지 않습니다.❌🙅🏻🙅🏻‍♀🤦🏻‍♂🤦🏻🤷🏻‍♀🤷🏻‍♂");
                // $(".new_pw_submit_btn").prop("disabled", true);
                // $("#confirm_pw_input").css("background-color", "#FFCECE");
            } else{
                isNewPwConfirmed = true;
                $("#confirm_pw_message").text("✅☑✔👌🙆🏻‍♂🙆🏻‍♀🙆‍♀");
                // $(".new_pw_submit_btn").prop("disabled", false);
                // $("#confirm_pw_input").css("background-color", "#C2DBFE");
            }//if- elseif -else
            isChangeBtnValid();
        };//pwConfirm

    </script>
</head>

<body>
   <%@include file="/resources/html/header.jsp"  %>

   <h1>WEB-INF/views/main/testMyPage.jsp</h1>
	
	<hr>
    
    <button type="button" data-bs-toggle="modal" data-bs-target="#new_pw" >비밀번호 수정</button>
    
    <!-- new_pw Modal -->
    <div class="modal fade" id="new_pw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered  modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="staticBackdropLabel"><B>CHANGE PASSWORD</B></h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/main/newPassword" method="POST">
                        <input type="hidden" name="email" value="${__LOGIN__.email}">
                        <div class="mb-3">
                            <label for="current_pw" class="form-label"><b>Current Password</b></label>
                            <input type="password" class="form-control" id="current_pw" placeholder="현재 비밀번호" oninput="javascript:checkCurrentPw()" autocomplete="current-password">
                            <p class="input_MSG" id='current_pw_message'></p>
                        </div>
                        <div class="mb-3">
                            <label for="new_pw" class="form-label"><b>New Password</b></label>
                            <input type="password" class="form-control" id="new_pw_input" placeholder="비밀번호 확인" name="password" autocomplete="new-password" oninput="javascript:confirmNewPw()">
                            <p class="input_MSG" id='new_pw_message'></p>
                        </div>
                        <div class="mb-3">
                            <label for="confirm_pw" class="form-label"><b>Confirm Password</b></label>
                            <input type="password" class="form-control" id="confirm_pw_input" placeholder="비밀번호 확인" oninput="javascript:confirmNewPw()">
                            <p class="input_MSG" id='confirm_pw_message'></p>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary new_pw_submit_btn" disabled>CHANGE</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include file="/resources/html/footer.jsp" %>
	
</body>
</html>