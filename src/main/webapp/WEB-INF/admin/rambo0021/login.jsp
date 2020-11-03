<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>登入</title>
	<style>
		.img {
			width: 13px;
		}
	</style>
	<script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/floating-labels/">

	<!-- Bootstrap core CSS -->
	<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="floating-labels.css" rel="stylesheet">

</head>

<body>
	<div style="margin:0 auto;width:300px">
	<FORM ACTION="<%=pageContext.getServletContext().getContextPath()%>/LoginServlet" method="POST" name="loginForm"
		class="form-signin">
		<fieldset>
			<legend>登入</legend>
			<div class="form-label-group">
				帳號: <INPUT TYPE="TEXT" id="userName" NAME="userName" onblur="checkusr()" class="form-control"
					placeholder="username" autofocus />
				<img class="img" id="idfimg" src=""><span id="idsp"></span><br />
			</div>
			<div class="form-label-group">
				密碼: <INPUT TYPE="PASSWORD" id="password" NAME="password" class="form-control" placeholder="Password"
					onblur="checkpwd()" />
				<img class="img" id="idfimg2" src=""><span id="idsp2"></span><br />
			</div>
			<CENTER>
				<INPUT TYPE="SUBMIT" id="submit" value="登入" disabled class="btn btn-primary">
				<Font color='red' size="-1">
					${ErrorMsgKey.LoginError}</Font>
			</CENTER>
		</fieldset>
	</FORM>
</div>


	<script>
		function checkusr() {
			let theUsrObjVal = document.getElementById("userName").value;
			// let disable = document.getElementById("submit").disabled;

			let sp = document.getElementById("idsp");
			let theUsrlen = theUsrObjVal.length;

			if (theUsrObjVal == "") {
				sp.innerHTML = "帳號不可為空白"
				sp.style.color = "red";
				sp.style.fontSize = "13px";
				sp.style.fontStyle = "italic";
				document.getElementById("idfimg").src = "${pageContext.servletContext.contextPath}/rambo0021/Images/error.png"
				document.getElementById("submit").disabled = true;
			} else {
				sp.innerHTML = "";
				document.getElementById("idfimg").src = ""
				document.getElementById("submit").disabled = false;
			}
		}
		function checkpwd() {
			let theUsrObjVal = document.getElementById("password").value;
			let disable = document.getElementById("submit").disabled;
			let sp = document.getElementById("idsp2");
			let theUsrlen = theUsrObjVal.length;

			if (theUsrObjVal == "") {
				sp.innerHTML = "密碼不可為空白"
				sp.style.color = "red";
				sp.style.fontSize = "13px";
				sp.style.fontStyle = "italic";
				document.getElementById("idfimg2").src = "${pageContext.servletContext.contextPath}/rambo0021/Images/error.png"
				document.getElementById("submit").disabled = true;
			} else {
				sp.innerHTML = "";
				document.getElementById("idfimg2").src = "";
				document.getElementById("submit").disabled = false;
			}
		}
	</script>
</body>

</html>