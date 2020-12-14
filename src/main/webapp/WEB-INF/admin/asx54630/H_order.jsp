<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Order List</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style type="text/css">
td {
	color: black;
}

.rname {
	width: 200px;
}

.rid {
	width: 170px;
}
.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}
.pages {
	width: 1140px;
	margin-left: 50px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper" id="page" >
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
			<div class="content-wrapper">

				<div class="row">
					<div class="col-12">

						<!-- Recent Order Table -->
						<div class="card card-table-border-none" id="recent-orders">
							<div class="card-header justify-content-between">
								<h2>飯店訂單列表</h2>
								<div class="date-range-report ">
									<span></span>
								</div>
							</div>
							<div class="card-body pt-0 pb-5">
								<table
									class="table card-table table-responsive table-responsive-large"
									style="width: 100%">
									<thead>
										<tr>
										
										<!-- 大訂單 -->
										<th><div>大訂單號
											<button id="sortID" class="Bid-btn">
											<i class="fa fa-fw fa-sort" id="uSort"></i>
											</button>
											<Input type='hidden' name='order' id="order" value=''>
											<Input type='hidden' name='orderfiled' id="orderfiled" value='ORDER_ID'>
					<script>
						$('.Bid-btn').click(function(){
							var order = $('#order').val();
							$('#orderfiled').val('ORDER_ID');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>
									</div></th>
									
									<!-- 小訂單 -->
									<th><div>飯店訂單號
										<button id="sortSN" class="Rid-btn">
										<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>
											<Input type='hidden' name='orderfiled' id="orderfiled" value='SN_ORDER'>
					<script>
						$('.Rid-btn').click(function(){
							var order = $('#order').val();
							$('#orderfiled').val('SN_ORDER');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>
									</div></th>
											<th class="rname">飯店名稱</th>
											<th class="d-none d-md-table-cell">房間數:雙人房</th>
											<th class="d-none d-md-table-cell">房間數:四人房</th>
											<th class="d-none d-md-table-cell">入住日期</th>
											<th class="d-none d-md-table-cell">退房日期</th>
											
									<!-- 狀態 -->
									<th><div>狀態
										<button id="sortStatus" class="timeid-btn">
											<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>
											<Input type='hidden' name='orderfiled' id="orderfiled" value="CHECK_OUT">
					<script>
						$('.timeid-btn').click(function(){
							var order = $('#order').val();
							$('#orderfiled').val('CHECK_OUT');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>
									</div></th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
									</thead>
									<tbody id="tbody">
										<c:forEach var="hotels" items="${hotelOdata}">
											<tr>
												<td class="rid">${hotels.ORDER_ID}</td>
												<td class="Brid">${hotels.SN_ORDER}</td>
												<td class="rname">${hotels.NAME}</td>
												<td>${hotels.DOUBLE_ROOM}</td>
												<td>${hotels.QUADRUPLE_ROOM}</td>
												<td>${hotels.CHECK_IN}</td>
												<td>${hotels.CHECK_OUT}</td>
												
												<c:if test="${hotels.CHECK_OUT > date}">
													<td><span class="badge badge-success">訂單待完成</span></td>
												</c:if>
												<c:if test="${hotels.CHECK_OUT < date}">
													<td><span class="badge badge-secondary">訂單已完成</span></td>
												</c:if>
												
												
												<td>
												<form>
												<c:if test="${hotels.CHECK_OUT > date}">
													<Input type='hidden' name='detailsn' value='${hotels.SN_ORDER}'>
													<button type="submit" class="btn btn-warning">修改</button>
												</c:if>
												<c:if test="${hotels.CHECK_OUT < date}">
													<button type="submit" class="btn btn-warning"  disabled>修改</button>
												</c:if>
												</form>
												</td>
												<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#Hotel${hotels.SN_ORDER}" >刪除</button>
               
               								<div class="modal fade" id="Hotel${hotels.SN_ORDER}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        									 <div class="modal-dialog modal-dialog-centered" role="document">
         			  							<div class="modal-content">
         			   							 <div class="modal-header">
             			 						 <h5 class="modal-title" id="exampleModalCenterTitle">刪除提醒</h5>
             			  						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
               				  						<span aria-hidden="true">&times;</span>
              			 						 </button>
           			  							</div>
            									 <div class="modal-body">
                								<form action="hotelOrderdelete" method="POST">
                								<input type="hidden" value="${hotels.SN_ORDER}" name="deleteId">
                   								 <div class="form-group">
                    	 						 <h4>是否確認刪除  ${hotels.SN_ORDER} 住宿資料?</h4>
                    						 </div>
               									 <div class="modal-footer">
                 	 						<button type="submit" class="btn btn-primary">確認</button>
                  							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
               			 			</div>
                 	 			</form> 
            				 </div>
          		 			</div>
       	  				 </div>
      		 			</div>
												</td>

											</tr>


										</c:forEach>
									</tbody>
								</table>
							</div>
							
						</div>
						 
						 <div>
				<nav aria-label="...">
					<ul class="pagination">
						
								<li class="page-item first" id ="fBtn">
									<button type="button" class="page-link first" id="page-first" value="first">第一頁</button>
								</li>
							
							
								<!--previous -->
								<li class="page-item previous" id="pBtn">
									<button class="page-link previous " id="page-previous" value="previous">&laquo;</button>
<!-- 										<button class="page-link previous " id="page-previous" value="previous">上一頁</button> -->
								</li>
							
							
								<!--current page -->
								<li class="page-item active">
									<button class="page-link" class="sr-only" id="page-btn" name="currentPage" value="${currentPage}">${currentPage}/${totalPage}</button>
								</li>
						
								<!--NEXT -->
								<li class="page-item next" id ="nBtn">
									<button class="page-link next" id="page-next" value="next">&raquo;</button>
<!-- 									<button class="page-link next" id="page-next" value="next">下一頁</button> -->
								</li>
							
							
							
								<li class="page-item last" id ="lBtn">
									<button class="page-link last" id="page-last" value="last">最末頁</button>
								</li>
							
					
					</ul>
				</nav>
			</div>
					</div>
				</div>

			</div>

        
			<script type="text/javascript"> 
      		 var currentPage = 1;
			 var totalPage = 1;
		
			$("#sortID").click(function () {
			console.log("編號排序")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage  },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
			})
		
			$("#sortSN").click(function () {
			console.log("排序狀態")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
			})
			
			$("#sortStatus").click(function () {
			console.log("排序狀態")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
			})
		
 			$("#page-first").click(function () {
			console.log("第一頁")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			var pagebotton = $("#page-first").val()
			currentPage = 1;
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			console.log("totalPage =" + totalPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
			})
		
			$("#page-previous").click(function () {
			console.log("前一頁")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			var pagebotton = $("#page-previous").val()
			currentPage--;
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			console.log("totalPage =" + totalPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
			})
		
			$("#page-next").click(function () {
			console.log("下一頁")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			var pagebotton = $("#page-next").val()
			currentPage++;
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			console.log("totalPage =" + totalPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response);
						}

					}
				)
			})
		
			$("#page-last").click(function () {
			console.log("末頁")
			var orderfiled = $("#orderfiled").val()
			var order = $("#order").val()
			var pagebotton = $("#page-last").val()
			//var currentPage = $("#page-btn").val()
			currentPage = totalPage;
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
			console.log("totalPage =" + totalPage);
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "orderfiled": orderfiled, "order": order, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/hotelOrderPage',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
			})
		
			function clickdetail(id){

			document.location.href="${pageContext.servletContext.contextPath}/admin/hoteldetail?detailsn="+id;

			}
		
			
			</script> 
		
			</div>
		</div>
</body>
</html>			