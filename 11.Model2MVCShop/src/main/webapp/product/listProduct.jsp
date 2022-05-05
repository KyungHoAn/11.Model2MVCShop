<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>상품 목록 조회</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<!-- Bootstrap, jQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>  
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   	<link href="/css/animate.min.css" rel="stylesheet">
   	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
	<!-- Bootstrap Dropdown Hover JS -->
   	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
    <!-- jQuery UI toolTip 사용 CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- jQuery UI toolTip 사용 JS-->
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
  	<style>
  		body{
  			padding-top: 50px;
  		}
  	</style>
	<script type="text/javascript">

	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${param.menu}").submit();	
	}
	

	
	$(function(){
		
		$("td.ct_btn01:contains('검색')").on("click",function(){
			fncGetUserList(1);
		});
		
		$(".ct_list_pop td:nth-child(5)").on("click",function(){
			var prodNo = $(this).data("value");
			if(${param.menu == 'manage'}){
				self.location ="/product/updateProductView?prodNo="+prodNo;
			}else{
				self.location="/product/getProduct?prodNo="+prodNo;
			}
		});
		

		
		$(".ct_list_pop td:nth-child(5)").css("color","red");
		
		$(".ct_list_pop:nth-child(4n+6)").css("background-color","whitesmoke");
	});
	
  	$(function(){
		$(".ct_list_pop td:nth-child(13) > i").on("click",function(){
			 var prodNo = $(this).next().val();
			/* var prodNo = $(this).data("value"); */
			$.ajax({
				url : "/product/json/getProduct/"+prodNo ,
				method:"GET",
				dataType:"json",
				headers:{
					"Accept":"application/json",
					"Content-Type":"application/json"
				},
				
				success : function(JSONData, status){
					var displayvalue="<h6>"
						+"상품명 : "+JSONData.prodName+"<br/>"
						+"상품이미지 : "+JSONData.fileName+"<br/>"
						+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
						+"제조일자 :"+JSONData.manuDate+"<br/>"
						+"가격 : "+JSONData.price+"<br/>"
						+"등록일자 : "+JSONData.regDate+"<br/>"
						+"</h6>";
				
					$("h6").remove();
					$("#"+prodNo+"").html(displayvalue);
				}
			});
		});
	});
	
</script>

</head>
<body>
	<!-- ToolBar start -->
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!-- 화면 구성 -->
	<div class="container">
		<div class="page-header text-info">
			<h3>상품목록조회</h3>
		</div>
	
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품No</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<table class="table table-hover table-striped">
			
			<thead>
				<tr>
					<td class="ct_list_b" width="100">상품이미지</td>
					<td class="ct_line02"></td>
					<th class="ct_list_b" width="100">No</th>
					<th class="ct_line02"></th>
					<th class="ct_list_b" width="150">상품명</th>
					<th class="ct_line02"></th>
					<th class="ct_list_b" width="150">가격</th>
					<th class="ct_line02"></th>
					<th class="ct_list_b" width="150">등록일</th>
					<th class="ct_line02"></th>
					<th class="ct_list_b" width="150">현재상태</th>
					<th class="ct_line02"></th>
					<th class="ct_list_b" width="150">간략정보</th>
				</tr>
			</thead>
			
			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr class="ct_list_pop">
						<td align="left"><img src="../images/uploadFiles/${product.fileName}" width="100%" height="100%"></td>
						<td></td>
						<td align="center">${i}</td>
						<td></td>
						<td align="left" data-value="${product.prodNo}">
						<c:choose>
								<c:when test="${param.menu eq 'manage' }">
									<!-- <a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a> -->
									${product.prodName }
								</c:when>
								<c:otherwise>
									<!-- <a href="/product/getProduct?prodNo=${product.prodNo}"></a> -->
									${product.prodName}
								</c:otherwise>
						</c:choose></td>
						<td></td>
						<td align="left">${product.price}</td>
						<td></td>
						<td align="left">${product.regDate}</td>
						<td></td>
						<td align="left">${product.proTranCode}</td>
						<td></td>
						<td align="left" data-value="${product.prodNo }">
							<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
				  			<input type="hidden" value="${product.prodNo}">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		</div>
		<!-- PageNavigation Start... -->
		<jsp:include page="../common/pageNavigator_new.jsp"/>
		<!-- PageNavigation End... -->
			
	</body>
	
</html>