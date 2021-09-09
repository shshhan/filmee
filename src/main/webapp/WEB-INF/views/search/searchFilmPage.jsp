<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
	<head>
    	<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    
	    <title>FILMEE | FILM MEETING</title>
	    <link rel="icon" href="/resources/img/favicon_noback.ico" type="image/x-icon">
	
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
	
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>
	
		<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>
	    
	    <link rel="stylesheet" href="../resources/css/footer.css">
	    
	    <script>
	    
			$(function() {
	        
			    $('a#prev, a#next').on('click', function(e) {				
					
					e.preventDefault();				
					
					var paginationForm = $('#form_pagination');
					
					paginationForm.attr('action', '/search/f');
					paginationForm.attr('method', 'GET');
					
					paginationForm.find('input[name=searchWord]').val('${pageMaker.cri.searchWord}');
					paginationForm.find('input[name=currPage]').val($(this).attr('href'));
					paginationForm.find('input[name=amount]').val('${pageMaker.cri.amount}');
					paginationForm.find('input[name=pagesPerPage]').val('${pageMaker.cri.pagesPerPage}');
					
					paginationForm.submit();
				});	//onclick
				
			}); //jq
	    
	    </script>
	    
	    <style>
	    
	    	#container {
	            width: 998px;
	            margin: 0 auto;
	
	            font-family: 'ELAND 초이스'; 
        	}
        	
        	#film_poster {
	            width: 400px;
	            height: 300px;
	        }
	        
	        #film_title {
	        	font-size: 23px; 
	        	font-weight: bold;
	        }
	        
	        .photo {
	        	width: 90px;
	        	height: 90px;
	        }
	        
	        .filmInfoList {
	        	float: left;
	        	margin-top: 10px;
	        	width: 25%;
	        	height: 190px;
	        	text-align: center;	        	
	        }
	        
	        #film_info_photo {
	        	margin-top: 10px;
	        	
	        }
	        
	        #directorDiv {
	        	height: 200px;
	        }
	        
	        #castDiv {
	        	height: 200px;
	        }	        
	    
	    </style>
	    
	    <%@ include file="/resources/html/header.jsp" %>
	</head>
	<body>
	
		<div id='container'>
			<div id='mypage_reviews' class='container-sm'>
	
	                <hr>
	                
	                <c:forEach items="${filmList}" var="filmList">
	                
						<input type='hidden' name='searchWord' value='${pageMaker.cri.searchWord}'>
						<input type='hidden' name='title' value='${filmList.title}'>
						<input type='hidden' name='poster' value='${filmList.poster}'>
						<input type='hidden' name='currPage' value='${pageMaker.cri.currPage}'>
						<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						<input type='hidden' name='pagesPerPage' value='${pageMaker.cri.pagesPerPage}'>
		                <div class='row'>
		
		                    <div class='col-6' style='height: 310px'>
		                        <a href='/film/${filmList.filmid}'><img src='https://www.themoviedb.org/t/p/original${filmList.poster}' id='film_poster'></a>
		                    </div>
		
		                    <div class='col-6' style='height: 310px'>
		                    
		                    	<a href='/film/${filmList.filmid}'  id='film_title'>${filmList.title}</a><br>                    	
		                    	
		                        <hr>                                                
		
		                    </div>
		                    
		                    <hr>
		                    
		                    <div>
		                    	<div id='directorDiv'>
								<h6>Director</h6>
		                    	<ul id='film_info_director'>
			                    	<c:forEach items='${filmInfo}' var='filmInfo'>
			                        	<c:set var='filmid_list' value='${filmList.filmid}'/>
			                        	<c:set var='filmid_info' value='#{filmInfo.filmid}'/>
			                        	<c:set var='info_credit' value='#{filmInfo.credit}'/>
			                        	<c:choose>
								  	  		<c:when test="${filmid_list eq filmid_info}">
								  	  			
							  	  				<c:choose>							  	  					
							  	  					<c:when test="${info_credit eq null}">							  	  						
							  	  						<li class='filmInfoList'><img src='https://www.themoviedb.org/t/p/original${filmInfo.photo}' class='photo'><br>${filmInfo.name}<br>as<br>Director</li>
							  	  					</c:when>							  	  					
							  	  				</c:choose>					  	  									  	  			
								  	  		</c:when> 
			                        	</c:choose>
			                        
			                        </c:forEach>
		                    	</ul>
		                    	</div>
		                    	<hr>
		                    	<div id='castDiv'>
		                    	<h6>Cast</h6>
		                    	<ul id='film_info_cast'>
			                    	<c:forEach items='${filmInfo}' var='filmInfo'>
			                        	<c:set var='filmid_list' value='${filmList.filmid}'/>
			                        	<c:set var='filmid_info' value='#{filmInfo.filmid}'/>
			                        	<c:set var='info_credit' value='#{filmInfo.credit}'/>
			                        	<c:choose>
								  	  		<c:when test="${filmid_list eq filmid_info}">								  	  		
								  	  			<c:choose>
							  	  					<c:when test="${info_credit ne null}">							  	  						
							  	  						<li class='filmInfoList'><img src='https://www.themoviedb.org/t/p/original${filmInfo.photo}' class='photo'><br>${filmInfo.name}<br>as<br>${filmInfo.character}</li>
							  	  					</c:when>
								  	  			</c:choose>							  	  			
								  	  		</c:when> 
			                        	</c:choose>
			                        
			                        </c:forEach>
		                    	</ul>
		                    	</div>
		                    </div>
		
		                </div>
	                
	                	<hr>
	                	
	                </c:forEach>                    
	
			</div>
	
            <div id='section_pagination'>

                <hr>
                
                <form id='form_pagination'>
                	<input type='hidden' name='searchWord'>                	
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
						    <li class="${pageMaker.cri.currPage == pageNum ? 'page-item active' : 'page-item'}">
						    	<a class="page-link" href="/search/f?searchWord=${pageMaker.cri.searchWord}&currPage=${pageNum}&amount=${pageMaker.cri.amount}&pagesPerPage=${pageMaker.cri.pagesPerPage}">${pageNum}</a>
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