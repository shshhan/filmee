<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>

<html lang="ko">
	<head>
    	<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>header</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.3.2/jquery-migrate.min.js" referrerpolicy="no-referrer"></script>

        <script>

            $(function() {
            console.log('jq started.');

                $('#header_search').on('propertychange change keyup paste input', function() {

                    var filmTitle = $('#header_search').val();
                    var filmTitleComplete = {filmTitle : filmTitle};

                    $.ajax({
                        url:'/search/searchFilmAutoComplete',
                        type:'post',
                        data: filmTitleComplete,
                        success : function(listFilm) { 
                        	
                            $('#autocomplete_result_list').css('display', 'inline-block');
                            
                            $('.searchTrTemp').remove();
                    
                    		console.log('length :' + listFilm.length);
                    		
                    		for(var i = 0; i < listFilm.length; i++) {
                    			console.log('poster : ' + listFilm[i].poster);
                    			console.log('title : ' + listFilm[i].title);
                    			
                    			$('#searchTr').append("<tr class='searchTrTemp' id='searchTr"+i+"'>");
                    			$('#searchTr'+i).append("<td class='searchTd' id='searchTd"+i+"' style='width: 300px'>");                    			
                    			
                    			$('#searchTd'+i).append("<a href='#'><img src='https://www.themoviedb.org/t/p/original"+listFilm[i].poster+"' style='width:150px; height:100px; float: left;'></a>");
                            	$('#searchTd'+i).append("<a href='#' id='searchTitle' style='float: left;'>"+listFilm[i].title+"</a>");
                    		
                    		} //for
                    		
                        } //success
                    
                    }); //ajax
                    
                }); //propertychange change keyup paste input

            }); //.jq        

        </script>
    	
    	<style>    		

			#header{
			    width: 998px;
			    height: 150px;
			    margin: 0 auto;
			    background-color: rgba(240, 230, 230, 0);
			    font-size: 20px;
			    font-family: 'Florencesans SC Exp';
			}
			
            #header_nav_logo {
			    width: 200px;
			    margin: 0;
			}

            #autocomplete_result_list {
                position: absolute;
                top: 90px;
                right: 100px;
                
                width: 300px;

                list-style: none;
            }
            
            #header_select {
            	width: 100px;
            	height: 38px;
            }
            
            #header_search {
            	width: 300px;
            	height: 38px;
            }
    		
    	</style>
	</head>
	<body>
	
		<header>
            <div id='header'>
	        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                  <a class="navbar-brand" href="#"><img id='header_nav_logo'  src='../resources/img/filmeeLogo.png'></a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#" style='display: inline-block'>Login</a>
                        <a class="nav-link" aria-current="page" href="#" style='display: none'>Logout</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#" style='display: inline-block'>Join</a>
                        <a class="nav-link" href="#" style='display: none'>Mypage</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Board</a>
                      </li>                                           
                    </ul>
                    <form class="d-flex">
                        <select id='header_select' class="form-select" aria-label="Default select example">                            
                            <option value="1" selected>film</option>
                            <option value="2">user</option>                            
                        </select>  
                      	<input id='header_search' class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style='width: 300px'>
                      	<table id='autocomplete_result_list' class="table table-striped table-hover" style='display: none'>
                          <tr id='searchTr'><th style='display: none;'></th></tr>
                                                                         
                      	</table>
                      	<button class="btn btn-secondary" type="submit" style='width: 80px; font-size: 13px;'>Search</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
    	</header>

	</body>
</html>