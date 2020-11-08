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
			border: 1px solid gray;
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
					<div class="box">
						<div>
							<h2 class="title" id="username">${userDetail.userName}</h2>
							<div class="top"></div>
							<form action="<%=application.getContextPath()%>/udAccountImg" method="POST"
								enctype="multipart/form-data">
								<p class="modify-img">
									<button type="button" class="btn btn-warning" data-toggle="modal"
										data-target="#changePwd">修改密碼</button>
									<input type="file" id="Apicture" name="Apicture" accept="image/*"
										style="display: none" onchange="picsumit.click()">
									<button type="button" onclick="Apicture.click()" class="btn btn-light">上傳圖片</button>
									<button type="submit" id="picsumit" name="picsumit" class="btn btn-light"
										style="display: none"></button>
									<button type="button" name="delImg" class="btn btn-light">改為預設圖片</button>
								</p>
							</form>
							<div class="div_img">
								<c:if test="${!empty userDetail.picture}">
									<img class="img-circle" src="<%=application.getContextPath()%>/ShowAccountPic">
								</c:if>
								<c:if test="${empty userDetail.picture}">
									<img src="<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png">
								</c:if>
							</div>

							<div class="middle">
								<h4 class="account_result">身分</h4>
								<p class="p_result" id="idData">${userDetail.identityBean.name}</p>
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#changeIdentity">修改身分</button>
							</div>
							<div class="middle">
								<h4 class="account_result">Email</h4>
								<p class="p_result" id="emailData">${userDetail.email}</p>
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#changeEmail">修改email</button>
							</div>
							<div class="middle">
								<h4 class="account_result">暱稱</h4>
								<p class="p_result" id="nData">${userDetail.nickName}</p>
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#changeNickname">修改email</button>
							</div>
							<div class="middle">
								<h4 class="account_result">註冊日期</h4>
								<p class="p_result">${userDetail.registerString}</p>
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#changeRegister">修改註冊日期</button>
							</div>
							<div class="middle">
								<h4 class="account_result">修改日期</h4>
								<p class="p_result">${userDetail.modify_DateString}</p>
								<button type="button" class="btn btn-warning" data-toggle="modal"
									data-target="#changeRegister">修改日期</button>
							</div>
							<div class="middle">
								<h4 class="account_result">狀態</h4>
								<p class="p_result">${userDetail.status}</p>
								<button type="button" name="sEnable" class="btn btn-success">帳號啟用</button>
								<button type="button" name="sDisable" class="btn btn-danger">帳號禁用</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	ModalPwd  -->
	<div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="pwdModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="pwdModalLabel">修改密碼</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="pClose"
						name="pClose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="password">密碼:</label>
					<input type="password" id="password" name="password" placeholder="請輸入密碼">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="pwdsubmit">儲存</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	ModalIdentity -->
	<div class="modal fade" id="changeIdentity" tabindex="-1" aria-labelledby="identityModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="identityModalLabel">修改身分</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="iClose"
						name="iClose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group" width="300px">
						<select class="form-control" name="identity" id="identity">
							<option value="1">管理員</option>
							<option value="2">一般會員</option>
							<option value="3">餐廳業者</option>
							<option value="4">住宿業者</option>
							<option value="5">交通業者</option>
						</select>
					</div>
					</select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="idtysubmit">儲存</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	ModalEmail -->
	<div class="modal fade" id="changeEmail" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="emailModalLabel">修改Email</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="eClose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" id="email" name="email" placeholder="請輸入Email">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="emailsubmit">儲存</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	ModalNickname-->
	<div class="modal fade" id="changeNickname" tabindex="-1" aria-labelledby="nNameModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="nNameModalLabel">修改暱稱</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="nClose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input type="text" id="nickName" name="nickName" placeholder="請輸入暱稱">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="nNamesubmit">儲存</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	ModalRegister-->
	<div class="modal fade" id="changeRegister" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="registerModalLabel">修改註冊日期</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="rClose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- datetimepicker -->
					<div class="container">
						<div class="row">
						   <div class='col-sm-6'>
							  <div class="form-group">
								 <div class='input-group date' id='datetimepicker1'>
									<input type='text' class="form-control" />
									<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
									</span>
								 </div>
							  </div>
						   </div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="rsubmit">儲存</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		var username = $("#username").text()
		//passwordAjax
		$('#pwdsubmit').click(function () {
			var pwd = $('#password').val()
			$.ajax(
				{
					type: 'POST',
					data: { "password": pwd, "username": username },
					url: '${pageContext.servletContext.contextPath}/udAccountPwd',
					dataType: 'text',
					success: function (response) {
						alert(response)
						$("#pClose").trigger('click');
					}

				}
			)
		})
		//identityAjax
		$('#idtysubmit').click(function () {
			var identity = $("#identity").val()
			var idStr = $("#identity :selected").text();
			console.log("身分" + identity)
			$.ajax(
				{
					type: 'POST',
					data: { "username": username, "identity": identity },
					url: '${pageContext.servletContext.contextPath}/udAccountIdentity',
					dataType: 'text',
					success: function (response) {
						alert(response)
						$("#iClose").trigger('click');
						$("#idData").text(idStr);
					}

				}
			)
		})
		//emailAjax
		$('#emailsubmit').click(function () {
			var email = $('#email').val()
			$.ajax(
				{
					type: 'POST',
					data: { "username": username, "email": email },
					url: '${pageContext.servletContext.contextPath}/udAccountEmail',
					dataType: 'text',
					success: function (response) {
						alert(response)
						$("#eClose").trigger('click');
						$("#emailData").text(email);
					}

				}
			)
		})
		//nicknameAjax
		$('#emailsubmit').click(function () {
			var nickname = $('#nickName').val()
			console.log(nickname)
			$.ajax(
				{
					type: 'POST',
					data: { "username": username, "nickname": nickname },
					url: '${pageContext.servletContext.contextPath}/udAccountNickname',
					dataType: 'text',
					success: function (response) {
						alert(response)
						$("#nClose").trigger('click')
						$("#nData").text(nickname)
					}

				}
			)
		})
		//registerAjax
		$('#rsubmit').click(function () {
			var register =  $('#datetimepicker1').datetimepicker()
			console.log(register)
			// $.ajax(
			// 	{
			// 		type: 'POST',
			// 		data: { "username": username, "nickname": nickname },
			// 		url: '${pageContext.servletContext.contextPath}/udAccountRegister',
			// 		dataType: 'text',
			// 		success: function (response) {
			// 			alert(response)
			// 			$("#nClose").trigger('click')
			// 			$("#nData").text(nickname)
			// 		}

			// 	}
			// )
		})
	</script>
</body>

</html>