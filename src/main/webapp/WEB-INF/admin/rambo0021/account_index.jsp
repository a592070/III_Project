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
				<div class="mx-auto my-3" style="width: 1100px">
					<form class="form-inline" action="hotelselect" method="GET">
						<div class="form-group mb-2">
							<h5>帳號搜尋:</h5>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input type="text" class="form-control" id="namekeyword" name="namekeyword"
								placeholder="請輸入帳號">
						</div>
						<div class="form-group col-md-2">
							<div class="form-group mb-2">
								<h5>身分:</h5>
								<select id="idkeyword" class="form-control" name="idkeyword">
									<option value="">請選擇..</option>
									<option value="管理員">管理員</option>
									<option value="一般會員">一般會員</option>
									<option value="餐廳業者">餐廳業者</option>
									<option value="住宿業者">住宿業者</option>
									<option value="交通業者">交通業者</option>
								</select>
							</div>				
						</div>
						<div class="form-group mb-2">
							<h5>email搜尋:</h5>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input type="text" class="form-control" id="emailkeyword" name="emailkeyword"
								placeholder="請輸入email">
						</div>

						<button type="button" class="btn btn-primary mb-2" value="search" name="search"
							id="search">搜尋</button>
					</form>
				</div>
				<div>
					<h2>用戶列表</h2>
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
									<th>功能</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach var="a" items="${userList}">
									<tr>
										<td id="username">${a.userName}</td>
										<td>${a.identityBean.name}</td>
										<td>${a.email}</td>
										<td>${a.registerString}</td>
										<td>${a.modify_DateString}</td>
										<td id="status">
											<c:choose>
												<c:when test="${a.status == '啟用'}">
													<label
														class="switch switch-text switch-success switch-pill form-control-label">
														<input type="checkbox" class="switch-input form-check-input"
															id="checkbox" value="啟用" checked="checked">
														<span class="switch-label" data-on="啟用" data-off="禁用"></span>
														<span class="switch-handle"></span>
													</label>
												</c:when>
												<c:otherwise>
													<label
														class="switch switch-text switch-success switch-pill form-control-label">
														<input type="checkbox" class="switch-input form-check-input"
															id="checkbox" value="禁用">
														<span class="switch-label" data-on="啟用" data-off="禁用"></span>
														<span class="switch-handle"></span>
													</label>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<form action="<%=application.getContextPath()%>/admin/displayAccount"
												method="POST">
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
		// $(document).ready(function () {
		// 	for (let i = 0; i < $("[id=status]").length; i++) {
		// 		if ($("[id=status]").eq(i).text().substr(0, 2) == "啟用") {
		// 			$("[id=status]").eq(i).children("#sEnable").hide()
		// 		} else {
		// 			$("[id=status]").eq(i).children("#sDisable").hide()
		// 		}
		// 	}
		// }
		// )
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
		/*
		//啟用button
		$("#table").on('click', '#sEnable', function () {
			if (confirm("確定要啟用此帳號?")) {
				var username = $(this).closest('td').siblings("#username").text()
				var status = "啟用"
				$(this).parent().siblings("#status").text(status)
				$(this).hide()
				$(this).siblings("#sDisable").show()
				$.ajax(
					{
						type: 'POST',
						data: { "username": username, "status": status },
						url: '${pageContext.servletContext.contextPath}/admin/enableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}

					}
				)
			}
		})
		//禁用button
		$("#table").on('click', '#sDisable', function () {
			if (confirm("確定要禁用此帳號?")) {
				var username = $(this).closest('td').siblings("#username").text()
				var status = "禁用"
				$(this).parent().siblings("#status").text(status)
				$(this).hide()
				$(this).siblings("#sEnable").show()
				$.ajax(
					{
						type: 'POST',
						data: { "username": username, "status": status },
						url: '${pageContext.servletContext.contextPath}/admin/disableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}
					}
				)
			}
		})
		*/
		//啟用 禁用 checkbox
		$("#table").on('change', '#checkbox', function () {
			var status = $(this).val();
			if (status == "啟用") {
				console.log("禁用帳號")
				var username = $(this).closest('td').siblings("#username").text()
				var cgstatus = "禁用"
				$(this).val(cgstatus)
				$.ajax(
					{
						type: 'POST',
						data: { "username": username, "status": cgstatus },
						url: '${pageContext.servletContext.contextPath}/admin/disableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}
					}
				)

			} else {
				console.log("啟用帳號")
				var username = $(this).closest('td').siblings("#username").text()
				var cgstatus = "啟用"
				$(this).val(cgstatus)
				$.ajax(
					{
						type: 'POST',
						data: { "username": username, "status": cgstatus },
						url: '${pageContext.servletContext.contextPath}/admin/enableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}

					}
				)
			}
		})
		$("#search").click(function () {
			console.log("搜尋")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			$("#tbody").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity, "email" : email },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#tbody").append(response)

						}

					}
				)
		})

	</script>
</body>

</html>