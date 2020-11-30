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
								<h2>餐廳訂單列表</h2>
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
										<th><div>
											<button id="page-botton" class="Bid-btn">
											<i class="fa fa-fw fa-sort" id="uSort"></i>
											</button>
											<Input type='hidden' name='order' id="order" value=''>大訂單號
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
									<th><div>
										<button id="page-botton" class="Rid-btn">
										<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>餐廳訂單號
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
											<th class="rname">餐廳名稱</th>
											<th class="d-none d-md-table-cell">訂位人數</th>
											
									
											<th class="d-none d-md-table-cell">訂位時間</th>
											
									<!-- 狀態 -->
									<th><div>
										<button id="page-botton" class="timeid-btn">
											<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>狀態
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
<!-- 												<form id="statuss" name="statuss" -->
<%-- 												action="<%=application.getContextPath()%>/admin/DeleteOrder" --%>
<!-- 												method="POST" onsubmit="return confirm('確認是否刪除此訂單資料？');"> -->
<!-- 												<button type="submit" class="btn btn-danger">刪除</button> -->
<%-- 												<Input type='hidden' name='rid' value='${r.id}'> --%>
<!-- 												</form> -->
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

			<div class="pages">
				<nav aria-label="...">
					<ul class="pagination">
					
								<li class="page-item">
									<button class="page-link" id="page-botton" value="first">第一頁</button>
								</li>
							
							
							<!-- previous -->
								<li class="page-item">
									<button class="page-link previous" id="page-botton" value="previous">&laquo;</button>
								</li>
							
							
							<!-- current page -->
								<li class="page-item active">
									<button class="page-link" class="sr-only" id="page-btn" name="currentPage" value="${currentPage}">${currentPage}</button>
								</li>
						
							<!-- NEXT -->
								<li class="page-item">
									<button class="page-link next" id="page-botton" value="next">&raquo;</button>
								</li>
							
							
							
								<li class="page-item last">
									<button class="page-link last" id="page-botton" value="${totalPage}">最末頁</button>
								</li>

					</ul>
				</nav>
			</div>

			<script>
			$("#page").on('click', '#page-botton', function () {
				var cgpage =$(this).val();
				var currentPage = $("#page-btn").val();
				var totalPage = $(".page-link.last").val();
				var orderFiled = $("#orderFiled").val();
				var order = $("#order").val();
				console.log("cgpage = " + cgpage);
				console.log("currentPage = " + currentPage);
				console.log("totalPage = " + totalPage);
				console.log("orderFiled = " + orderFiled);
				console.log("order = " + order);
				$.ajax(
						{
							type: 'POST',
							data: { "currentPage": currentPage, "cgpage":cgpage, "orderFiled":orderFiled, "order":order },
							url: '${pageContext.servletContext.contextPath}/admin/OrderList',
							dataType: 'json',
							success: function (response) {
								$("#tbody").empty();
								$("#page-btn").remove();
								var current_page = "";
								current_page += '<button class="page-link" class="sr-only" id="page-btn" name="currentPage" value="">' + response.page.currentPage +'</button>';
								$('.page-item.active').html(current_page);
								currentPage = response.page.currentPage;

								$(".page-link.last").remove();
								var total_page = "";
								total_page += '<button class="page-link last" id="page-botton" value="">最末頁</button>';
								$(".page-item.last").html(total_page);
								totalPage = response.page.totalPageCount;
								$('.page-link.last').val(totalPage);

								if(cgpage == totalPage){
									currentPage = totalPage;
									$('#page-btn').empty();
									$('#page-btn').html(currentPage);
								}

								if(currentPage == 1){
									$(".page-link.previous").attr("disabled", true);
								}else{
									$(".page-link.previous").attr("disabled", false);
								}

								if(currentPage == totalPage){
									$(".page-link.next").attr("disabled", true);
								}else{
									$(".page-link.next").attr("disabled", false);
								}

								$('#page-btn').val(currentPage);
								
								var res_context = "";
								for (let i = 0; i < response.Rlist.length; i++) {
									res_context += '<tr>';
									res_context += '<td class="Brid">' + response.Rlist[i].order_id +'</td>';
									res_context += '<td class="rid">'+ response.Rlist[i].id +'</td>';
									res_context += '<td class="rname">'+ response.Rlist[i].name +'</td>';
									res_context += '<td>'+ response.Rlist[i].customer_num +'</td>';
									var t = response.Rlist[i].book_time;
									console.log(t);
									var date = new Date(t);
							        Y = date.getFullYear() + '-';
							        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
							        D = date.getDate() + ' ';
							        if(D < 10){D = '0' + D};
							        h = date.getHours() + ':';
							        m = date.getMinutes() + '0';
							        t = Y+M+D+h+m;
									console.log(t);
									t = t.substr(0,16);
									console.log(response.ts);
									res_context += '<td>'+ t +'</td>';
										if(response.Rlist[i].book_time > response.ts){
									res_context += '<td><span class="badge badge-success">訂單待完成</span></td>';
										}else if(response.Rlist[i].book_time < response.ts){
									res_context += '<td><span class="badge badge-secondary">訂單已完成</span></td>';
												}
									res_context += '<td>';
									res_context += '<form action="<%=application.getContextPath()%>/admin/ROrderDisplay" method="POST">';
										if(response.Rlist[i].book_time > response.ts){
									res_context += '<button type="submit" class="btn btn-warning">修改</button>';
									res_context += '<Input type="hidden" name="rid" value="' + response.Rlist[i].id +'">';
										}else if(response.Rlist[i].book_time < response.ts){
									res_context += '<button type="submit" class="btn btn-warning"  disabled>修改</button>';
										}	
									res_context += '</form></td>';
									res_context += '<td>';
									res_context += '<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#訂單'+ response.Rlist[i].id +'">';
									res_context += '刪除</button>';
									res_context += '<div class="modal fade" id="訂單'+ response.Rlist[i].id +'" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">';
									res_context += '<div class="modal-dialog modal-dialog-centered" role="document">';
									res_context += '<div class="modal-content">';
									res_context += '<div class="modal-header">';
									res_context += '<h5 class="modal-title" id="exampleModalLabel">刪除提醒</h5>';
									res_context += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
									res_context += '<span aria-hidden="true">&times;</span></button></div>';
									res_context += '<div class="modal-body">';
									res_context += '確認刪除餐廳訂單'+ response.Rlist[i].id +'資料？';
									res_context += '</div><div class="modal-footer">';
									res_context += '<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>';
									res_context += '<form id="statuss" name="statuss" action="<%=application.getContextPath()%>/admin/DeleteOrder" method="POST" >';
									res_context += '<button type="submit" class="btn btn-primary">確認</button>';
									res_context += '<Input type="hidden" name="rid" value="'+ response.Rlist[i].id +'">';
									res_context += '</form></div></div></div></div>';
// 									var del = "確認是否刪除此訂單資料？";
<%-- 									res_context += '<form id="statuss" name="statuss" action="<%=application.getContextPath()%>/admin/DeleteOrder" method="POST" onsubmit="return confirm(`del`);">'; --%>
// 									res_context += '<button type="submit" class="btn btn-danger">刪除</button>';
// 									res_context += '<Input type="hidden" name="rid" value="'+ response.Rlist[i].id + '">';
// 									res_context += '</form>';
									res_context += '</td>';
									}
									$("#tbody").html(res_context);
								console.log(currentPage);

							}
						 } 
					)
				})
				
			</script>	


		</div>
	</div>



</body>
</html>