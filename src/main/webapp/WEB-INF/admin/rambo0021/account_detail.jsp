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
.title {
	text-align: center;
	background-color: #003060;
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
</style>
</head>
<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="container">
					<div>
						<h2 class="title">${userDetail.userName}</h2>
						<div class="top"></div>
						<form action="" method="POST" enctype="multipart/form-data">
							<p class="modify-img">
								<button type="button" name="udpwd" class="btn btn-light">修改密碼</button>
								<input type="file" id="Apicture" name="Apicture" accept="image/*" style="display: none">
								<button type="button" onclick="Apicture.click()" onchange="picsumit.click()">上傳圖片</button>
								<button type="submit" id="picsumit" name="picsumit" class="btn btn-light" style="display: none"></button>
								<button type="button" name="rmimg" class="btn btn-light">改為預設圖片</button>
							</p>
							<div class="div_img">
<%-- 								<img src="<%=application.getContextPath()%>/ShowAccountPic"> --%>
								<img src= ${picture } >
							</div>
						</form>
						<div>
							<p></p>
						</div>
						<div>
							<h4>身分</h4>
							<p>${userDetail.identityBean.name}</p>
						</div>
						<div>
							<h4>Email</h4>
							<p>${userDetail.email}</p>
						</div>
						<div>
							<h4>暱稱</h4>
							<p>${userDetail.nickName}</p>
						</div>
						<div>
							<h4>註冊日期</h4>
							<p>${userDetail.registerString}</p>
						</div>
						<div>
							<h4>修改日期</h4>
							<p>${userDetail.modify_DateString}</p>
						</div>
						<div>
							<h4>狀態</h4>
							<p>${userDetail.status}</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>