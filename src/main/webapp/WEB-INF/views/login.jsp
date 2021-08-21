<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login.jsp</title>
</head>
<body>
    <form action="/main/loginPost" method="POST">
        <div>
            <label for="user_email">user email</label>
            &nbsp;
            <input type="text" id="user_email" name="email" placeholder="email">
        </div>

        <p> </p>

        <div>
            <label for="password">password</label>
            &nbsp;
            <input type="password" id="password" name="password" placeholder="password">
        </div>

        <p></p>
        <button type="submit">sign in</button>
    </form>
</body>
</html>