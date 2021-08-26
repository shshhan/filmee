function isEmail(email) {

	var reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return reg.test(email);
}
   
   
   var emailCheck=0;
    var pwCheck=0;
    var nickCheck=0;
    
    function checkEmail(){
        var email = $('#join_email').val();
        $.ajax({
            data : {
                email : email
            },
            type:'get',
            url : "/main/checkEmail",
            dataType:'json',
            success : function(data){
                if(email.length == 0){
                    $(".sign_up_btn").prop("disabled", true);
                    // $(".sign_up_btn").css("background-color", "#aaaaaa");
                    $("#join_email").css("background-color", "");
                    $("#email_message").text("");
                    emailCheck = 0;
                } else if( !isEmail(email) ){
                    $(".sign_up_btn").prop("disabled", true);
                    // $(".sign_up_btn").css("background-color", "#aaaaaa");
                    $("#join_email").css("background-color", "#FFCECE");
                    $("#email_message").text("Inappropriate email");
                    emailCheck = 0;
                } else if (data == '0') {
                    $("#join_email").css("background-color", "#C2DBFE");
                    $("#email_message").text("Available");
                    emailCheck = 1;
                    if(emailCheck == 1 && pwCheck == 1 && nickCheck == 1) {
                        $(".sign_up_btn").prop("disabled", false);
                        // $(".sign_up_btn").css("background-color", "#C2DBFE");
                    }//if
                } else if (data == '1') {
                    $(".sign_up_btn").prop("disabled", true);
                    // $(".sign_up_btn").css("background-color", "#aaaaaa");
                    $("#join_email").css("background-color", "#FFCECE");
                    $("#email_message").text("Taken");
                    emailCheck = 0;
                }//if-elseif-elseif-elseif
            }//success
        });//ajax
    };//checkEmail

    function checkPw(){
        var pw = $('#join_password').val();
        var pwLeng = pw.length;

        if(pwLeng==0){
            $(".sign_up_btn").prop("disabled", true);
            // $(".sign_up_btn").css("background-color", "#aaaaaa");
            $("#join_password").css("background-color", "");
            $("#pw_message").text("");
            pwCheck = 0;
        }else if(pwLeng < 5){
            $(".sign_up_btn").prop("disabled", true);
            // $(".sign_up_btn").css("background-color", "#aaaaaa");
            $("#join_password").css("background-color", "#FFCECE");
            $("#pw_message").text("Passwords must be at least 6 characters.");
            pwCheck=0;
        }else{
            $("#join_password").css("background-color", "#C2DBFE");
            $("#pw_message").text("Avaliable");
            pwCheck=1;
            if(emailCheck == 1 && pwCheck == 1 && nickCheck == 1) {
                $(".sign_up_btn").prop("disabled", false);
                // $(".sign_up_btn").css("background-color", "#C2DBFE");
            }//if
        }//if-elseif-else

    };//checkPw

    function checkNickname(){
        var nickname = $('#nickname').val();
        $.ajax({
            data : {
                nickname : nickname
            },
            type:'get',
            url : "/main/checkNickname",
            dataType:'json',
            success : function(data){
                if(nickname.length == 0){
                    $(".sign_up_btn").prop("disabled", true);
                    // $(".sign_up_btn").css("background-color", "#aaaaaa");
                    $("#nickname").css("background-color", "");
                    $("#nick_message").text("");
                    nickCheck = 0;
                } else if(nickname.length < 2){
                    $(".sign_up_btn").prop("disabled", true);
                    // $(".sign_up_btn").css("background-color", "#aaaaaa");
                    $("#nickname").css("background-color", "#FFCECE");
                    $("#nick_message").text("Nickname must be at least 2 characters.");
                    nickCheck = 0;
                } else if (data == '0') {
                    $("#nickname").css("background-color", "#C2DBFE");
                    $("#nick_message").text("Available");
                    nickCheck = 1;
                    if(emailCheck == 1 && pwCheck == 1 && nickCheck == 1) {
                        $(".sign_up_btn").prop("disabled", false);
                        // $(".sign_up_btn").css("background-color", "#4CAF50");
                    }//if
                } else if (data == '1') {
                    $(".sign_up_btn").prop("disabled", true);
                    // $(".sign_up_btn").css("background-color", "#aaaaaa");
                    $("#nickname").css("background-color", "#FFCECE");
                    $("#nick_message").text("Taken");
                    nickCheck = 0;
                }//if-elseif-elseif
            }//success
        });//ajax
    };//checkNickname
    
