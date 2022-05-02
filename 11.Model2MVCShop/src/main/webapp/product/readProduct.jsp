<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html> 
<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<title>��ǰ����</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
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
	
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	
	<style>
		body{
			padding-top: 50px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$("button").on("click",function(){
				self.location="/purchase/addPurchaseView?prodNo="+prodNo;
			});
		});
	</script>

</head>

<body>
	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
		<div class="page-header text-center">
			<h3 class="text-info">��ǰ������ȸ</h3>
			<h5 class="text-muted">��ǰ�� <strong class="text-danger">�ֽ�����</strong>�Դϴ�.</h5>
		</div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src="../images/uploadFiles/${product.fileName}"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>	
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>	
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-md-12 text-center " data-value="${product.prodNo}">
	  			<button type="button" class="btn btn-primary">����</button>
	  			<!--<a href="/purchase/addPurchaseView?prodNo=${product.prodNo}">����</a>  -->
	  		</div>
		</div>
		
		<br/>	
	</div>	

</body>
</html>