
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!--  JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<title>상품정보수정</title>
	<meta charset="EUC-KR">
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
    
	<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script type="text/javascript">

		function fncUpdateProduct(){
			$("form").attr("method","POST").attr("action","/product/updateProduct").submit();
		}
		
		//============= "수정"  Event 연결 =============
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateProduct();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
 		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});
		
		/*  $(function(){
			$("td.ct_btn01:contains('수정')").on("click", function(){
				fncUpdateProduct();
			});
	
		});
		
		//<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
		//<a href="javascript:history.go(-1)">취소</a>
	 	$(function(){
			$("td.ct_btn01:contains('취소')").on("click", function(){
				history.go(-1);
			});
		}); */

</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp"/>

	<div class="container">
		<div class="page-header text-center">
			<h3 class="text-info">상품정보수정</h3>
			<h5 class="text-muted">내 상품을 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
		</div>
	<form class="form-horizontal">
	<input type="hidden" name="prodNo" value="${product.prodNo}" />
	  <div class="form-group">
	    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명" value="${product.prodName}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보" value="${product.prodDetail}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="manuDate" placeholder="제조일자" name="manuDate"
	      class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6" value="${product.manuDate }">&nbsp;
	      <img src="../images/ct_icon_date.gif" width="15" height="15" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="price" name="price" placeholder="가격" 
	      value="${product.price}" style="width: 100px; height: 19px" maxLength="10" minLength="6">원  
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
	    <div class="col-sm-5">
	      <input type="file" class="form-control" id="fileName" placeholder="상품이미지" style="width: 200px; height: 19px" maxLength="13" value="${product.fileName }"/>  
	     </div>
	  </div>
	  
	  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
	  </div>
		  
	</form>
	
	</div>
	
	</body>
</html>