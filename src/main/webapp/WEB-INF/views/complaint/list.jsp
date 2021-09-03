<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
     
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    
    <style>
        body,input,textarea,select,button,table{font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif; font-size:12px; color:#333;}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{margin:0;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em; line-height:1.5em; text-align:justify;}
        a, a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}

        a, a:link, a:visited{
            cursor : pointer;
        }
        
        
        #container{
            display: flex;
            flex-flow: column nowrap;

            justify-content: center;
        }
        #sort{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #com_table table{
            width: 100%;
            white-space: nowrap;
            
            border-collapse: collapse;
            text-align : center;
        }

        #com_table th{
            padding: 10px;
            border-bottom: 3px solid black ;
        }

        #com_table td{
            padding: 10px;
            border-bottom: 1px solid black ;

            text-align : center;
        }
        #com_code_td{
            width: 280px;
        }

        #caption{

            font-size: 16px;
            width: 100%;
            height: 40px;
            border: 2px solid rgba(0, 0, 0, 0.411);
            
            margin-bottom: 10px ;
            text-align: center;
            padding-top:auto; padding-bottom:auto;


        }
        
        #pagination{
            width : 95%;
            margin : 0 auto;
        }

        #pagination ul {
            float : right ;
        }

        #pagination li{
            float : left;
            
            width : 30px;
            height : 30px;

            border-left : 1px solid #C2DBFE;
    
            text-align: center;
            list-style : none;
            line-height: 30px;

        }

        .prev, .next {
            width : 70px!important;

            color : white!important;
            background-color: #C2DBFE!important;
        }

        .currPage {
            font-weight : bold;
            background-color: #f0adce96;
        
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js"></script>

    <script>
         $(function() {
            console.clear();
            console.debug('jq started..');


            $('#get').click(function(){
                console.log('onclick on #get clicked..');
                

            })
			
          

            $('a.prev, a.next').on('click', function(e) {
                console.debug("onclicked for a.next or a.prev...");
                console.log('\t+ this : ', this);

                //Event에 의한 선택된 요소의 기본등작을 금지(무력화)
                e.preventDefault();

                // 아래 지역변수에는 Rvalue선택자에 의해서 선택된 요소
                // (즉, form 태그)가 저장됨
                var paginationForm = $('#paginationForm');

                paginationForm.attr('action', '/complaint/listPerPage');
                paginationForm.attr('method', 'GET');

                paginationForm.find('input[name=currPage]').val($(this).attr('href'));
                //paginationForm에서 name 속성의 값이 currPage인 input태그를 찾아라
                //이벤트 타겟의 속성 중 href의 값을 해당 input 태그에 값으로 넣어준다.
                paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
                paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');

                paginationForm.submit();
            });//onclick a.prev, a.next

        });//jq
    </script>
</head>
<body>
 

        
    <div id="container">
       
        <div id="caption">
            <b>요청관리</b>
        </div>
        <div id="sort">
            <div>
               <span>&#10003</span> &#10072;<span>&#10003</span> &#10072;<span>&#10003</span>
            </div> 

            <div>
                <select name="sortCode" id="select">
                    <option value="1">버그리포트</option>
                    <option value="2">영화 수정</option>
                    <option value="3">영화 추가</option>
                    <option value="4">기타</option>
                </select>
            </div>   
        </div>
        <table id="com_table">
           
            
            <thead>
                <tr>
                    <th>번호</th>
                    <th>요청 사항</th>
                    <th>회원</th>
                    <th>작성 날자</th>
                    <th>수정된 날짜</th>
                </tr>
                
            </thead>
                <c:forEach items="${list}" var="complaint">
                    <tr>
                        <td>
                            
                            <c:out value="${complaint.compno}"/>
                        </td>
                        <td id="com_code_td">

                            <a href="/complaint/get?compno=${complaint.compno}">
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
                            </a>
                        </td>
                        <td><c:out value="${complaint.writer}"/></td>
                        <td><fmt:formatDate pattern="yyyy/MM/dd " value="${complaint.insert_ts}"/></td>

                        <c:choose>
                            <c:when test="${complaint.complete_ts != null}">
                                <td><fmt:formatDate pattern="yyyy/MM/dd " value="${complaint.complete_ts}"/></td>
                            </c:when>
                            <c:otherwise>
                                <td><fmt:formatDate pattern="yyyy/MM/dd " value="${complaint.check_ts}"/></td>
                            </c:otherwise>
                        </c:choose>


                    </tr>
                </c:forEach>
                
            <tbody> 	
		
            </tbody>
        </table>
        

        
    </div>
    
    <div id="pagination">
            <form id="paginationForm">
                <!-- 어느 화면에서든, 게시판 목록 페이지로 이동시, 반드시 아래 3개의 기준 전송파라미터를 전송시키기위해 hidden 값으로 설정 -->
                <input type="hidden" name="currPage">
                <input type="hidden" name="amount">
                <input type="hidden" name="pagesPerPage">
                <!-- hidden 태그는 랜더링은 안하지만 서버로 value값을 전달한다. -->
                <!-- JQuery로 value를 넣는다. -->

                <ul>
                    <c:if test="${pageMaker.prev}">
                        <li class="prev"><a class="prev" href="${pageMaker.startPage-1}">Prev</a></li>
                    </c:if>

                    <!-- begin~end까지 반복하고, 현재의 번호값은 var 속성에 넣어준다 -->
                    <c:forEach 
                        begin="${pageMaker.startPage}" 
                        end="${pageMaker.endPage}" 
                        var="pageNum">

                        <li class="${pageMaker.cri.currPage == pageNum ? 'currPage' : ''}">
                            <a 
                                class="${pageMaker.cri.currPage == pageNum ? 'currPage' : ''}"
                                href="/complaint/listPerPage?currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">
                                ${pageNum}
                            </a>
                        </li>
             
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="next"><a class="next" href="${pageMaker.endPage+1}">Next</a></li>
                    </c:if>
                </ul>
            </form>
            
        </div>

    </body>
    </html>