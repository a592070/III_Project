<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Restaurant</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style>
.sp_search-1 {
	float: left;
}

.box {
	display: flex;
}

.search {
	padding-right: 20px;
}

input {
	height: 40px;
}

.sp_search {
	padding: 10px;
	float: left;
}

select {
	float: left;
}

#inputState.form-control {
	width: 200px;
	padding-left: 20px;
}

h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}

.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}

td {
	color: black;
}

th {
	text-align: center;
}

.pages {
	width: 1140px;
	margin-left: 50px;
	margin-bottom: 50px;
}

.r_sn {
	width: 70px;
	text-align: center;
}

.name {
	width: 270px;
	/* 	text-align: center;	 */
}

.address {
	width: 270px;
	/* 	text-align: center;	 */
}

.region {
	width: 100px;
	text-align: center;
}

.user {
	width: 100px;
	text-align: center;
}

.status {
	width: 150px;
	text-align: center;
}

.modify {
	width: 110px;
	text-align: center;
}

.delete {
	width: 110px;
	text-align: center;
}
</style>

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper"  id="page" >
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
			<div class="content-wrapper">
				<div class="box" >
					<div class="search" class="form-group col-md-2">
<%-- 						<form id="formR" name="formR" --%>
<%-- 							action="<%=application.getContextPath()%>/admin/regionSearch" > --%>
							<span class="sp_search">餐廳地區</span> 
							<select name="region" id="inputState" class="form-control">
								<option value="">請選擇地區</option>
								<option value="基隆">基隆</option>
								<option value="新北">新北</option>
								<option value="台北">台北</option>
								<option value="桃園">桃園</option>
								<option value="新竹">新竹</option>
								<option value="苗栗">苗栗</option>
								<option value="台中">台中</option>
								<option value="彰化">彰化</option>
								<option value="南投">南投</option>
								<option value="雲林">雲林</option>
								<option value="嘉義">嘉義</option>
								<option value="台南">台南</option>
								<option value="高雄">高雄</option>
								<option value="屏東">屏東</option>
								<option value="宜蘭">宜蘭</option>
								<option value="花蓮">花蓮</option>
								<option value="台東">台東</option>
								<option value="澎湖">澎湖</option>
							</select>
<%-- 						</form> --%>
					</div>
					<script>
					$("#inputState").change(function(){
						console.log("change");
						console.log($("#inputState").val());
						var region = $("#inputState").val();
						$('#inputState option:contains(' + region + ')').attr('selected', 'selected');
// 						$('#keyword').val(region);
						$("#page-btn").val(1);
						$(".page-link.last").val('');
						$('#page-botton').click();
										})
					</script>

					<div class="search">
<%-- 						<form action="<%=application.getContextPath()%>/admin/key" method="GET"> --%>
							<span class="sp_search">關鍵字搜尋</span> 
							<input id="keyword" type="text" name="keyword" id="keyword" placeholder="請輸入關鍵字" value="${keyword}"/>
							<button type="submit" class="btn btn-primary" id="page-botton">搜尋</button>
							<Input type='hidden' name='order' value='DESC'>
							<button type="submit" class="btn btn-primary" id="clearkey">清空關鍵字</button>
<%-- 						</form> --%>
					</div>
					<script>
						$('#keyword').change(function(){
							$('#order').val('');
							$("#page-btn").val(1);
							})
							
						$('#clearkey').click(function(){
							console.log("clear");
						  $("#keyword").val('');
						  $('#inputState').val('');
						  $('#order').val('');
						})

					</script>
					
					<div class="search">
						<form action="<%=application.getContextPath()%>/admin/NewRestaurant" method="GET">
							<button type="submit" class="btn btn-success">新增餐廳</button>
						</form>
					</div>

				</div>
				<h2>餐廳列表</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm"  id="table">
						<thead id="thead">
							<tr>
								<th><div>
										<button id="page-botton" class="id-btn">
										<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>ID
											<Input type='hidden' name='orderFiled' id="orderFiled" value='r_sn'>
					<script>
						$('.id-btn').click(function(){
							var order = $('#order').val();
							$('#orderFiled').val('r_sn');
							if(order == "" || order == "ASC"){
								$('#order').val("DESC");
							}else($('#order').val("ASC"));
						})

					</script>
									</div></th>
								<th>餐廳名稱</th>
								<th>餐廳地址</th>
								<th>地區</th>
								<th>會員帳號</th>
								<th><div>
										<button id="page-botton" class="status-btn">
										<i class="fa fa-fw fa-sort" id="uSort"></i>
										</button>
											<Input type='hidden' name='order' id="order" value=''>狀態
											<Input type='hidden' name='orderFiled' id="orderFiled" value='status'>
					<script>
						$('.status-btn').click(function(){
							var order = $('#order').val();
							$('#orderFiled').val('status');
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
							<c:forEach var="r" items="${rBean}">

								<tr>
									<td id="r_sn" class="r_sn">${r.r_sn}</td>
									<td class="name">${r.name}</td>
									<td class="address">${r.address}</td>
									<td class="region">${r.region}</td>
									<td class="user">${r.username}</td>
									<td id="status"><div class="status">

										<c:if test="${r.status == 'N'}">
											<label class="switch switch-text switch-success switch-pill form-control-label">
												<input type="checkbox" class="switch-input form-check-input" value="禁用" id="checkbox">
												<span class="switch-label" data-on="啟用" data-off="禁用" ></span>
												<span class="switch-handle"></span>
											</label>
										</c:if>
										<c:if test="${r.status == 'Y'}">
											<label class="switch switch-text switch-success switch-pill form-control-label">
												<input type="checkbox" class="switch-input form-check-input" value="啟用" id="checkbox" checked="checked">
												<span class="switch-label" data-on="啟用" data-off="禁用"></span>
												<span class="switch-handle"></span>
											</label>
										</c:if>
						
										</div></td>
		
		
		
									<td><div class="modify">

											<form
												action="<%=application.getContextPath()%>/admin/DisplayRestaurant"
												method="POST">
													<button type="submit" class="btn btn-warning">修改</button>
													<Input type='hidden' name='r_sn' value='${r.r_sn}'>
											</form>
											

										</div></td>
									<td><div class="delete">
											<form id="statuss" name="statuss"
												action="<%=application.getContextPath()%>/admin/DeleteRestaurant"
												method="POST" onsubmit="return confirm('確認是否刪除  ${r.name}  餐廳資料？');">
												<button type="submit" class="btn btn-danger">刪除</button>
												<Input type='hidden' name='r_sn' value='${r.r_sn}'>
											</form>
										</div></td>
								</tr>

							</c:forEach>



						</tbody>

					</table>
				</div>

			</div>
			
		<script>
		//啟用 禁用 checkbox
		$("#table").on('change', '#checkbox', function () {
		  var cur_status =$(this).val();
		  if(cur_status=="啟用"){
			  console.log("禁用帳號")
				var r_sn = $(this).closest('td').siblings("#r_sn").text()
				var cgstatus = "禁用"
				var status = 'Y';
				$(this).val(cgstatus)
				$.ajax(
					{
						type: 'POST',
						data: { "r_sn": r_sn, "status": status },
						url: '${pageContext.servletContext.contextPath}/admin/ModifyStatus',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}
					}
				)
			
		  }else{
            console.log("啟用帳號")
			var r_sn = $(this).closest('td').siblings("#r_sn").text()
			var cgstatus = "啟用"
			var status = 'N';
			$(this).val(cgstatus)
			$.ajax(
					{
						type: 'POST',
						data: { "r_sn": r_sn, "status": status },
						url: '${pageContext.servletContext.contextPath}/admin/ModifyStatus',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}

					}
				)
		  }
		})
	</script>
	
	
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
			var keyword = $("#keyword").val();
			var order = $("#order").val();
			var orderFiled = $("#orderFiled").val();
			var region = $("#inputState").val();
			console.log("cgpage = " + cgpage);
			console.log("currentPage = " + currentPage);
			console.log("totalPage = " + totalPage);
			console.log("keyword = " + keyword);
			console.log("order = " + order);
			console.log("orderFiled = " + orderFiled);
			console.log("region = " + region);
					$.ajax(
						{
							type: 'POST',
							data: { "currentPage": currentPage, "cgpage":cgpage, "keyword":keyword, "order":order, "orderFiled":orderFiled, "region":region },
							url: '${pageContext.servletContext.contextPath}/admin/key',
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
									console.log(response.Rlist[i].r_sn);
									res_context += '<tr>';
									res_context += '<td id="r_sn" class="r_sn">' + response.Rlist[i].r_sn + '</td>';
									res_context += '<td class="name">'+ response.Rlist[i].name +'</td>'
										if(response.Rlist[i].address == null){
									res_context += '<td class="user">'+ "暫不提供相關資料" +'</td>'
										}else{
									res_context += '<td class="address">'+ response.Rlist[i].address +'</td>'
												}
									res_context += '<td class="region">'+ response.Rlist[i].region +'</td>'
										if(response.Rlist[i].username == null){
									res_context += '<td class="user">'+ "" +'</td>'
										}else{
									res_context += '<td class="user">'+ response.Rlist[i].username +'</td>'
										}
									res_context += '<td id="status"><div class="status">'
										if(response.Rlist[i].status == "N"){
									res_context += '<label class="switch switch-text switch-success switch-pill form-control-label">'
									res_context += '<input type="checkbox" class="switch-input form-check-input" value="禁用" id="checkbox">'
									res_context += '<span class="switch-label" data-on="啟用" data-off="禁用" ></span>'
									res_context += '<span class="switch-handle"></span>'
									res_context += '</label>'
											}
										if(response.Rlist[i].status == "Y"){
									res_context += '<label class="switch switch-text switch-success switch-pill form-control-label">'
									res_context += '<input type="checkbox" class="switch-input form-check-input" value="啟用" id="checkbox" checked="checked">'
									res_context += '<span class="switch-label" data-on="啟用" data-off="禁用"></span>'
									res_context += '<span class="switch-handle"></span>'
									res_context += '</label>'
										}
									res_context += '</div></td>';
									res_context += '<td><div class="modify">';
									res_context += '<form action="<%=application.getContextPath()%>/admin/DisplayRestaurant" method="POST">';
									res_context += '<button type="submit" class="btn btn-warning">修改</button>';
									res_context += '<Input type="hidden" name="r_sn" value="'+ response.Rlist[i].r_sn + '">';
									res_context += '</form>';
									res_context += '</div></td>';
									res_context += '<td><div class="delete">';
									res_context += '<form id="statuss" name="statuss" action="<%=application.getContextPath()%>/admin/DeleteRestaurant" method="POST" onsubmit="return confirm(`確認是否'
									res_context += response.Rlist[i].name; 
									res_context += '刪除餐廳資料？`);">';
									res_context += '<button type="submit" class="btn btn-danger">刪除</button>';
									res_context += '<Input type="hidden" name="r_sn" value="'+ response.Rlist[i].r_sn + '">';
									res_context += '</form>';
									res_context += '</div></td>';
									res_context += '</tr>';
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
