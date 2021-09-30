<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!--  <link rel="stylesheet" href="/resources/css/footer.css"> -->

	<style>
	    body,input,textarea,select,button,table{font-family:'ELAND 초이스';}
        body,div,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,p,form,fieldset,input,table,tr,th,td{/* margin:0 */;padding:0;}
        h1,h2,h3,h4,h5,h6{font-weight:normal;font-size:100%;}
        ul,ol{list-style:none;}
        fieldset,img{border:0; vertical-align:top;}
        address{font-style:normal;}
        p,li,dd{font-size:1em ; line-height:1.5em ; text-align:justify;}
        /* a-style */
        a{color:#333;text-decoration:none;text-align: center;}
        a:hover,a:active,a:focus,a:visited{color:#333;text-decoration:none;}
		#footer{
		    height : 130px !important;
            background: lightgray;
		}
		
        #footer>div:first-of-type{
            width:998px !important;
            margin: 0 auto !important;
        }
		
		#footer_logoimg img{
		    width : 200px;
		}
		
		#footer_info p {
		    text-align: center !important;
		    margin: 10px 0px 0px 0px !important;
		}
		
		#footer_info p:nth-of-type(3){
		    margin-top : 10px !important;
		}
		
		#footer_buttons div{
		    text-align: center !important;
		    margin-top: 15px !important;
		}
		
		#footer_buttons button:first-of-type{
		    border-radius: 100px;
		}
		
		#footer_buttons div:nth-of-type(2){
		    margin-top: 20px;
		}
		
	</style>


</head>
<body>
    <footer>
        <div id="footer">
            <div class="row">
                <div class="col-3" id="footer_logoimg">
                    <a href="/main">
                    <img id="logoimg" src="/resources/img/filmeeLogo.png" alt="LOGO">
                    </a>
                </div>

                <div class="col-6" id="footer_info" style="width: 499px; font-size:16px">
                    <p>Team_FILMEE</p>
                    <p>
                        address : 서울 강남구 강남대로94길 20 삼오빌딩 602호<br>
                        contact : 02-1234-5678 / team_filmee@filmee.co<a href="/admin/main">m</a>
                    </p>
                    <p>
                        ⓒ2021.FILMEE All rights reserved.
                    </p>

	                <div class="col-3" id="footer_buttons">
	                    <div>
	                        <a href="#">
	                            <button type="button" class="btn btn-outline-dark">TOP</button>
	                        </a>
	                    </div>
		                <div>
		                	<jsp:include page="/WEB-INF/views/complaint/register.jsp"/>                    
		                </div>
		        	</div>
	        	</div>    
            </div>
        </div>
    </footer>
    
    
</body>
</html>
