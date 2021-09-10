<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/resources/html/header.jsp" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>
    <script>

        $(function() {
            console.clear();
            console.log("jq started");

            $('a.prev, a.next').on('click', function(e) {
                console.debug("on clicked for NEXT or PREV");
                e.preventDefault(); 
                
                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/admin/board');
                paginationForm.attr('method', 'GET');
                
                console.log($(this));

                paginationForm.find('input[name=currPage]').val($(this).attr('href'));
                paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
                paginationForm.find('input[name=type]').val('${pageMaker.cri.type}');
                paginationForm.find('input[name=keyword]').val('${pageMaker.cri.keyword}');

                paginationForm.submit();
            }); //onclick


        }); //jq
    </script>

    <style>
        body,input,textarea,select,button,table{font-family:'ELAND 초이스';}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        /* a-style */
        a{color:#333;text-decoration:none;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

        body{
            width: 998px;
            margin: 0 auto;
            -ms-user-select: none; 
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            user-select: none; 
        }
        #admincontainer{
            float: right;
            width: 840px;
        }
        #listline{
            background-color: rgba(226, 223, 223, 0.473);
        }
		
		#adminboardlist {
			width:100%;
		    text-align: center;
		    margin: 20px ;
		    font-size: 20px;
            font-family: 'ELAND 초이스';
  			border-collapse: collapse;
		  }
		 #adminboardlist>tbody>tr>td{
		  	color: black;
		  	font-size:15px;
		  	padding: 10px;
  			border-bottom: 1px solid #ddd;	
  		  }
		#adminboardlist>thead>tr>th{
		  	font-weight: bold;
		  	border:10px;
		  	margin:10px;
		  	padding:15px;
  			border-bottom: 1px solid #ddd;
  		  }
  	    #adminboardlist>tbody>tr:hover {
  		  	background-color: #dddddd60;
  		  }
  		  
        #pageNumber{
		  	text-align: center;
		  }
        #pageNumber>li{
		 	display:inline-table;
		    width: 3%;
		    text-align: center;
		    padding: 10px;
			font-size: 15px;
		 }
		.prev, .next{
			font-size: 30px;
		}
		.currPage{
        	background-color: #C2DBFE;
        	color: white!important;
        }
        #regBtn{
            float: right;
        }
    </style>
</head>

<body>
    <div>
        <div>
            <table class="table table-hover">
                <thead>
                    <tr>
                    <th scope="col" id="adminonly"> 게시물 현황 </th>
                    </tr>
                </thead>
            </table>
            <div id=menu>
                <%@include file="../admin/menu.jsp"%>
            </div>
        </div>
        <div id="admincontainer">
            <input type="hidden" name="currPage" value="1">
            <input type="hidden" name="amount">
            <input type="hidden" name="pagesPerPage">
            <input type="hidden" name="type">
            <input type="hidden" name="keyword">
            <input type="hidden" name="category">
            <input type="hidden" name="bno" value="${board.bno}">
            <input type="hidden" name="writer" value="${board.writer}">
            <div>
                <div>
                    <table id="adminboardlist">
                        <colgroup>
                            <col width="15%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="40%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <thead>
                            <tr id=listline>
                                <th>카테고리</th>
                                <th>글번호</th>
                                <th>작성자</th>
                                <th>제목</th>
                                <th>등록일</th>
                                <th>신고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- <c:forEach items="${list}" var="board"> -->
                                <tr>
                                    <td>
                                        <c:choose>
                                            <c:when test="${board.category=='F'}">자유</c:when>
                                            <c:when test="${board.category=='N'}">소식</c:when>
                                            <c:when test="${board.category=='B'}">자랑</c:when>
                                            <c:when test="${board.category=='R'}">추천</c:when>
                                        </c:choose>
                                    </td>
                                    <td>${board.bno}</td>
                                    <td>${board.nickname}</td>
                                    <td><a href="/admin/board/get?bno=${board.bno}&currPage=${pageMaker.cri.currPage}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${board.title} </a> [<c:out value="${board.commentCnt}"/>]</td>
                                    <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.insert_ts}"/></td>
                                    <td>0</td>
                                </tr>
                            <!-- </c:forEach> -->
                        </tbody>
                    </table>
                </div>

                <div id="pagination">
                    <form id="paginationForm">
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">
                        <input type="hidden" name="pagesPerPage">
                        <input type="hidden" name="type">
                        <input type="hidden" name="keyword">
        
                        <ul id="pageNumber">
                            <c:if test="${pageMaker.prev}">
                                <li class="prev"><a class="prev" href="${pageMaker.startPage-1}"> < </a></li>
                            </c:if>    
        
                            <c:forEach 
                                begin="${pageMaker.startPage}" 
                                end="${pageMaker.endPage}" 
                                var="pageNum">
                                <li class="${pageMaker.cri.currPage==pageNum?'currPage':''}">
                                    <a
                                        class="${pageMaker.cri.currPage==pageNum?'currPage':''}"
                                        href="/admin/board?category=${pageMaker.cri.category}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">
                                        ${pageNum}
                                    </a>    
                                </li>
                            </c:forEach>
         
                            <c:if test="${pageMaker.next}">
                                <li class="next"><a class="next" href="${pageMaker.endPage+1}"> > </a></li>
                            </c:if>   
                        </ul>
                        <div>
                            <button class="btn btn-info">신고받은 게시물만<br>모아보기</button>
                        </div>
                    </form>
            </div>
        </div>
        
    </div>
</body>
</html>