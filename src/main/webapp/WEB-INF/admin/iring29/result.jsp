<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style type="text/css">
td {
	color: black;
}

.rname {
	margin-left: 50px;
	margin-top: 50px;
	color:black;
}

</style>
</head>
<body>
<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="rname">
					<h2>${result}</h2>
					<div id="div1"></div>
				</div>
			</div>

<script type="text/javascript">
	//設定倒數秒數 
	var count = 3;
	//寫一個方法，顯示倒數秒數  數到0後跳轉頁面  
	function countDown(){
		//將count顯示在div中
		document.getElementById("div1").innerHTML= count+'秒後跳轉回餐廳列表';
		//沒執行一次，count減1
		count -= 1;
		//count=0時，跳轉頁面
		if(count==0){
			location.href="<%=application.getContextPath()%>/admin/Restaurant";
		}
		//每秒執行一次,showTime()
		setTimeout("countDown()",1000);
	}
	//執行countDown方法
	countDown();
</script>


		</div>
	</div>



</body>
</html>