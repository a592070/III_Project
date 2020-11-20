<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry</title>
    <script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

#box {
	width: 500px;
	margin: 50px auto;
}
h3{
	float:left;
	margin-left: 10px;
	padding-bottom: 20px;
}
.btn{
	margin-left: 100px;
	margin-top: 10px;
}

</style>
</head>
<body>
<c:import url="/WEB-INF/admin/fragment/FrontHeader.jsp" />


	<div id="box">
		<h3>抱歉，找不到相關訊息，請重新查詢</h3>
		
		<div>
			<img src="https://swooningoverfictionalmen.files.wordpress.com/2017/06/forgivemoi.gif" alt="">
		</div>
		
		<div class="btn">
		<FORM  action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant_index" >
			<button class="btn btn-primary">回訂餐首頁</button>
		</FORM>
		</div>
		
		
	</div>

</body>
</html>