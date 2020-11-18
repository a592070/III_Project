<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<title>論壇管理</title>

	<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
	<style>
		.sp_search-1 {
			float: left;
		}

		.box {
			display: flex;
		}

		.search {
			padding-right: 30px;
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
	</style>

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">


	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">


				<div class="d-flex justify-content-between">
					<form action="${pageContext.servletContext.contextPath}/articleSearch" method="GET"
						class="form-inline">
						<input type="text" class="form-control" placeholder="輸入文章標題或作者..." aria-label="search"
							name="keyword">
						<input type="hidden" value="${articleType }" name="articleType">
						<button>
							<span class="input-group-text bg-primary text-white"> 搜尋 </span>
						</button>
					</form>
					<form method="GET" class="mr-5">

						<select name="articleType" id="typeSelect" class="form-control">
							<option value="">選擇類型</option>
							<option value="1">旅遊</option>
							<option value="2">住宿</option>
							<option value="3">美食</option>
							<option value="4">景點</option>
							<option value="5">交通</option>
							<option value="6">行程</option>
							<option value="7">購物</option>
							<option value="0">其他</option>

						</select>
					</form>
				</div>


				<!-- </div> -->
				<h2>文章列表</h2>
				<span>
					<a href="${pageContext.servletContext.contextPath}/Forum">回列表</a>
				</span>
				<div class="box">

					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th><span class="mdi mdi-key"></span> ID</th>
									<th width="40%"><span class="mdi mdi-tag-text-outline"></span> 標題</th>
									<th><span class="mdi mdi-calendar-clock"></span> 建立時間</th>
									<th><span class="mdi mdi-account-edit"></span> 作者</th>
									<th><span class="mdi mdi-directions-fork"></span> 類型</th>
									<th><span class="mdi mdi-information-outline"></span>狀態</th>
									<th><span class="mdi mdi-settings"></span>設定</th>


								</tr>
							</thead>
							<tbody>




							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>

	<script>
		//文章列表
		$(document).ready(function () {
			$.ajax({
				type: "GET",
				url: "Article.controller.json",
				success: function (response) {
					$.each(response, function (index, element) {
						var currStatus = element.artStatus;

						$('tbody').append(
							'<tr>' +
							'<td>' + element.artId + '</td>' +
							'<td>' + "<a class='text-dark' href=''>" + element.artTitle + '</a></td>' +
							'<td>' + element.artCreTime + '</td>' +
							'<td>' + "<a class='text-dark' href=''>" + element.artUserId + '</a></td>' +
							'<td>' + element.articleType.typeName + '</td>' +
							"<td><label class='switch switch-success switch-pill switch-text form-control-label'>" +
							"<input type='checkbox' class='switch-input form-check-input' name='status' id='status' value='" +
							element.artStatus + "'" +
							(currStatus == 'enabled' ? 'checked' : '') +
							">" +
							"<span class='switch-label' data-on='on' data-off='off'></span>" +
							"<span class='switch-handle'></span>" +
							"</label></td>" +
							"<td>" +
							"<button name='artId' value='" + element.artId + "'>" +
							"<span class='mdi mdi-pencil-box-outline'></span>Edit</button>" +
							"<button name='artId' value='" + element.artId + "' onclick='confirmDelete()'>" +
							"<span class='mdi mdi-delete'></span>Delete</button>" +
							"</td>" +
							'</tr>'
						);
					});

				}

			});

		});

		// 類別搜尋文章
		$("#typeSelect").change(function () {
			var selected = $('#typeSelect :selected').val();
			$.ajax({
				type: "GET",
				url: "artTypeSearch.json",
				data: { "articleType": selected },
				success: function (response) {
					console.log(response);
					$('tbody').empty();
					$.each(response, function (index, element) {
						var currStatus = element.artStatus;

						$('tbody').append(
							'<tr>' +
							'<td>' + element.artId + '</td>' +
							'<td>' + "<a class='text-dark' href=''>" + element.artTitle + '</a></td>' +
							'<td>' + element.artCreTime + '</td>' +
							'<td>' + "<a class='text-dark' href=''>" + element.artUserId + '</a></td>' +
							'<td>' + element.articleType.typeName + '</td>' +
							"<td><label class='switch switch-success switch-pill switch-text form-control-label'>" +
							"<input type='checkbox' class='switch-input form-check-input' name='status' id='status' value='" +
							element.artStatus + "'" +
							(currStatus == 'enabled' ? 'checked' : '') +
							">" +
							"<span class='switch-label' data-on='on' data-off='off'></span>" +
							"<span class='switch-handle'></span>" +
							"</label></td>" +
							"<td>" +
							"<button name='artId' value='" + element.artId + "'>" +
							"<span class='mdi mdi-pencil-box-outline'></span>Edit</button>" +
							"<button name='artId' value='" + element.artId + "' onclick='confirmDelete()'>" +
							"<span class='mdi mdi-delete'></span>Delete</button>" +
							"</td>" +
							'</tr>'
						);
					});
				}
			});
		});
	</script>
	<script>
		function confirmDelete() {
			var desicion = confirm("確定要刪除此筆資料?");
			if (desicion) {
				$.ajax({
					type: "POST",
					url: "delete.controller",
					data: { "artId": 123 },
				})

			} else {
				return;
			}
		}
	</script>
</body>

</html>