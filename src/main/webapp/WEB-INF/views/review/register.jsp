  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link href="/resources/css/letterboxd.css" rel="stylesheet" media="screen, projection" />



<script src="/resources/js/review.js"></script>


	<article id="add-film" class="clearfix expanded">
		<section class="not-expanded">
		</section>
		
		<aside class="col-4 left gutter-right-1 expanded">
			<a id="back-to-film-search" href="#" class="replace back-button" style="display: none;">Back</a>
			<section id="poster-frame" class="poster-list -p150 no-hover">

<div>
<img src="https://www.themoviedb.org/t/p/original${filmVO.poster_path}" width="150" height="225" 
alt="${filmVO.title}" class="image">
<a href="/film/${filmVO.film_id}" class="frame" target="_blank"></a>
</div>
<!-- </div> -->
</section>
			
		</aside>
		
		<% 
			Integer writer = (Integer) session.getAttribute("userId");
		%>
		
		<section class="col col-13 overflow expanded">
			<h1 id="diary-entry-form-heading" >${filmVO.title} </h1>
			<h2 class="headline-2 prettify"> <fmt:formatDate value="${filmVO.release_date}" pattern="yyyy" /></h2>
			
			 <form method="POST" action="/film/${filmVO.film_id}/review/register" id="diary-entry-form" class="fields-reversed">
			 	
				<input type="hidden" name="film_id" value="${filmVO.film_id}" id="frm-film-id">
	            <input type="hidden" name="writer" value="${__LOGIN__.userId}">
	          
	            
				<fieldset>
					
					<div class="form-row">
						<textarea name="content" id="frm-review" class="field" placeholder="리뷰를 작성해보세요"></textarea>
					</div>
					<div class="form-row clearfix">
					
					
						<!-- <div class="col col-4 col-right has-topnote rate-film">
							<label>별점</label>
							<p class="note -topnote rating-text"></p>
							<input id="frm-rating" name="rating" type="range" min="0" max="10" step="1" value="0" style="display: none;">
							<div class="rateit" data-rateit-backingfld="#frm-rating" data-rateit-starwidth="13" data-rateit-starheight="26" data-rateit-resetable="true"><button id="rateit-reset-2" class="rateit-reset" aria-label="reset rating" aria-controls="rateit-range-2" style="display: block;"></button><div id="rateit-range-2" class="rateit-range" tabindex="0" role="slider" aria-label="rating" aria-owns="rateit-reset-2" aria-valuemin="0" aria-valuemax="10" aria-valuenow="0" style="width: 130px; height: 26px;" aria-readonly="false"><div class="rateit-selected" style="height: 26px; width: 0px;"></div><div class="rateit-hover" style="height:26px"></div></div></div>
						</div> -->
					</div>
					<div class="form-row clearfix row-last  row-sharing">


						<div class="col right">
							<input id="diary-entry-submit-button" type="submit" class="button -action button-action" value="리뷰등록">
						</div>
					</div>
				</fieldset>
			 </form> 
		</section>
	</article>