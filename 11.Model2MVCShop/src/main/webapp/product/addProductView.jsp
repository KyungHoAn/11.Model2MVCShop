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
<title>��ǰ���</title>
<script type="text/javascript">
	function fncAddProduct() {
		//Form ��ȿ�� ����
		//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']")

		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();

		$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
	}

	//<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
	//<a href="javascript:fncAddProduct();">���</a>
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddProduct();
		});
	});

	//<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
	//<a href="javascript:resetData();">���</a>
	/* $(function(){
		$("td.ct_btn01:contains('���')").on("click",function(){
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
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		$(function(){
			$("a:contains('�ǸŻ�ǰ���')").on("click", function(){
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
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu dropdownhover-bottom">
	                         <li><a href="#">����������ȸ</a></li>
	                         
	                         
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         
	                         
	                         <li class="divider"></li>
	                         <li><a href="#">etc...</a></li>
	                     </ul>
	                 </li>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               
		              <li class="dropdown">
		                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span>�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu dropdownhover-bottom">
		                         <li><a href="#">�ǸŻ�ǰ���</a></li>
		                         <li><a href="#">�ǸŻ�ǰ����</a></li>
		                         <li class="divider"></li>
		                         <li><a href="#">etc..</a></li>
		                     </ul>
		                </li>
	                 
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span>��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu dropdownhover-bottom">
	                         <li><a href="#">�� ǰ �� ��</a></li>
	                         
	                         
	                         
	                         <li><a href="#">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">�α׾ƿ�</a></li>
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
   	<!-- ȭ�鱸�� div start/// -->
   	<div class="container">
   		<h1 class="bg-primary text-center">��ǰ���</h1>
   		
   		<!-- form start/// -->
   		<form class="form-horizontal">
		  <div class="form-group">
		    <label for="prodName" class="col-sm-2 control-label">��ǰ��</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-2 control-label">��ǰ������</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-2 control-label">��������
		    <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
		    </label>
		    <div class="col-sm-10">
		      <input type="date" class="form-control" id="manuDate" name="manuDate" placeholder="��������">
		      &nbsp;
		      <!-- <img src="../images/ct_icon_date.gif" width="15" height="15"
				onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" /> -->
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-2 control-label">����</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-2 control-label">��ǰ�̹���</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="fileName" name="fileName"placeholder="��ǰ�̹���">
		    </div>
		  </div>
		  
<!-- 		  <div class ="form-group">
		  	<div class="col-sm-offset-4  col-sm-4 text-center">
		  		<button type="button" class ="ct_btn01">���</button>
		  		<a class="btn btn-primary btn" href="#" role ="button">���</a>
		  	</div>
		  </div> -->
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		  
		</form>
		<!-- div end -->
		

   	</div>
</body>
</html>