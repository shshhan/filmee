<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8" name="viewport" content="width=device=width, initial-scale=1.0">
    <title>FILMEE | FILM MEETING</title>
    <link rel="icon" href="../../resources/img/favicon_noback.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>

        $(function(){
            console.clear();
            console.log("jq started");

            $('a.prev,a.next').on('click', function(e){
                console.debug("on clicked for NEXT or PREV");
                console.log('\t+this:',this);
                e.preventDefault();

                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/admin/report/list');
                paginationForm.attr('method', 'GET');

                paginationForm.find('input[name=currPage]').val($(this).attr('href'));
                paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

                paginationForm.submit();
            })//onclick

            $("#detailbtn").on("click", function(e){
                console.log("detailBtn clicked.");
                $("#detailtmodal").modal("show");
            })

            $("#modalReportBtn").on('click',function(){
                console.log("delete clicked.");
                if(confirm("신고요청을 처리하시겠습니까?")){
                    return true;
                } else{
                	return false;
                }//if-else
            })//delete
        })//jq
    </script>


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
        }
        /* #admincontainer{
            float: right;
            width: 840px;
        } */
        #container{
        	margin-bottom: 50px;
        }
                
        #menu{
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
        #beforeComplete{
            color: rgb(192, 192, 192)
        }
        #pageNumber{
		  	text-align: center;
            padding: 8px 16px;
        }
        #pageNumber>li{
		 	display:inline-table;
		    text-align: center;
		    padding: 10px;
			font-size: 15px;
        }
        #pageNumber>li:hover{
            background-color: rgb(224, 224, 224);
        }
        #detailbtn{
            border-radius: 5px; 
            margin-right:-4px;
            border: 1px solid skyblue; 
            background-color: rgba(0,0,0,0); 
            color: skyblue; 
            padding: 5px;
        }
        #detailbtn:hover{ 
            color:rgb(221, 250, 255);
            background-color: rgb(0, 0, 0); 
        }
		.prev, .next{
			font-size: 20px;
		}
		.currPage{
            width: 15px;
        	background-color: #d8d8d88f;
        	color: rgb(45, 78, 139)!important;
            border-radius: 10%;
            font-size: 15px;
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
                            <col width="8%"/>
                            <col width="10%"/>
                            <col width="12%"/>
                            <col width="10%"/>
                            <col width="20%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <thead>
                            <tr id=listline>
                                <th>No.</th>
                                <th>유형</th>
                                <th>신고자</th>
                                <th>항목</th>
                                <th>접수일</th>
                                <th>처리일</th>
                                <th>처리자</th>
                                <th>확인</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="report">
                                    <tr>
                                        <td>${report.rptno}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${report.code=='1'}">욕/비방</c:when>
                                                <c:when test="${report.code=='2'}">스포일러</c:when>
                                                <c:when test="${report.code=='3'}">광고</c:when>
                                                <c:when test="${report.code=='4'}">기타</c:when>
                                            </c:choose>
                                        </td>
                                        <td>${report.accuser}</td>
                                        <td>
                                                <c:choose>
                                                    <c:when test="${report.target_type=='BNO'||report.target_type=='bno'}"><admin class="forAdmin">게시판</admin></c:when>
                                                    <c:when test="${report.target_type=='BCNO'||report.target_type=='bcno'}"><admin class="forAdmin">게시판댓글</admin></c:when>
                                                    <c:when test="${report.target_type=='RNO'||report.target_type=='rno'}"><admin class="forAdmin">리뷰</admin></c:when>
                                                    <c:when test="${report.target_type=='RCNO'||report.target_type=='rcno'}"><admin class="forAdmin">리뷰댓글</admin></c:when>
                                                </c:choose>
                                            </a>
                                        </td>
                                        <td><fmt:formatDate pattern="yyyy/MM/dd" value="${report.insert_ts}"/></td>
                                        <td>
                                            <c:if test="${report.complete_ts==null}">
                                                <beforeCom id="beforeComplete">처리전</beforeCom>
                                            </c:if>
                                            <fmt:formatDate pattern="yyyy/MM/dd" value="${report.complete_ts}"/>
                                        </td>
                                        <td>${report.mgr_id}</td>
                                        <td>
                                            <button type="button" id="detailbtn">상세확인</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </table>
                </div>
                <div>
                    <form id="paginationForm">
                        <input type="hidden" name="currPage">
                        <input type="hidden" name="amount">
                        <input type="hidden" name="pagesPerPage">
        
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
                                        href="/admin/report/list?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                                        ${pageNum}
                                    </a>    
                                </li>
                            </c:forEach>
                            <c:if test="${pageMaker.next}">
                                <li class="next"><a class="next" href="${pageMaker.endPage+1}"> > </a></li>
                            </c:if>   
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/resources/html/footer.jsp" %>

    <!-- Detail Modal -->
    <div class="modal fade" id="detailtmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><img src="/resources/img/siren.jpg" alt="" width="20px" height="20px"> 신고 상세 및 처리</h5>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
                </div>
                <div class="modal-body">
                    <div>
                        <label for="reportcode">신고유형</label>
                        <input class="form-control" name="reportcode" id="reportcode" value="" readonly>
                    </div>
                    <div class="form-group">
                        신고자 <input class="form-control" name="nickname" value="" readonly>
                    </div>
                    <div class="form-group">
                        <label for="reportcontent">내용</label>
                        <textarea name="rContent" class="form-control" cols="44" rows="5" readonly></textarea>
                        <button type="button"><a href="/board/get?bno=">신고당한 컨텐츠 확인하기</a></button>
                    </div>      
                    <div class="form-group">
                        <label>신고대상</label>
                        <input class="form-control" name="suspect" value="신고당한유저아이디" readonly> 
                    </div>
                    <div>
                        <label for="mgrid">처리자</label>
                        <input class="form-control" type="text" value="관리자아이디" readonly>
                    </div>
                    <div>
                        <br>
                        <label for="susto">회훤정지일수</label>
                        <input type="number" min="0" max="999999" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id='modalCloseBtn' type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button id='modalReportBtn' type="button" class="btn btn-danger" data-bs-dismiss="modal">처리완료</button>
                </div> 
            </div>
        </div>
    </div>
</body>
</html>