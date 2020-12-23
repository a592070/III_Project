<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>FUN x TAIWAN</title>
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

		.div_flex {
			display: flex;
			align-items: center;
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
					<div class="box" style="border:0px">
						<div style="border-width: 0px">
							<button type="submit" class="btn btn-primary"
								onclick="location.href='${pageContext.servletContext.contextPath}/admin/accountPage'">回用戶列表</button>
							<button type="button" class="btn btn-light" id="insertData">輸入資料</button>
						</div>
						<div class="box">
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

								<div class="middle form-group">
									<div class="div_flex">
										<h4 class="account_result">帳號</h4><img class="img" id="aimg" src=""
											style="width: 13px"><span id="asp"></span>
									</div>
									<input class="form-control" type="text" id="username" name="username"
										placeholder="請輸入帳號" style='width: 300px'>
								</div>
								<div class="middle form-group">
									<div class="div_flex">
										<h4 class="account_result">密碼</h4><img class="img" id="pimg" src=""
											style="width: 13px"><span id="psp"></span>
									</div>
									<input class="form-control" type="password" id="password" name="password"
										placeholder="請輸入密碼" style='width: 300px'>
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
									<div class="div_flex">
										<h4 class="account_result">Email</h4><img class="img" id="eimg" src=""
											style="width: 13px"><span id="esp"></span>
									</div>
									<input class="form-control" type="text" id="email" name="email" style='width:300px'
										placeholder="請輸入email" />
								</div>
								<div class="middle form-group">
									<h4 class="account_result">暱稱</h4>
									<input class="form-control" type="text" id="nickName" name="nickName"
										style='width: 300px' placeholder="請輸入暱稱" />
								</div>
								<!-- <div class="middle">
									<h4 class="account_result">註冊日期</h4>
									<p class="p_result" id="rData">${userDetail.registerString}</p>
								</div>
								<div class="middle">
									<h4 class="account_result">最後修改日期</h4>
									<p class="p_result" id="mData">${userDetail.modify_DateString}</p>
								</div> -->
								<div class="middle form-group">
									<h4 class="account_result">狀態</h4>
									<label class="switch switch-text switch-success switch-pill form-control-label">
										<input type="checkbox" class="switch-input form-check-input" id="checkbox"
											value="啟用" checked="checked" name="status">
										<span class="switch-label" data-on="啟用" data-off="禁用"></span>
										<span class="switch-handle"></span>
									</label>
								</div>
								<div class="middle">
									<button type="submit" class="btn btn-primary" id="submit" disabled>新增</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var f1 = false;
		var f2 = false;
		var f3 = false;
		$("#checkbox").click(function () {
			var status = $(this).val()
			if (status == "啟用") {
				$(this).val("禁用");
			} else if (status == "禁用") {
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
		$("#delImg").click(function(){
			$("#userPic").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png")
		})
		//帳號check
		$("#email,#password,#username").on("keyup change blur", function () {
			var status;
			$("#aimg").attr("src", "");
			$("#asp").text("");
			var username = $("#username").val();
			if (username == "") {
				$("#aimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
				$("#asp").text("帳號不能為空");
				$("#asp").css({ "color": "red", "fontSize": "13px", "fontStyle": "italic" });
				$("#submit").attr("disabled", true)
				return;
			}
			$.ajax(
				{
					type: 'POST',
					data: { "userName": username },
					url: '${pageContext.servletContext.contextPath}/admin/checkUser',
					dataType: 'json',
					success: function (response) {
						checkusr(response);

					}
				}
			)
		})
		function checkusr(response) {
			if (response) {
				console.log(response);
				$("#aimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
				$("#asp").text("帳號重複");
				$("#asp").css({ "color": "red", "fontSize": "13px", "fontStyle": "italic" });
				$("#submit").attr("disabled", true)
			} else {
				$("#aimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
				$("#asp").text("帳號可以使用");
				$("#asp").css({ "color": "black", "fontSize": "13px", "fontStyle": "italic" });
				// $("#submit").attr("disabled", false)
				f1 = true;
				if (f1 && f2 && f3) {
					$("#submit").attr("disabled", false);
				}
			}
		}
		$("#email,#password,#username").on("keyup change blur", function () {
			var password = $("#password").val();
			if (password == "") {
				$("#pimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
				$("#psp").text("密碼不能為空");
				$("#psp").css({ "color": "red", "fontSize": "13px", "fontStyle": "italic" });
				$("#submit").attr("disabled", true)
				return;
			}
			$("#pimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
			$("#psp").text("密碼可以使用");
			$("#psp").css({ "color": "black", "fontSize": "13px", "fontStyle": "italic" });
			// $("#submit").attr("disabled", false)
			f2 = true;
			if (f1 && f2 && f3) {
				$("#submit").attr("disabled", false);
			}
		})
		$("#email,#password,#username").on("keyup change blur", function () {
			var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var email = $('#email').val();
			if (email == "") {
				$("#eimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
				$("#esp").text("email不能為空");
				$("#esp").css({ "color": "red", "fontSize": "13px", "fontStyle": "italic" });
				$("#submit").attr("disabled", true);
			} else if (!regex.test(email)) {
				$("#eimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
				$("#esp").text("email格式不正確");
				$("#esp").css({ "color": "red", "fontSize": "13px", "fontStyle": "italic" });
				$("#submit").attr("disabled", true);
			} else {
				$("#eimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
				$("#esp").text("email格式正確");
				$("#esp").css({ "color": "black", "fontSize": "13px", "fontStyle": "italic" });
				// $("#submit").attr("disabled", false);
				f3 = true;
				if (f1 && f2 && f3) {
					$("#submit").attr("disabled", false);
				}
			}
		})
		$("#insertData").click(function(){
			console.log("輸入資料")
			$("#username").val("iiiEEIT124")
			$("#password").val("iiiEEIT124")
			$("#identity").val("2")
			$("#email").val("iiiteam124@gmail.com")
			$('#nickName').val("測試帳號")
			$("#email,#password,#username").blur()
		})
	</script>
</body>

</html>