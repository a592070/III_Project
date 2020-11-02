<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style>
.sp_search-1 {
	float: left;
}

.box {
	display: flex;
}

.search {
	padding-right: 30px;
}

input {
	height: 40px;
}

.sp_search {
	padding: 10px;
	float: left;
}

select {
	float: left;
}

#inputState.form-control {
	width: 200px;
	padding-left: 20px;
}

h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}

.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}
td{
	text-color: black
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
				<div class="box">
					<div class="search" class="form-group col-md-2">
					<form:form action="regionSearch" method="POST" modelAttribute="rBean">
						<span class="sp_search"><form:label path="region">餐廳地區</form:label></span> 
						<form:select path="region" name="region_name" id="inputState" class="form-control">
							<form:option value="">請選擇地區</form:option>
							<form:option value="基隆">基隆</form:option>
							<form:option value="新北">新北</form:option>
							<form:option value="台北">台北</form:option>
							<form:option value="桃園">桃園</form:option>
							<form:option value="新竹">新竹</form:option>
							<form:option value="苗栗">苗栗</form:option>
							<form:option value="台中">台中</form:option>
							<form:option value="彰化">彰化</form:option>
							<form:option value="南投">南投</form:option>
							<form:option value="雲林">雲林</form:option>
							<form:option value="嘉義">嘉義</form:option>
							<form:option value="台南">台南</form:option>
							<form:option value="高雄">高雄</form:option>
							<form:option value="屏東">屏東</form:option>
							<form:option value="宜蘭">宜蘭</form:option>
							<form:option value="花蓮">花蓮</form:option>
							<form:option value="台東">台東</form:option>
							<form:option value="澎湖">澎湖</form:option>
							<form:option value="金門">金門</form:option>
							<form:option value="連江">連江</form:option>
						</form:select>
						<form:button type="button" class="btn btn-primary">Search</form:button>
						</form:form>
					</div>
					<div class="search">
					<form:form action="nameSearch" method="POST" modelAttribute="rBean">
						<span class="sp_search"><form:label path="name">餐廳名稱</form:label></span> 
						<form:input path="name" type="text" name="restaurant_name" placeholder="請輸入關鍵字"/>
						<form:button type="button" class="btn btn-primary">Search</form:button>
					</form:form>
					</div>

					<div class="search">
					<form:form action="usernameSearch" method="POST" modelAttribute="rBean">
						<span class="sp_search"><form:label path="username">會員帳號</form:label></span> 
						<form:input path="username" type="text" name="username" placeholder="請輸入會員帳號" />
						<form:button type="button" class="btn btn-primary">Search</form:button>
					</form:form>
					</div>
				</div>
				<h2>餐廳列表</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>Restaurant ID</th>
								<th>餐廳名稱</th>
								<th>餐廳地址</th>
								<th>地區</th>
								<th>會員帳號</th>
								<th>功能</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="r" items="${rBean}">
						<form:form action="DisplayRestaurant" method="POST" modelAttribute="rBean">
							<tr>
								<td>${r.r_sn}</td>
								<td>${r.name}</td>
								<td>${r.address}</td>
								<td>${r.region}</td>
								<td>${r.username}</td>
								<td><form:button>Modify</form:button></td>
							</tr>
						</form:form>
						</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>


		</div>
	</div>


</body>
</html>
