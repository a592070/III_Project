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

<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="container">
					<div class="box">
						<div>
							<button type="submit" class="btn btn-primary"
								onclick="location.href='${pageContext.servletContext.contextPath}/admin/accountPage'">回用戶列表</button>
							<h2 class="title" id="username">${userDetail.userName}</h2>
							<div class="top">
								<form method="POST" enctype="multipart/form-data">
									<p class="modify-img">
										<input type="file" id="Apicture" name="Apicture"
											accept="image/*" style="display: none">
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
									<img
										src="<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png">
								</c:if>
							</div>
							<form method="POST" id="aForm">
								<div class="middle">
									<h4 class="account_result">密碼</h4>
									<input type="password" id="password" name="password"
										placeholder="請輸入密碼" value="${userDetail.password}">
								</div>
								<div class="middle">
									<h4 class="account_result">身分</h4>
									<div class="input-group mb-3" style='width: 250px'>
										<select class="custom-select" name="identity" id="identity">
											<option value="1" id="1">管理員</option>
											<option value="2" id="2">一般會員</option>
											<option value="3" id="3">餐廳業者</option>
											<option value="4" id="4">住宿業者</option>
											<option value="5" id="5">交通業者</option>
										</select>
									</div>
								</div>
								<div class="middle">
									<h4 class="account_result">Email</h4>
									<input type="text" id="email" name="email" style='width: 200px'
										value="${userDetail.email}" />
								</div>
								<div class="middle">
									<h4 class="account_result">暱稱</h4>
									<input type="text" id="nickName" name="nickName"
										style='width: 100px' value="${userDetail.nickName}" />
								</div>
								<div class="middle">
									<h4 class="account_result">註冊日期</h4>
									<p class="p_result" id="rData">${userDetail.registerString}</p>
								</div>
								<div class="middle">
									<h4 class="account_result">最後修改日期</h4>
									<p class="p_result" id="mData">${userDetail.modify_DateString}</p>
								</div>
								<div class="middle">
									<button type="button" id="sumit" class="btn btn-success">確定</button>
									<button type="button" id="" class="btn btn-danger">取消</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function (){
        //  if('${userDetail.identityBean.name}'=='管理員'){
		// 	 $("#1").attr("selected")
		//  }
		   if('${userDetail.identityBean.id}'=='1'){
			$("#1").attr("selected")
		   }else if('${userDetail.identityBean.id}'=='2'){
			console.log('2')
			$("#2").attr("selected", true)
		   }else if('${userDetail.identityBean.id}'=='3'){
			console.log('3')
			$("#3").attr("selected", true)
		   }else if('${userDetail.identityBean.id}'=='4'){
			console.log('4')
			$("#4").attr("selected", true)
		   }else if('${userDetail.identityBean.id}'=='5'){
			console.log('5')
			$("#5").attr("selected", true)
		   }
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
					data:{ "username": username ,"password":password,"identity":identity,"email":email,"nickName":nickname},
					url: '${pageContext.servletContext.contextPath}/admin/modifyAccount',
					dataType: 'text',
					success: function (response) {
					  alert(response)
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
						alert(response)
						$("#userPic").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png")
					}

				}
			)
		})
		//udimgAjax
		$("#Apicture").change(function () {
			var form1 = $(this).parents('form');
			var formData = new FormData(form1[0]);
			formData.append('username', username)
			console.log("換圖片")
			readURL(this);
			$.ajax({

				type: "POST",
				url: "${pageContext.servletContext.contextPath}/admin/udAccountImg",
				data: formData,
				processData: false,
				contentType: false,
				dataType: "text",

				success: (response) => {
					alert("修改成功");

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
	</script>
</body>

</html>