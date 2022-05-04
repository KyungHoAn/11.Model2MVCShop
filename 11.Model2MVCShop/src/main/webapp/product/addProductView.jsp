<%@ page contentType="text/html; charset=euc-kr"%>


<html>
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	
	<style>
		body > div.container{
			border : 3px solid ##D6CDB7;
			margin-top: 10px;
		}
	</style>

	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<title>상품등록</title>
<script type="text/javascript">
	function fncAddProduct() {
		//Form 유효성 검증
		//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']")

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();

		$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
	}

	//<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
	//<a href="javascript:fncAddProduct();">등록</a>
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddProduct();
		});
	});

	//<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
	//<a href="javascript:resetData();">취소</a>
	/* $(function(){
		$("td.ct_btn01:contains('취소')").on("click",function(){
			$("form")[0].reset();
		});
	}); */
	$(function(){
		$("a[href='#']").on("click",function(){
			$("form")[0].reset();
		});
	});
	
	
	function resetData() {
		document.detailForm.reset();
	}
	
	
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		$(function(){
			$("a:contains('판매상품등록')").on("click", function(){
				$(self.location).attr("href","/product/addProduct");
			});
		});
</script>

</head>

<body>

<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target" data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu dropdownhover-bottom">
	                         <li><a href="#">개인정보조회</a></li>
	                         
	                         
	                         	<li><a href="#">회원정보조회</a></li>
	                         
	                         
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               
		              <li class="dropdown">
		                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span>판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu dropdownhover-bottom">
		                         <li><a href="#">판매상품등록</a></li>
		                         <li><a href="#">판매상품관리</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">etc..</a></li>
		                     </ul>
		                </li>
	                 
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu dropdownhover-bottom">
	                         <li><a href="#">상 품 검 색</a></li>
	                         
	                         
	                         
	                         <li><a href="#">최근본상품</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">로그아웃</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- 화면구성 div start/// -->
   	<div class="container">
   		<h1 class="bg-primary text-center">상품등록</h1>
   		
   		<!-- form start/// -->
   		<form class="form-horizontal">
		  <div class="form-group">
		    <label for="prodName" class="col-sm-2 control-label">상품명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-2 control-label">상품상세정보</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-2 control-label">제조일자
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
		    </label>
		    <div class="col-sm-10">
		      <input type="date" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자">
		      &nbsp;
		      <!-- <img src="../images/ct_icon_date.gif" width="15" height="15"
				onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" /> -->
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-2 control-label">가격</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-2 control-label">상품이미지</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="fileName" name="fileName"placeholder="상품이미지">
		    </div>
		  </div>
		  
<!-- 		  <div class ="form-group">
		  	<div class="col-sm-offset-4  col-sm-4 text-center">
		  		<button type="button" class ="ct_btn01">등록</button>
		  		<a class="btn btn-primary btn" href="#" role ="button">취소</a>
		  	</div>
		  </div> -->
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등&nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  
		</form>
		<!-- div end -->
		

   	</div>
</body>
</html>