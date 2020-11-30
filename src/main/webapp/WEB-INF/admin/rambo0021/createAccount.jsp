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
						<div style="border-width: 0px">
							<button type="submit" class="btn btn-primary"
								onclick="location.href='${pageContext.servletContext.contextPath}/admin/accountPage'">回用戶列表</button>
						</div>
						<div>
							<form method="POST" id="aForm" enctype="multipart/form-data"
								action="<%=application.getContextPath()%>/admin/createAccount">
								<h2 class="title">新增帳號</h2>
								<div class="top">
									<p class="modify-img">
										<input type="file" id="Apicture" name="Apicture" accept="image/*"
											style="display: none">
										<button type="button" onclick="Apicture.click()"
											class="btn btn-light">上傳圖片</button>
										<button type="button" id="delImg" class="btn btn-light">改為預設圖片</button>
									</p>
								</div>
								<div class="div_img">
									<img class="img-circle" id="userPic"
										src="<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png">
								</div>

								<div class="middle">
									<h4 class="account_result">帳號</h4>
									<input type="text" id="username" name="username" placeholder="請輸入帳號">
								</div>
								<div class="middle">
									<h4 class="account_result">密碼</h4>
									<input type="password" id="password" name="password" placeholder="請輸入密碼">
								</div>
								<div class="middle">
									<h4 class="account_result">身分</h4>
									<div class="input-group mb-3" style='width: 250px'>
										<select class="custom-select" name="identity" id="identity">
											<c:forEach var="i" items="${idList}">
												<option value="${i.id}" id="${i.id}">${i.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="middle">
									<h4 class="account_result">Email</h4>
									<input type="text" id="email" name="email" style='width: 200px'
										placeholder="請輸入email" />
								</div>
								<div class="middle">
									<h4 class="account_result">暱稱</h4>
									<input type="text" id="nickName" name="nickName" style='width: 100px'
										placeholder="請輸入暱稱" />
								</div>
								<!-- <div class="middle">
									<h4 class="account_result">註冊日期</h4>
									<p class="p_result" id="rData">${userDetail.registerString}</p>
								</div>
								<div class="middle">
									<h4 class="account_result">最後修改日期</h4>
									<p class="p_result" id="mData">${userDetail.modify_DateString}</p>
								</div> -->
								<div>
									<h4 class="account_result">狀態</h4>
									<label class="switch switch-text switch-success switch-pill form-control-label">
										<input type="checkbox" class="switch-input form-check-input" id="checkbox"
											value="啟用" checked="checked" name="status">
										<span class="switch-label" data-on="啟用" data-off="禁用"></span>
										<span class="switch-handle"></span>
									</label>
								</div>
								<div class="middle">
									<button type="submit" class="btn btn-primary">新增</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
        $("#checkbox").click(function(){
			var status = $(this).val()
			if (status == "啟用") {
			$(this).val("禁用");
			}else if(status == "禁用"){
			$(this).val("啟用")
			}
			console.log($("#checkbox").val())
		})

		$("#Apicture").change(function () {
			readURL(this);
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
	</script>
</body>

</html>