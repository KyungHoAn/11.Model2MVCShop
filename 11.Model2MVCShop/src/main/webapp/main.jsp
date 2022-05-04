<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 
	<script type="text/javascript">
		/* function fncGetProduct() {
			var prodNo = $(this).data("value");
			var prodNo = $(this).attr("data-value",${product.prodNo});
			console.log(prodNo);
			$("form").attr("method","POST").attr("action","/product/getProduct?prodNo="+prodNo).submit;
			self.location="/product/getProduct?prodNo="+prodNo;
		} */
		
		$(function(){
			$("img").on("click",function(){
				var prodNo = $(this).data("value");
				self.location="/product/getProduct?prodNo="+prodNo;
			});
		});
	</script>
	
	
</head>
	
<body role="document">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
     </div>
    </div>

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
<!-- 	<div class="container">
        <h3>나폴레옹은 이렇게 말했다.</h3>
        <p>"오늘 나의 불행은 언젠가 내가 잘못 보낸 시간의 보복이다."</p>
  	 	<h3>"... 장벽은 절실하게 원하지 않는 사람들을 걸러내려고 존재합니다. 장벽은. 당신이 아니라 '다른' 사람들을 멈추게 하려고 거기 있는 것이지요."</h3>
         <h3>혜광스님</h3>
         <p>행복한 삶의 비결은.</p>
         <p>좋아하는 일을 하는 것이 아리라,</p>
         <p>지금 하는 일을 좋아하는 것입니다.</p>
  	 </div> -->

	<div class="container">
		<div class="page-header">
	        <h1>상품이미지</h1>
	     </div>
	      
	      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="3"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="4"></li>
	        </ol>
	        
	        <div class="carousel-inner" role="listbox">
	        
	        <div class="item active">
	            <img src="../images/uploadFiles/AHlbAAAAtDPSiQAA.jpg" alt="Second slide">
	         </div>
	          
	          <c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1}" />
			          <div class="item">
			            <img src="../images/uploadFiles/${product.fileName }" alt="first slide" data-value="${product.prodNo}" onClick ="fncGetProduct()">
			          </div>	          
	          </c:forEach>
	          <!-- 
	          <div class="item">
	            <img src="../images/uploadFiles/AHlbAAAAtDPSiQAA.jpg" alt="Second slide">
	          </div>
	          
	          <div class="item">
	            <img src="../images/uploadFiles/AHlbAAAAtENWVgAB.jpg" alt="Third slide">
	          </div>
	          
	          <div class="item">
	            <img src="../images/uploadFiles/AHlbAAAAug1vsgAA.jpg" alt="fourth slide">
	          </div>
	          
	          <div class="item">
	            <img src="../images/uploadFiles/AHlbAAAAve1WwgAC.jpg" alt="fifth slide">
	          </div>
	          
	          <div class="item">
	            <img src="../images/uploadFiles/AHlbAAAAve37LwAD.jpg" alt="fifth slide">
	          </div>
	          
	          <div class="item">
	            <img src="../images/uploadFiles/AHlbAAAAvetFNwAA.jpg" alt="fifth slide">
	          </div>-->
	        </div>
	        
	        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        
	        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	     </div>
	</div>
	
	
	

</body>

</html>