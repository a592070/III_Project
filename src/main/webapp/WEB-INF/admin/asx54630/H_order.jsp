<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Order List</title>

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
											<button id="page-botton" class="Bid-btn">
											<i class="fa fa-fw fa-sort" id="uSort"></i>
											</button>
											<Input type='hidden' name='order' id="order" value=''>
											<Input type='hidden' name='orderFiled' id="orderFiled" value='order_id'>
					<script>
						$('.Bid-btn').click(function(){
							var order = $('#order').val();
							$('#orderFiled').val('order_id');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>
									</div></th>
									
									<!-- 小訂單 -->
									<th><div>餐廳訂單號
										<button id="page-botton" class="Rid-btn">
										<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>
											<Input type='hidden' name='orderFiled' id="orderFiled" value='id'>
					<script>
						$('.Rid-btn').click(function(){
							var order = $('#order').val();
							$('#orderFiled').val('id');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>
									</div></th>
											<th class="rname">飯店名稱</th>
											<th class="d-none d-md-table-cell">房間數:雙人房</th>
											
									
											<th class="d-none d-md-table-cell">房間數:四人房</th>
											
									<!-- 狀態 -->
									<th><div>狀態
										<button id="page-botton" class="timeid-btn">
											<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>
											<Input type='hidden' name='orderFiled' id="orderFiled" value='book_time'>
					<script>
						$('.timeid-btn').click(function(){
							var order = $('#order').val();
							$('#orderFiled').val('book_time');
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
										<c:forEach var="r" items="${Rlist}">
											<tr>
												<td class="Brid">${r.order_id}</td>
												<td class="rid">${r.id}</td>
												<td class="rname">${r.name}</td>
												<td>${r.customer_num}</td>
												<td>
												<c:set var="booktime" value="${r.book_time}" />
												<c:set var="BT" value="${fn:substring(booktime, 0, 16)}" />
												${BT}
												</td>
												
												<c:if test="${r.book_time > ts}">
													<td><span class="badge badge-success">訂單待完成</span></td>
												</c:if>
												<c:if test="${r.book_time < ts}">
													<td><span class="badge badge-secondary">訂單已完成</span></td>
												</c:if>
												
												
												<td>
												<form action="<%=application.getContextPath()%>/admin/ROrderDisplay" method="POST">
												<c:if test="${r.book_time > ts}">
													<button type="submit" class="btn btn-warning">修改</button>
													<Input type='hidden' name='rid' value='${r.id}'>
												</c:if>
												<c:if test="${r.book_time < ts}">
													<button type="submit" class="btn btn-warning"  disabled>修改</button>
												</c:if>
												</form>
												</td>
												<td>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#訂單${r.id}">
											  刪除
											</button>

											<!-- Modal -->
											<div class="modal fade" id="訂單${r.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 											 <div class="modal-dialog modal-dialog-centered" role="document">
  											  <div class="modal-content">
 											     <div class="modal-header">
 											       <h5 class="modal-title" id="exampleModalLabel">刪除提醒</h5>
 											       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  											        <span aria-hidden="true">&times;</span>											
  											      </button>											
  											    </div>
  											    <div class="modal-body">
  											      確認刪除餐廳訂單 ${r.id} 資料？
     											</div>											
 											     <div class="modal-footer">
   											     <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
   											     <form id="statuss" name="statuss" action="<%=application.getContextPath()%>/admin/DeleteOrder" method="POST" >
   											     	<button type="submit" class="btn btn-primary">確認</button>
   											     	<Input type='hidden' name='rid' value='${r.id}'>
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
					</div>
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
			
</body>
</html>			