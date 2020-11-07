<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用戶清單</title>
<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
</head>
<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
			<div>
				<h2>用戶清單</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>帳號</th>
								<th>身分</th>
								<th>email</th>
								<th>註冊日期</th>
								<th>修改日期</th>
								<th>狀態</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="a" items="${userList}">
								<tr>
									<td>${a.userName}</td>
									<td>${a.identityBean.name}</td>
									<td>${a.email}</td>
									<td>${a.registerString}</td>
									<td>${a.modify_DateString}</td>
									<td>${a.status}</td>
									<td>
									<form action="<%=application.getContextPath()%>/displayAccount" method="POST">
									<button type="submit" class="btn btn-warning">Modify</button>
									<Input type='hidden' name='username' value='${a.userName}'>
									</form>
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
</body>
</html>