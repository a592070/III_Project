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
	width: 120px;
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
												<td>
												<c:set var="booktime" value="${r.bookt_time}" />
												<c:set var="BT" value="${fn:substring(booktime, 0, 16)}" />
												${BT}
												</td>
												
												<c:if test="${r.bookt_time > ts}">
													<td><span class="badge badge-success">訂單待完成</span></td>
												</c:if>
												<c:if test="${r.bookt_time < ts}">
													<td><span class="badge badge-secondary">訂單已完成</span></td>
												</c:if>
												
												
												<td>
												<form action="<%=application.getContextPath()%>/ROrderModify" method="POST">
												<c:if test="${r.bookt_time > ts}">
													<button type="submit" class="btn btn-warning">修改</button>
													<Input type='hidden' name='rid' value='${r.id}'>
												</c:if>
												<c:if test="${r.bookt_time < ts}">
													<button type="submit" class="btn btn-warning"  disabled>修改</button>
												</c:if>
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