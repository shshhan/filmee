<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>get.jsp</title>

    <style>
        #container{

            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            
            
			margin-left: 30px;
			
            background: #fff;
            border-radius: 5px;
            text-align: left;
            padding: 20px;

        }
        #getHead{
            font-size: 20px;
        }
        #com_back{

        }
        #listBtn{
            
        }
        #getCode{
            align-items: center;
        }
        #getMog{
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between
            
        }
        #com_cont{
            width: 333px;
            height: 200px;
            border: 1px solid black;
            font-size: 20px;
        }
        #botBtn{
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between
        }
        .botBtn{
            width: 165px;
        }
        #content{
        width: 333px;
        font-size: 20px;
        }
    </style>

    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js></script>
    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js></script>

    <script>
        $(function(){
            console.clear();
            console.debug('jq started..');

            
                
            $("#listBtn").click(function(){
                console.log('#listBtn button clicked..');

                // self.location.href = "/board/list";
                // self.location = "/board/list";
               // location.href = "/complaint/list";
                 location.href = "/complaint/listPerPage?currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
                // self.location.href = "/board/list";

                //location : 주소창
                // href : 주소창의 실제 url 주소를 넣는 속성
                // self = 윈도우객체(bom의 최상위 객체)
                // 다 똑같음
                
            }); //.onclick
            
            
            $("#temporaryBtn").click(function(){
                console.log('#temporaryBtn button clicked..');
                
                $("form").attr("action","/complaint/temporary");
                //$("from").attr("method","POST");
                //$("#completeBtn").attr("type","submit");
               // $("form").action="/complaint/complete";
                
                //location.href = "/complaint/comList";
                //location.href = "/complaint/complete?compno=${complaint.compno}
                // location.href = "/complaint/complete?compno=${complaint.compno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
           });
            $("#completeBtn").click(function(){
                console.log('#completeBtn button clicked..');

                $("form").attr("action","/complaint/completion");
                //$("from").attr("method","POST");
               // $("#completeBtn").attr("type","submit");
               // $("form").action="/complaint/complete";
                
                //location.href = "/complaint/comList";
                //location.href = "/complaint/complete?compno=${complaint.compno}
                // location.href = "/complaint/complete?compno=${complaint.compno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
           });
        })
    </script>


</head>
<body>
    <div id="container">
        <div id="getHead">
            <b>요청관리</b>
        </div>

        
        <div id="com_back">
            <div id="listBtn">&#x027F8;</div>
        </div>

        <form name="from" action="#" method="POST">
        <!-- <form name="from">  -->
        <input type="hidden" name="currPage" value="${cri.currPage}">
      	<input type="hidden" name="amount" value="${cri.amount}">
        <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
		<input type="hidden" name="compno" value="${complaint.compno}">
        <div id="getCode">
            <c:choose>
                <c:when test="${complaint.code == 1}">
                    서비스 개선요청
                </c:when>
                <c:when test="${complaint.code == 2}">
                    영화정보 추가요청
                </c:when>
                <c:when test="${complaint.code == 3}">
                    영화정보 수정요청
                </c:when>
                <c:otherwise>
                    기타
                </c:otherwise>
            </c:choose>
        </div>


        <div id="getMog">
            <div>
               <Br>
            </div>
            <div>
                <fmt:formatDate pattern="yyyy/MM/dd " value="${complaint.insert_ts}"/>
            </div>
        </div>

        <div id="com_cont">
            <pre><c:out value="${complaint.content}"/></pre>
        </div>

        <br>
        
        <div>
            <textarea name="content" id="content" value="${complaint.content}" cols="40" rows="10">
<c:out value="${complaint.content}"/>
<c:choose>
<c:when test="${complaint.check_ts == null}">
답변
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</textarea>
        </div>

        <div id="botBtn">
            <div>
                <button type="submit" id="temporaryBtn" class="botBtn">임시저장</button>
            
            </div>
            <div>
                <button type="submit" id="completeBtn" class="botBtn">처리완료</button>
            
            </div>
        </div>
        </form>
        

    </div>

    
</body>
</html>