<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPageGuestBook</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/footer.css">
    
    <script>
    
	    $(function() {
	        
		    $('a#prev, a#next').on('click', function(e) {				
				
				e.preventDefault();				
				
				var paginationForm = $('#form_pagination');
				
				paginationForm.attr('action', '/mypage/guestbook');
				paginationForm.attr('method', 'GET');
				
				paginationForm.find('input[name=userid]').val('${pageMaker.criG.userid}');
				paginationForm.find('input[name=currPage]').val($(this).attr('href'));
				paginationForm.find('input[name=amount]').val('${pageMaker.criG.amount}');
				paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.criG.pagesPerPage}');
				
				paginationForm.submit();
			});	//onclick
			
		}); //jq
		
		function deleteGuestbook(gno) {
			if(confirm('삭제하시겠습니까?')) {
				
				let formObj = $('#form_'+gno);
				
				formObj.attr("action", "/mypage/deleteGuestbook");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMainGuestbook
    	
    </script>

    <style>

        #container {
            width: 998px;
            margin: 0 auto;

            font-family:'Florencesans SC Exp', 'ELAND 초이스'; 
        }

        #mypage_top_menu {
            font-size: 16px;
        }
        
        .guestbook_a {
        	color: blue !important;
        	font-weight: bold;
        }
        
        a.nav-link.active {
        	background-color: #C2DBFE  !important;
        }
    
    </style>

</head>
<body>

    <header>
        <div id="header">
            <a href="/main">
                <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
            </a>
            <ul id="headermenu">
                <li><a href="">LOGIN</a></li>
                <li><a href="">CREATE ACCOUNT</a></li>
                <li><a href="/board/list">BOARD</a></li>
                <li>
                    <input type="search" placeholder="Search" class="search-field" />
                    <button type="submit" class="search-button">
                    </button>
                </li>
                <li> <img id="searchimg" src="/resources/img/search.png" >
                </li>
            </ul>
        </div>

    </header>

    <section>

        <div id='container'>

            <div id='mypage_top_menu'>

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    
                    <div class="container-fluid">
                      
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                      
                        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-pills" style='font-size: 20px; font-weight: bold;'>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/activity?userid=${pageMaker.criG.userid}&currPage=1&amount=10&pagesPerPage=5">Activity</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/films?userid=${pageMaker.criG.userid}&code=1&currPage=1&amount=5&pagesPerPage=5">Films</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/myreviews?userid=${pageMaker.criG.userid}&currPage=1&amount=5&pagesPerPage=5">Reviews</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/follower?userid=${pageMaker.criG.userid}&currPage=1&amount=10&pagesPerPage=5">Follows</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">GuestBook</a>
                            </li>
                        </ul>                        
                      </div>


                    </div>
                  
                </nav>

            </div>

            <div id='mypage_guest_book'>

                <hr>

                <div id='section_table'>				
                    
					<p style='font-size: 18px'>GuestBook</p>
                    
                    <hr>

					<table class="table table-striped table-hover">					
						<thead>
							<tr>
								<th>Content</th>
								<th>nickname</th>
                                <th></th>															
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${guestbook}" var="guestbook">							
								<form action="/mypage/deleteGuestbook" method="POST" id='form_${guestbook.gno}'>
									<input type='hidden' name='gno' value='${guestbook.gno}'>
									<input type='hidden' name='userid' value='${pageMaker.criG.userid}'>
									<input type='hidden' name='currPage' value='${pageMaker.criG.currPage}'>
									<input type='hidden' name='amount' value='${pageMaker.criG.amount}'>
									<input type='hidden' name='pagesPerPage' value='${pageMaker.criG.pagesPerPage}'>
								<tr>
									<td>${guestbook.content}</td>								
									<td><a class='guestbook_a' href='#'>${guestbook.nickname}</a></td>
	                                <td><button onclick="deleteGuestbook('${guestbook.gno}')" type="button" class="btn btn-outline-danger btn-sm">del</button></td>								
								</tr>
								</form>                            
                            </c:forEach>			
						</tbody>						
					</table>					
				</div>                               

            </div>

            <div id='section_pagination'>

                <hr>
                
                <form id='form_pagination'>
                	<input type='hidden' name='userid'>
                    <input type='hidden' name='currPage'>
                    <input type='hidden' name='amount'>
                    <input type='hidden' name='pagesPerPage'>
                    						
                    
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                          <c:if test='${pageMaker.prev}'>
                            <li class="page-item">						    
                              <a id='prev' class="page-link" href='${pageMaker.startPage - 1}' aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                        </c:if>
                        
                        <c:forEach begin='${pageMaker.startPage}' end='${pageMaker.endPage}' var='pageNum'>
						    <li class="${pageMaker.criG.currPage == pageNum ? 'page-item active' : 'page-item'}">
						    	<a class="page-link" href="/mypage/guestbook?userid=${pageMaker.criG.userid}&currPage=${pageNum}&amount=${pageMaker.criG.amount}&pagesPerPage=${pageMaker.criG.pagesPerPage}">${pageNum}</a>
						    </li>
						</c:forEach>

                        <c:if test='${pageMaker.next}'>	
                            <li class="page-item">
                              <a id='next' class="page-link" href='${pageMaker.endPage + 1}' aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                            </li>
                        </c:if>
                      </ul>
                    </nav>
                </form>
            </div>

        </div>

    </section>


    <footer>
        <div id="footer">
            <a href="/main">
                <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
            </a>
            <div id="pageinfo">
                <p>
                    서울특별시 강남구 <br> 
                    010-9876-5432<br>
                    abcedferasdavazsdfzsdf
                </p>
            </div>
            <div id="bugreport">
                <button>의견보내기</button>
            </div>
        </div>
    </footer>
</body>
</html>