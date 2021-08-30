<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myPageMain</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>    

	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'/>
    <link rel="stylesheet" href="../resources/css/myPageMainTest.css">
    <link rel="stylesheet" href="../resources/css/layout.css">
    <link rel="stylesheet" href="../resources/css/swiper.css">
    <link rel="stylesheet" href="../resources/css/footer.css">
    
    
    <script src="../resources/js/jquery-1.8.3.min.js"></script>
    <script src="../resources/js/swiper.js"></script>

    <script>
        window.onload = function(){
            var swiper = new Swiper('.swiper-container', {
                         pagination: '.swiper-pagination',
                         paginationType: 'progress',
                         slidesPerView: 'auto',
                         paginationClickable: true,
                         spaceBetween: 0,
                         freeMode: true,
                         nextButton: '.next',
                         prevButton: '.back'
             });
        };        
        		
		function deleteMainReview(rno) {
			
			if(confirm('삭제하시겠습니까?')) {
			
				let formObj = $('#form_'+rno);
				
				formObj.attr("action", "/mypage/deleteMainReview");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMainReview
		
		function deleteMainGuestbook(gno) {
			if(confirm('삭제하시겠습니까?')) {
				
				let formObj = $('#form_'+gno);
				
				formObj.attr("action", "/mypage/deleteMainGuestbook");
				formObj.attr("method", "POST");					
			  
			  	formObj.submit();
			} else {
				;;
			} //if-else
		} //deleteMainGuestbook
	

    </script>

    <style>
    
    	* {
    		text-decoration-line: none !important;
    	}

        #container {
            width: 998px;
            margin: 0 auto;

            font-family:'Florencesans SC Exp', 'ELAND 초이스'; 
        }

        #mypage_info {
            width: 100%;
            height: 300px;            
        }

        #mypage_profile {
            width: 50%;
            height: 300px;           

            padding-left: 10px;
            padding-right: 10px;
            
            float: left;
        }

        #mypage_usable-statistics {
            width: 50%;
            height: 300px;          
            
            float: right;
        }

        #img-thumbnail {
            width: 230px;
            height: 160px;

            float: left;
        }

        #form-control {
            width: 230px;
            height: 160px;

            float: right;
        }

       #userRegBtn {
       		margin-top: 15px;
       }
       
       #followListBtn {
       		float: right;
       		margin-top: 15px;
       }       

        #follower_count {
            width: 45%;
            height: 45%;
            float: left;
        }

        #following_count {
            width: 45%;
            height: 45%;
            float: right;
        }

        #watched_film_count {
            width: 45%;
            height: 45%;
            float: left;
        }

        #my_review_count {
            width: 45%;
            height: 45%;
            float: right;
        }
        
        
        #mypage_usable-statistics li {
            text-align: center;
            line-height: 40px;

            font-size: 20px;
        }

        .inWrap {
            padding-left: 10px;
            padding-right: 10px;
        }      
        
        #myFilmsBtn {
        	margin-left: 900px;
        }      
        
        #film_poster {
            width: 400px;
            height: 300px;
        }
        
         .inner-star::before {
            color: yellow;
        }
        
        .outer-star {
            position: relative;
            display: inline-block;
            color: rgb(177, 175, 175);
        }
        
        .inner-star {
            position: absolute;
            left: 0;
            top: 0;
            width: 0%;
            overflow: hidden;
            white-space: nowrap;
        }
        
        .outer-star::before, .inner-star::before {
            content: '\f005 \f005 \f005 \f005 \f005';
            font-family: 'Font Awesome 5 free';
            font-weight: 900;
        }

        #mypage_review_content {             
            overflow: hidden;
        	text-overflow: ellipsis;
        	white-space: normal;
        	line-height: 1.2;

        	text-align: left;
        	word-wrap: break-word;
        	display: -webkit-box;
        	-webkit-line-clamp: 5 ;
       		-webkit-box-orient: vertical;  			
        }
        
        #mypage_button {
        	position: relative
        }

        #reviewDelBtn {
        	position: absolute;
        	bottom: 10px;
       		right: 20px;
       }
       
       .activity_a {
        	color: blue !important;
        	font-weight: bold;
        }
        
        #activity_review_content_a {
        	display: inline-block;
        	white-space: nowrap;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	width: 150px;
        	        	
        	color: blue;
        	font-weight: bold;        	
        }
        
        #myReviewsBtn {
        	margin-left: 900px;
        }
        
        #activityBtn {
        	margin-left: 320px;
        }
        
        #guestbookBtn {
        	margin-left: 500px;
        	margin-top: 20px;
        }
        
        
        

    </style>
	
	<%@ include file="/resources/html/header.jsp" %>

</head>
<body>


	

    <div id='container'>        

        <div id='mypage_info'>

            <div id='mypage_profile'>
                <h1 class="display-6">Profile</h1>            
                
                <hr>
                
                <div id='mypage_profile_photo_text'>

                    <img id='img-thumbnail' src="../resources/img/${userVO.photo}" class="img-thumbnail" alt="..." >
               
                    <input id='form-control' class="form-control" type="text" value="${userVO.text}" aria-label="readonly input example" readonly>

                    
                
                </div>

                <button type="button" id='userRegBtn' class="btn btn-outline-success">userRegister</button>
                <button type="button" id='followListBtn' class="btn btn-outline-info" onclick="location.href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">followList</button>

            </div>

            <div id='mypage_usable-statistics'>
                <h1 class="display-6">Usable-Statistics</h1>

				<hr>
	
                <div id='follower_count'>
                    <ul>
                        <li><a href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'>follower</a></li>
                        <li><a href='/mypage/follower?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'>${followers}</a></li>
                    </ul>
                </div>

                <div id='following_count'>
                    <ul>
                        <li><a href='/mypage/followee?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'>following</a></li>
                        <li><a href='/mypage/followee?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'>${followees}</a></li>
                    </ul>
                </div>

                <div id='watched_film_count'>
                    <ul>
                        <li><a href='/mypage/films?userid=${cri.userid}&code=2&currPage=1&amount=5&pagesPerPage=5'>watched</a></li>
                        <li><a href='/mypage/films?userid=${cri.userid}&code=2&currPage=1&amount=5&pagesPerPage=5'>${films}</a></li>
                    </ul>
                </div>

                <div id='my_review_count'>
                    <ul>
                        <li><a href='/mypage/myreviews?userid=${cri.userid}&currPage=1&amount=5&pagesPerPage=5'>review</a></li>
                        <li><a href='/mypage/myreviews?userid=${cri.userid}&currPage=1&amount=5&pagesPerPage=5'>${reviews}</a></li>
                    </ul>
                </div>
            </div>

        </div> 
        
        <hr>       

        <section class="feature">            
            
            <div class="inWrap">            

                <h1 class="display-6">Favorite Films</h1>

				<hr>			
                
                <div class="fInner swiper-container">
                    <ul class="swiper-wrapper">
                		<c:forEach items="${filmVO}" var="filmVO">
                        	<li class="swiper-slide"><a href="#" style='background: url(https://www.themoviedb.org/t/p/original${filmVO.poster}) center center no-repeat; background-size: cover;'>
                        	<span>${filmVO.title}<br>(${filmVO.year})</span></a></li>                        
                		</c:forEach>    
                    </ul>             
                    
                    <div class="swiper-pagination"></div>                    
			
                </div>
                <div class="button">
                    <div class="back"><a href="#" style='background: url(../resources/img/back.svg) center center no-repeat; background-size: 30px 30px;'><span class="hidden">back</span></a></div>
                    <div class="next"><a href="#" style='background: url(../resources/img/next.svg) center center no-repeat; background-size: 30px 30px;'><span class="hidden">next</span></a></div>
                </div>
            </div>
            
            <button type="button" id='myFilmsBtn' class="btn btn-outline-info" onclick="location.href='/mypage/films?userid=${cri.userid}&code=1&currPage=1&amount=5&pagesPerPage=5'">more</button>
        </section>
        
        <hr>        

        <div id='mypage_review'>
        
        	<h1 class="display-6">My Reviews</h1>
        	
        	<hr>
        	
			<c:forEach items="${reviewVO}" var="reviewVO">
        	<form action="/mypage/deleteMainReview" method="POST" id='form_${reviewVO.rno}'>
        	
			
				<input type='hidden' name='userid' value='${cri.userid}'>			
					
	                <div class='row'>
	
	                    <div class='col-6'>
	                        <a href='#'><img src='https://www.themoviedb.org/t/p/original${reviewVO.poster}' id='film_poster'></a>
	                    </div>
	
	                    <div class='col-6' id='mypage_button'>
	                    
	                    	<a href='#'  id='mypage_review_title' style='font-size: 25px;'>${reviewVO.title}</a><br>
	                    	
	                    	<div class='RatingStar'>
	                            <div class='RatingScore'>
	                                <div class='outer-star'>	                                
	                                	<div class='inner-star' style='width: ${reviewVO.width}%'></div>
	                                </div>
	                            </div>
	                        </div>	                     
	                        
	                        <h4>${reviewVO.rate} / 5</h4>
	                        
	                        <hr>   	                    	                         
	
	                        <div class='mypage_review_content' id='mypage_review_content'>
	
	                            <a href='#' style='font-size: 17px'>${reviewVO.content}</a>
	
	                        </div>
	                        
	                        <input type='hidden' value='${reviewVO.rno}' name='rno'>
	                        	                        
	                    	<button id='reviewDelBtn' onclick="deleteMainReview('${reviewVO.rno}')" type='button' class="btn btn-outline-danger btn-sm">del</button>                    	
	                        
	                    </div>
	
	                </div>
	                <hr>
                
                </form>
                </c:forEach>
                <button type="button" id='myReviewsBtn' class="btn btn-outline-info" onclick="location.href='/mypage/myreviews?userid=${cri.userid}&currPage=1&amount=5&pagesPerPage=5'">more</button>
        </div>

        <div class='row' id='mypage_bottom'>

            <div class='col-7' id='mypage_guestbook'>
            
	            <div id='mypage_guest_book'>
	
	                <hr>
	
	                <div id='section_table'>				
	                    
						<h1 class="display-6">GuestBook</h1>
	                    
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
							<c:forEach items="${guestbookVO}" var="guestbookVO">
								<form action="/mypage/deleteMainGuestbook" method="POST" id='form_${guestbookVO.gno}'>
									<input type='hidden' name='gno' value='${guestbookVO.gno}'>
									<input type='hidden' name='userid' value='${cri.userid}'>
									<tr>
										<td>${guestbookVO.content}</td>								
										<td><a class='guestbook_a' href='#'>${guestbookVO.nickname}</a></td>										
		                                <td><button onclick="deleteMainGuestbook('${guestbookVO.gno}')" type="button" class="btn btn-outline-danger btn-sm">del</button></td>								
									</tr>                            		
								</form>
							</c:forEach>
							</tbody>						
						</table>
												
						<form action="/mypage/insertGuestbook" method="POST">
							<div class="input-group">						  
							  <textarea id='form-control' class="form-control" aria-label="With textarea" name='content'></textarea>
							  <input type='hidden' name='userid' value='${cri.userid}'>
							  <input type='hidden' name='owner' value='${cri.userid}'>
							  <input type='hidden' name='writer' value='${cri.userid}'>
							  <button type='submit' class="btn btn-info">Submit</button>
							</div>
						</form>					
					</div>                               
	            </div>
				
				<button type="button" id='guestbookBtn' class="btn btn-outline-info" onclick="location.href='/mypage/guestbook?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">more</button>

            </div>

            <div class='col-5' id='mypage_activity'>
            
	            <div id='mypage_activity_log'>
	
	                <hr>
	
	                <div id='section_table'>				
	                    
						<h1 class="display-6">Activity</h1>
	                    
	                    <hr>
	
						<table class="table table-striped table-hover">					
							<thead>
								<tr>
									<th>Content</th>
									<th>insert_ts</th>
	                                <th></th>															
								</tr>
							</thead>
							
							<tbody>
								<c:forEach items="${activityVO}" var="activityVO">
								
									<tr>
										<c:set var='type' value='${activityVO.type}' />
										<c:choose> 
										    <c:when test="${type eq 'RV'}">
										        <td id='activity_review_content_td'>
										        	<a class='activity_a' href='#'>${activityVO.nickname}</a>님이 
										        	<a class='activity_a' href='#'>${activityVO.title}</a>영화에 
										        	<a class='activity_a' href='#' id='activity_review_content_a'>${activityVO.content}</a> 리뷰를 작성하였습니다.
										        </td>
										    </c:when>
										    <c:when test="${type eq 'FW'}">
										        <td>
										        	<a class='activity_a' href='#'>${activityVO.nickname}</a>님을 팔로우 하였습니다.
										        </td>
										    </c:when>
										    <c:when test="${type eq 'RL'}">
										        <td>
										        	<a class='activity_a' href='#'>${activityVO.nickname}</a>님이									        	
										        	<a class='activity_a' href='#' id='activity_review_content'>${activityVO.content}</a> 리뷰를 좋아합니다.									        	
										        </td>
										    </c:when>
										    <c:when test="${type eq 'GB'}">
										        <td>
										        	<a class='activity_a' href='#'>${activityVO.nicknameGuestbook}</a>님이 방명록을 작성하였습니다.									        									        	
										        </td>
										    </c:when>
										    <c:when test="${type eq 'FL'}">
										        <c:set var='code' value='${activityVO.code}' />
										        <c:choose>
											        <c:when test="${code eq '1'}">
											        	<td>
											        		<a class='activity_a' href='#'>${activityVO.nickname}</a>님이 
											        		<a class='activity_a' href='#'>${activityVO.title}</a>영화를 좋아합니다.
											        	</td>
											        </c:when>
											        <c:when test="${code eq '2'}">
											        	<td>
											        		<a class='activity_a' href='#'>${activityVO.nickname}</a>님이 
											        		<a class='activity_a' href='#'>${activityVO.title}</a>영화를 본영화에 추가했습니다.
											        	</td>
											        </c:when>
											        <c:when test="${code eq '3'}">
											        	<td>
											        		<a class='activity_a' href='#'>${activityVO.nickname}</a>님이 
											        		<a class='activity_a' href='#'>${activityVO.title}</a>영화를 볼영화에 추가했습니다.
											        	</td>
											        </c:when>
										        </c:choose>
										    </c:when>
										</c:choose>									
																	
										<td>${activityVO.insertTs}</td>
		                                								
									</tr>
									
	                           	</c:forEach>			
							</tbody>						
						</table>
						
						<button type="button" id='activityBtn' class="btn btn-outline-info" onclick="location.href='/mypage/activity?userid=${cri.userid}&currPage=1&amount=10&pagesPerPage=5'">more</button>					
					</div>                               
	
	            </div>

            </div>

        </div>

		<hr>
	
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