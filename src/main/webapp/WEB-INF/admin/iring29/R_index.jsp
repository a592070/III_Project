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
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="box">
					<div class="search" class="form-group col-md-2">
						<form id="formR" name="formR"
							action="<%=application.getContextPath()%>/regionSearch"
							method="POST">
							<span class="sp_search">餐廳地區</span> 
							<select name="region_name" id="inputState" class="form-control">
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
						</form>
					</div>
					<script>
				$("#inputState").change(function(){
						console.log("change");
						console.log($("#inputState").val());
						document.formR.attributes["action"].value ="<%=application.getContextPath()%>/regionSearch";
						document.formR.submit();
										})
					</script>

					<div class="search">
						<form action="<%=application.getContextPath()%>/key" method="GET">
							<span class="sp_search">關鍵字搜尋</span> <input type="text"
								name="keyword" placeholder="請輸入關鍵字" />
							<button type="submit" class="btn btn-primary">搜尋</button>
						</form>
					</div>
					
					<div class="search">
						<form action="<%=application.getContextPath()%>/NewRestaurant" method="GET">
							<button type="submit" class="btn btn-success">新增餐廳</button>
						</form>
					</div>

				</div>
				<h2>餐廳列表</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>ID</th>
								<th><div>
										<form id="statuss" name="statuss"
											action="<%=application.getContextPath()%>/key">
											<button>
												<svg width="2em" height="1em" viewBox="0 0 16 16"
													class="bi bi-arrow-down-up" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd"
														d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z" />
										</svg>
											</button>
											<Input type='hidden' name='currentKPage' value='1'> 
											<Input type='hidden' name='orderFiled' value='name'> 
											<Input type='hidden' name='keyword' value='${keyword}'> 
											<Input type='hidden' name='order' value='${order}'> 餐廳名稱
										</form>
									</div></th>
								<th><div>
										<form id="statuss" name="statuss"
											action="<%=application.getContextPath()%>/key">
											<button>
												<svg width="2em" height="1em" viewBox="0 0 16 16"
													class="bi bi-arrow-down-up" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd"
														d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z" />
										</svg>
											</button>
											<Input type='hidden' name='currentKPage' value='1'> 
											<Input type='hidden' name='orderFiled' value='address'>
											<Input type='hidden' name='keyword' value='${keyword}'>
											<Input type='hidden' name='order' value='${order}'> 餐廳地址
										</form>
									</div></th>
								<th><div>
										<form id="statuss" name="statuss"
											action="<%=application.getContextPath()%>/key">
											<button>
												<svg width="2em" height="1em" viewBox="0 0 16 16"
													class="bi bi-arrow-down-up" fill="currentColor"
													xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd"
														d="M11.5 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L11 2.707V14.5a.5.5 0 0 0 .5.5zm-7-14a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L4 13.293V1.5a.5.5 0 0 1 .5-.5z" />
										</svg>
											</button>
											<Input type='hidden' name='currentKPage' value='1'> 
											<Input type='hidden' name='orderFiled' value='region'> 
											<Input type='hidden' name='keyword' value='${keyword}'>
											<Input type='hidden' name='order' value='${order}'> 地區
										</form>
									</div></th>
								<th>會員帳號</th>
								<th>狀態</th>
								<th>修改</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${rBean}">

								<tr>
									<td class="r_sn">${r.r_sn}</td>
									<td class="name">${r.name}</td>
									<td class="address">${r.address}</td>
									<td class="region">${r.region}</td>
									<td class="user">${r.username}</td>
									<td><div class="status">
									<form id="changestatus" name="changestatus" action="<%=application.getContextPath()%>/ModifyStatus" 
									method = "POST" onsubmit="return confirm('確認是否修改狀態？');" >
									<button type="submit">
										<c:if test="${r.status == 'N'}">
											<label class="switch switch-text switch-success switch-pill form-control-label">
												<input type="checkbox" class="switch-input form-check-input" value="on" id="myCheck" onclick="myFunction()">
												<span class="switch-label" data-on="On" data-off="Off"></span>
												<span class="switch-handle"></span>
											</label>
										</c:if>
										<c:if test="${r.status == 'Y'}">
											<label class="switch switch-text switch-success switch-pill form-control-label">
												<input type="checkbox" class="switch-input form-check-input" value="on" checked id="myCheck" onclick="myFunction()">
												<span class="switch-label" data-on="On" data-off="Off"></span>
												<span class="switch-handle"></span>
											</label>
										</c:if>
										</button>
											<Input type='hidden' name='status' value='${r.status}'>
											<Input type='hidden' name='r_sn' value='${r.r_sn}'>
									</form>		
						
										</div></td>
		
		
		
									<td><div class="modify">

											<form
												action="<%=application.getContextPath()%>/DisplayRestaurant"
												method="POST">
													<button type="submit" class="btn btn-warning">修改</button>
													<Input type='hidden' name='r_sn' value='${r.r_sn}'>
											</form>
											

										</div></td>
									<td><div class="delete">
											<form id="statuss" name="statuss"
												action="<%=application.getContextPath()%>/DeleteRestaurant"
												method="POST" onsubmit="return confirm('確認是否刪除此餐廳資料？');">
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


			<div class="pages">
				<nav aria-label="...">
					<ul class="pagination">
						<c:if test="${currentPage != null}">
							<c:if test="${currentPage == 1}">
								<li class="page-item disabled">
									<a class="page-link"href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage-1}" tabindex="-1">第一頁</a>
								</li>
							</c:if>
							
							<c:if test="${currentPage > 1}">
								<li class="page-item">
								<a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=1"tabindex="-1">第一頁</a>
								</li>
							</c:if>
							<c:if test="${currentPage > 1}">
								<li class="page-item">
								<a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage-1}"tabindex="-1">${currentPage-1}</a>
								</li>
							</c:if>
							<!-- current page -->
								<li class="page-item active">
									<a class="page-link" href="#">${currentPage}<span class="sr-only">(current)</span></a>
								</li>
							
							<c:if test="${currentPage != totalPage && currentPage != ''}">
								<li class="page-item">
									<a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage+1}">${currentPage+1}</a>
								</li>
							</c:if>
							<c:if test="${currentPage != totalPage && currentPage != ''}">
								<li class="page-item">
									<a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${totalPage}">最末頁</a>
								</li>
							</c:if>
							
							<c:if test="${currentPage == totalPage && currentPage != ''}">
								<li class="page-item disabled">
									<a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage+1}">最末頁</a>
								</li>
							</c:if>
						</c:if>


						<c:if test="${currentKPage != null}">
							<c:if test="${currentKPage == 1}">
								<li class="page-item disabled"><a class="page-link"
									href="<%=application.getContextPath()%>/key?currentKPage=${currentKPage-1}"
									tabindex="-1">第一頁</a></li>
							</c:if>
							<c:if test="${currentKPage > 1}">
								<li class="page-item"><a class="page-link"
									href="<%=application.getContextPath()%>/key?currentKPage=1&keyword=${keyword}&orderFiled=${orderFiled}"
									tabindex="-1">第一頁</a></li>
							</c:if>
							<c:if test="${currentKPage > 1}">
								<li class="page-item"><a class="page-link"
									href="<%=application.getContextPath()%>/key?currentKPage=${currentKPage-1}&keyword=${keyword}&orderFiled=${orderFiled}"
									tabindex="-1">${currentKPage-1}</a></li>
							</c:if>
							<li class="page-item active"><a class="page-link" href="#">${currentKPage}
									<span class="sr-only">(current)</span>
							</a></li>
							<c:if test="${currentKPage != totalKPage}">
								<li class="page-item"><a class="page-link"
									href="<%=application.getContextPath()%>/key?currentKPage=${totalKPage}&keyword=${keyword}&orderFiled=${orderFiled}">${currentKPage+1}</a></li>
							</c:if>
							<c:if test="${currentKPage != totalKPage}">
								<li class="page-item"><a class="page-link"
									href="<%=application.getContextPath()%>/key?currentKPage=${currentKPage+1}&keyword=${keyword}&orderFiled=${orderFiled}">最末頁</a></li>
							</c:if>
							<c:if test="${currentKPage == totalKPage}">
								<li class="page-item disabled"><a class="page-link"
									href="<%=application.getContextPath()%>/keywords?currenKPage=${currentKPage+1}">最末夜</a></li>
							</c:if>
						</c:if>


					</ul>
				</nav>
			</div>



		</div>
	</div>


</body>
</html>
