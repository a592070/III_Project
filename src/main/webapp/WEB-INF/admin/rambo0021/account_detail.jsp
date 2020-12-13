<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>用戶明細</title>
	<c:import url="/WEB-INF/admin/fragment/ref.jsp" />

	<style>
		* {
			padding: 0;
			margin: 0;
		}

		.title {
			text-align: center;
			background-color: #003060;
		}

		h2 {
			padding: 20px;
			border-bottom: 1px solid gray;
			color: white;
		}

		.top {
			display: flex;
		}

		.div_img {
			width: 800px;
			height: 530px;
			margin: auto;
			overflow: hidden;
			display: flex;
			padding-bottom: 5px;
		}

		.modify-img {
			padding: 5px;
			margin-right: 10px;
			text-align: right;
		}

		.modify {
			padding: 5px;
			margin-right: 10px;
			text-align: right;
			float: right;
		}

		img {
			width: 100%;
		}

		.account_result {
			padding: 10px 30px;
		}

		.p_result {
			padding: 10px 30px;
			color: black;
		}

		.box {
			width: 900px;
			margin: 50px auto;
			border: 1px solid gray;
		}

		.middle {
			border-top: 1px solid gray;
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
				<div class="container">
					<div class="box" style="border:0px" >
						<div style="border-width:0px">
							<button type="submit" class="btn btn-primary"
								onclick="location.href='${pageContext.servletContext.contextPath}/admin/accountPage'">回用戶列表</button>
						</div>
						<div class="box">
							<h2 class="title" id="username">${userDetail.userName}</h2>
							<div class="top">
								<form method="POST" enctype="multipart/form-data">
									<p class="modify-img">
										<input type="file" id="Apicture" name="Apicture" accept="image/*"
											style="display: none">
										<button type="button" onclick="Apicture.click()"
											class="btn btn-light">上傳圖片</button>
										<button type="button" id="delImg" class="btn btn-light">改為預設圖片</button>
									</p>
								</form>
							</div>
							<div class="div_img">
								<c:if test="${!empty userDetail.picture}">
									<img class="img-circle" id="userPic"
										src="<%=application.getContextPath()%>/admin/ShowAccountPic">
								</c:if>
								<c:if test="${empty userDetail.picture}">
									<img class="img-circle" id="userPic"
										src="<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png">
								</c:if>
							</div>
							<form method="POST" id="aForm">
								<div class="middle form-group">
									<h4 class="account_result">密碼</h4>
									<input class="form-control" type="password" id="password" name="password"
										placeholder="請輸入密碼" value="${userDetail.password}" style='width: 300px'>
								</div>
								<div class="middle form-group">
									<h4 class="account_result">身分</h4>
									<div class="input-group mb-3" style='width: 300px'>
										<select class="custom-select" name="identity" id="identity">
											<c:forEach var="i" items="${idList}">
												<option value="${i.id}" id="${i.id}">${i.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="middle form-group">
									<h4 class="account_result">Email</h4>
									<input class="form-control" type="text" id="email" name="email" style='width: 300px'
										value="${userDetail.email}" />
								</div>
								<div class="middle form-group">
									<h4 class="account_result">暱稱</h4>
									<input class="form-control" type="text" id="nickName" name="nickName"
										style='width: 300px' value="${userDetail.nickName}" />
								</div>
								<div class="middle form-group">
									<h4 class="account_result">註冊日期</h4>
									<p class="p_result" id="rData">${userDetail.registerString}</p>
								</div>
								<div class="middle form-group">
									<h4 class="account_result">最後修改日期</h4>
									<p class="p_result" id="mData">${userDetail.modify_DateString}</p>
								</div>
								<div class="middle">
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary" data-toggle="modal"
										data-target="#updateModalCenter">
										確定</button>
									<button type="button" id="cancel" class="btn btn-danger">取消</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="updateModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle" style="color: black;">修改帳號</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body" style="color: black; text-align: center;">是否確定要修改
					${userDetail.userName} 帳號資料?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="sumit">確認</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="mCancel">取消</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function () {
			$("#identity").val('${userDetail.identityBean.id}')
		})
		var username = $("#username").text()
		//accountAjax
		$("#sumit").click(function () {
			var password = $('#password').val()
			var identity = $("#identity").val()
			var email = $('#email').val()
			var nickname = $('#nickName').val()
			console.log("修改資料")
			$.ajax(
				{
					type: 'POST',
					data: { "username": username, "password": password, "identity": identity, "email": email, "nickName": nickname },
					url: '${pageContext.servletContext.contextPath}/admin/modifyAccount',
					dataType: 'text',
					success: function (response) {
						$("#close").click();
						$("#mData").text(formatDate());
					}

				}
			)
		})
		//delImgAjax
		$("#delImg").click(function () {
			console.log("設定預設圖片")
			$.ajax(
				{
					type: 'POST',
					data: { "username": username },
					url: '${pageContext.servletContext.contextPath}/admin/delAccountPic',
					dataType: 'text',
					success: function (response) {
						alert("修改成功")
						$("#userPic").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png")
						$("#mData").text(formatDate());
					}

				}
			)
		})
		//udimgAjax
		$("#Apicture").change(function () {
			readURL(this);
			var form1 = $(this).parents('form');
			var formData = new FormData(form1[0]);
			formData.append('username', username)
			console.log("換圖片")
			$.ajax({

				type: "POST",
				url: "${pageContext.servletContext.contextPath}/admin/udAccountImg",
				data: formData,
				processData: false,
				contentType: false,
				dataType: "text",

				success: (response) => {
					alert("修改成功");
					$("#mData").text(formatDate());
				},

				error: function (xhr, ajaxOptions, thrownError) {
					console.log("我壞了")
					console.log(xhr.status + "\n" + thrownError);
				}

			});

		})


		function readURL(input) {

			if (input.files && input.files[0]) {
				console.log("我會幫你換圖片")
				var reader = new FileReader();

				reader.onload = function (e) {

					$("#userPic").attr('src', e.target.result);

				}

				reader.readAsDataURL(input.files[0]);

			}

		}
		//取消修改
		$("#cancel,#mCancel").click(function () {
			console.log("取消")
			var pwd = '${userDetail.password}'
			var id = '${userDetail.identityBean.id}'
			var email = '${userDetail.email}'
			var nickname = '${userDetail.nickName}'
			$("#password").val(pwd)
			$("#identity").val(id)
			$("#email").val(email)
			$("#nickName").val(nickname)

		})
		//日期->字串
		function formatDate() {
			var d = new Date(),
				month = '' + (d.getMonth() + 1),
				day = '' + d.getDate(),
				year = d.getFullYear(),
				hours = ''+d.getHours(),
				minutes = ''+d.getMinutes(),
				seconds = ''+d.getSeconds();

			if (month.length < 2)
				month = '0' + month;
			if (day.length < 2)
				day = '0' + day;
			if (hours.length < 2)
				hours = '0' + hours;
			if (minutes.length < 2)
				minutes = '0' + minutes;
			if (seconds.length < 2)
				seconds = '0' + seconds;

			return [year, month, day].join('-') + " " + [hours, minutes, seconds].join(':');
		}
	</script>
</body>

</html>