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

<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div>
					<h2>用戶清單</h2>
					<div class="table-responsive">
						<table class="table table-striped table-sm" id="table">
							<thead>
								<tr>
									<th>帳號</th>
									<th>身分</th>
									<th>email</th>
									<th>註冊日期</th>
									<th>修改日期</th>
									<th>狀態</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${userList}">
									<tr>
										<td id="username">${a.userName}</td>
										<td>${a.identityBean.name}</td>
										<td>${a.email}</td>
										<td>${a.registerString}</td>
										<td>${a.modify_DateString}</td>
										<td id="status">${a.status}</td>
										<td>
											<form action="<%=application.getContextPath()%>/admin/displayAccount"
												method="POST">
												<button type="button" id="sEnable" class="btn btn-success">帳號啟用</button>
												<button type="button" id="sDisable" class="btn btn-danger">帳號禁用</button>
												<button type="submit" class="btn btn-warning">修改</button>
												<button type="button" id="delAcc" class="btn btn-danger">刪除</button>
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
	<script>
		$(document).ready(function () {
			for (let i = 0; i < $("[id=status]").length; i++) {
			    if($("[id=status]").eq(i).text()=="啟用"){			    
					$("[id=status]").eq(i).next().children().children("#sEnable").hide()
				}else{
					$("[id=status]").eq(i).next().children().children("#sDisable").hide()
				}
			}
		}
		)
		//刪除帳號資料
		$("#table").on('click', '#delAcc', function () {

			if (confirm("確定要刪除此筆資料?")) {
				var username = $(this).closest('td').siblings("#username").text()
				$(this).closest('tr').remove();
				$.ajax(
					{
						type: 'POST',
						data: { "username": username },
						url: '${pageContext.servletContext.contextPath}/admin/delAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}

					}
				)
			}
		})
      //啟用
	  $("#table").on('click', '#sEnable', function () {
		if (confirm("確定要啟用此帳號?")){
			var username = $(this).closest('td').siblings("#username").text()
			var status="啟用"
			$(this).parent().parent().siblings("#status").text(status)
			$(this).hide()
			$(this).siblings("#sDisable").show()
			$.ajax(
					{
						type: 'POST',
						data: { "username": username ,"status":status},
						url: '${pageContext.servletContext.contextPath}/admin/enableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}

					}
				)
			}
	  })
	  //禁用
	  $("#table").on('click', '#sDisable', function () {
		if (confirm("確定要禁用此帳號?")){
			var username = $(this).closest('td').siblings("#username").text()
			var status="禁用"
			$(this).parent().parent().siblings("#status").text(status)
			$(this).hide()
			$(this).siblings("#sEnable").show()
			$.ajax(
					{
						type: 'POST',
						data: { "username": username ,"status":status},
						url: '${pageContext.servletContext.contextPath}/admin/disableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}
					}
				)
			}
	  })
	</script>
</body>

</html>