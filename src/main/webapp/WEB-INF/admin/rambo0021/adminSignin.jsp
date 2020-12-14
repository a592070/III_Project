<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>後臺系統登入</title>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<c:import url="/WEB-INF/admin/fragment/ref.jsp" />


<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />
<link
	href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link href="assets/plugins/toaster/toastr.min.css" rel="stylesheet" />
<link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet" />
<link href="assets/plugins/flag-icons/css/flag-icon.min.css"
	rel="stylesheet" />
<link href="assets/plugins/jvectormap/jquery-jvectormap-2.0.3.css"
	rel="stylesheet" />
<link href="assets/plugins/ladda/ladda.min.css" rel="stylesheet" />
<link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" />
<link href="assets/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet" />

<!-- SLEEK CSS -->
<link id="sleek-css" rel="stylesheet" href="assets/css/sleek.css" />



<!-- FAVICON -->
<link href="assets/img/favicon.png" rel="shortcut icon" />

<!--
          HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
        -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<script src="assets/plugins/nprogress/nprogress.js"></script>
</head>

</head>

<body class="bg-light-gray" id="body">
	<div
		class="container d-flex flex-column justify-content-between vh-100">
		<div class="row justify-content-center mt-5">
			<div class="col-xl-5 col-lg-6 col-md-10">
				<div class="card">
					<div class="card-header bg-primary">
						<div class="app-brand">
							<a href="/index.html"> <svg class="brand-icon"
									xmlns="http://www.w3.org/2000/svg"
									preserveAspectRatio="xMidYMid" width="30" height="33"
									viewBox="0 0 30 33">
									<g fill="none" fill-rule="evenodd">
										<path class="logo-fill-blue" fill="#7DBCFF"
										d="M0 4v25l8 4V0zM22 4v25l8 4V0z" />
										<path class="logo-fill-white" fill="#FFF" d="M11 4v25l8 4V0z" />
									</g>
								</svg> <span class="brand-name">FUN Taiwan</span>
							</a>
						</div>
					</div>
					<div class="card-body p-5">

						<h4 class="text-dark mb-5">管理後臺登入</h4>
						<form action="${pageContext.servletContext.contextPath}/admin/login" method="POST">
							<div class="row">
								<div class="form-group col-md-12 mb-4">
									<input type="text" class="form-control input-lg" name="username" id="username"
										aria-describedby="nameHelp" placeholder="使用者名稱">
								</div>
								<div class="form-group col-md-12 ">
									<input type="password" class="form-control input-lg"
										name="password" id="password" placeholder="密碼">
								</div>
								<div class="col-md-12">
									<div class="d-flex my-2 justify-content-between">
										<!-- <div class="d-inline-block mr-3">
											<label class="control control-checkbox">Remember me <input
												type="checkbox" />
												<div class="control-indicator"></div>
											</label>

										</div> -->
										<!--<p>
											<a class="text-blue" href="#">忘記密碼?</a>
										</p>-->
									</div>
									<div class="g-recaptcha" data-sitekey="6LdOeNYZAAAAAPAEKRkJYgqKjU79n5B90Jnw2Q06"></div>
									<button type="submit" class="btn btn-lg btn-primary btn-block mb-4">登入</button>
									<button type="button" class="btn btn-light" id="fastsignin">帶入資料</button>
<!-- 									<p> -->
<!-- 										還沒有帳號 ? <a class="text-blue" -->
<%-- 											href="${pageContext.servletContext.contextPath}/admin/signup">註冊</a> --%>
<!-- 									</p> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="loginModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle" style="color: black;">登入信息</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body" style="color:red; text-align: center;">
					<h3>${ErrorMsgKey.LoginError}</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">確認</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	<c:if test="${!empty ErrorMsgKey.LoginError}">
      $("#loginModalCenter").modal('show');
	</c:if>
	
	
	$("#fastsignin").click(function(){
	  $("#username").val("system");
	  $("#password").val("system");
	})
	</script>
</body>

</html>