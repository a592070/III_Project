<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 250px;
}

.rid {
	width: 100px;
}
</style>
</head>
<body>
<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
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
											<th>大訂單號</th>
											<th>餐廳訂單號</th>
											<th class="rname">餐廳名稱</th>
											<th class="d-none d-md-table-cell">訂位人數</th>
											<th class="d-none d-md-table-cell">訂位時間</th>
											<th>狀態</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="r" items="${Rlist}">
											<tr>
												<td class="rid">${r.id}</td>
												<td class="rid">${r.order_id}</td>
												<td class="rname">${r.name}</td>
												<td>${r.customer_num}</td>
												<td>${r.bookt_time}</td>
												<td><span class="badge badge-success">Completed</span></td>
												<td>
												<form action="<%=application.getContextPath()%>/ROrderModify" method="POST">
												<button type="submit" class="btn btn-warning">修改</button>
												<Input type='hidden' name='rid' value='${r.id}'>
												</form>
												</td>
												<td><button type="submit" class="btn btn-danger">刪除</button></td>

											</tr>

											<!-- <td><span class="badge badge-warning">Delayed</span></td> -->

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
						<c:if test="${currentPage != null}">
							<c:if test="${currentPage == 1}">
								<li class="page-item disabled"><a class="page-link"
									href="<%=application.getContextPath()%>/RestaurantList?currentPage=${currentPage-1}"
									tabindex="-1">Previous</a></li>
							</c:if>
							<c:if test="${currentPage > 1}">
								<li class="page-item"><a class="page-link"
									href="<%=application.getContextPath()%>/RestaurantList?currentPage=${currentPage-1}"
									tabindex="-1">Previous</a></li>
							</c:if>
							<li class="page-item active"><a class="page-link" href="#">${currentPage}
									<span class="sr-only">(current)</span>
							</a></li>
							<c:if test="${currentPage != totalPage && currentPage != ''}">
								<li class="page-item"><a class="page-link"
									href="<%=application.getContextPath()%>/RestaurantList?currentPage=${currentPage+1}">Next</a></li>
							</c:if>
							<c:if test="${currentPage == totalPage && currentPage != ''}">
								<li class="page-item disabled"><a class="page-link"
									href="<%=application.getContextPath()%>/RestaurantList?currentPage=${currentPage+1}">Next</a></li>
							</c:if>
						</c:if>

					</ul>
				</nav>
			</div>


		</div>
	</div>



</body>
</html>