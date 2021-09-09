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
        body,input,textarea,select,button,table{font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:12px; color:#333;}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

        a, a:link, a:visited{
            cursor : pointer;
        }

        #container{

            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            
            margin: auto;
			
            background: #fff;
            border-radius: 5px;
            text-align: left;
            padding: 20px;

        }
        #getHead{
            font-size: 20px;
            
        }
        #com_back_a{
			
            align-self:flex-start;
            
        }
        #listBtn{
            
        }
        #getCode{
            align-items: center;
            border: black 1px solid;
            height: 30px;
            font-size: 22px;
            text-align: center;
        }
        #getTime{
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between
            
        }
        #com_cont{
            width: 400px;
            height: 180px;
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
        width: 400px;
        font-size: 20px;
        }
    </style>

    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js></script>
    <script src=https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js></script>

    <script>
        $(function(){
            console.clear();
            console.debug('jq started..');

       

            $("#temporaryBtn").click(function(){
                console.log('#temporaryBtn button clicked..');
                
                $("#comform").attr("action","/complaint/temporary");
               //$("comform").attr("method","POST");
                //$("#completeBtn").attr("type","submit");
               // $("form").action="/complaint/complete";
                
                //location.href = "/complaint/comList";
                //location.href = "/complaint/complete?compno=${complaint.compno}
                // location.href = "/complaint/complete?compno=${complaint.compno}&currPage=${cri.currPage}&amount=${cri.amount}&pagesPerPage=${cri.pagesPerPage}";
           });
            $("#completeBtn").click(function(){
                console.log('#completeBtn button clicked..');

                $("#comform").attr("action","/complaint/completion");
              
            });
        })
    </script>


</head>
<body>
    <div id="container">
        <div id="getHead">
            <b>요청관리</b>
        </div>

        
       <br>
        <a id="com_back_a" href="javascript:history.back();">&#x027F8;</a>


        <form id="comform" name="comform" action="#" method="POST">
        <!-- <form name="from">  -->
        <input type="hidden" name="currPage" value="${cri.currPage}">
      	<input type="hidden" name="amount" value="${cri.amount}">
        <input type="hidden" name="pagesPerPage" value="${cri.pagesPerPage}">
		<input type="hidden" name="writer" value="${complaint.writer}">
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


        <div id="getTime">
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
            <textarea name="content" id="content" value="${complaint.content}" cols="28" rows="10">
<c:out value="${complaint.content}"/><c:choose><c:when test="${complaint.check_ts == null}">
답변
</c:when></c:choose>
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