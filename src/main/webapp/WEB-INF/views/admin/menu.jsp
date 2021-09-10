<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
    #container{
        height: 100%;
        float: left;
    }
    #allMenu{
        display: inline-block;
        width: 150px;
        height: 350px;
        text-align: center;
    }
    #adminonly{
        text-align: center;
        font-size: 40px;
    }
</style>
</head>
<body>
    <div id="container">
        <div id="allMenu">
            <table class="table table-hover">
                <thead>
                    <tr>
                    <th scope="col">관리자메뉴</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="/admin/main">전체</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/user">회원현황</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/review">리뷰현황</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/board">게시물현황</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/report">신고현황</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/request">요청현황</a></td>
                    </tr>
                    <tr>
                        <td><a href="/admin/film">영화관리</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>