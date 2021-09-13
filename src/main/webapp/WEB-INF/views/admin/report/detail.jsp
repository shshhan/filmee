<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="../../resources/img/favicon_noback.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <%@ include file="/resources/html/header.jsp" %>

    <style>
        body{
            -ms-user-select: none; 
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none; 
        }
        hr{
            width: 998px;
            margin: 0 auto;
        } #menu{
        	font-size: 40px;
        	width: 998px;
        	margin: 0 auto;
        	text-align: center;
        }
		#adminboardlist {
			width: 998px;
			margin: 0 auto;
		    text-align: center;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
            border-bottom: 1px solid rgb(224, 224, 224);	

        }
		#adminboardlist>tbody>tr>td{
		  	color: black;
		  	font-size:15px;
		  	padding: 15px;
        }
        #listline{ 
            background-color: #dddddd;
            color:rgb(0, 0, 0);
            font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
            font-size: 18px;
  			border-bottom: 1px solid #ddd;
  			height: 50px;
  			line-height: 50px;
        }
        #adminmenuinfo{
            width: 100px;
            background-color: rgba(65, 105, 225, 0.185);
            border-radius: 10px;
            margin: 0 auto;
            text-align: center;
            margin-bottom: 10px;
        }
        #adminboardlist>tbody>tr:hover {
  		  	background-color: #dddddd60;
        }
    </style>
</head>

<body>
    <div id="container">
        <div>
            <div id="adminmenuinfo">관리자 전용</div>
            <div id=menu>
            	<h2>신고 현황</h2>
                <%@include file="../menu.jsp"%>
            </div>
        </div>
        <div id="admincontainer">
            
            <div>
                <div>
                    <table id="adminboardlist">
                        <colgroup>
                            <col width=""/>
                            <col width=""/>
                            <col width=""/>
                            <col width=""/>
                            <col width=""/>
                        </colgroup>
                        <thead>
                            <tr id=listline>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/resources/html/footer.jsp" %>
    
</body>
</html>