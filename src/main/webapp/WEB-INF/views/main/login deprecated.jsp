<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login.jsp</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
        $(function() {
            console.clear();
            console.debug('jq started..');

            var loginFailMessage = "${loginFailMessage}";
            if(loginFailMessage.length > 0){
                alert(loginFailMessage);
            }//if

        });//jquery

    </script>

</head>

<body>
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
</body>
</html>