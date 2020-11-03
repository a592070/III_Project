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
<title>Restaurant</title>

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
	color: black;
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
  					<form action="<%=application.getContextPath()%>/regionSearch" method="POST">
						<span class="sp_search">餐廳地區</span> 
						<select name="region_name" id="inputState" class="form-control">
							<option value="">請選擇地區</option>
							<option value="基隆">基隆</option>
							<option value="新北">新北</option>
							<option value="台北">台北</option>
							<option value="桃園">桃園</option>
							<option value="新竹">新竹</option>
							<option value="苗栗">苗栗</option>
							<option value="台中">台中</option>
							<option value="彰化">彰化</option>
							<option value="南投">南投</option>
							<option value="雲林">雲林</option>
							<option value="嘉義">嘉義</option>
							<option value="台南">台南</option>
							<option value="高雄">高雄</option>
							<option value="屏東">屏東</option>
							<option value="宜蘭">宜蘭</option>
							<option value="花蓮">花蓮</option>
							<option value="台東">台東</option>
							<option value="澎湖">澎湖</option>
							<option value="金門">金門</option>
							<option value="連江">連江</option>
						</select>
						<button type="submit" class="btn btn-primary">Search</button>
						</form>   
					</div> 
 					<div class="search">
 						<form action="<%=application.getContextPath()%>/nameSearch" method="POST"> 
 						<span class="sp_search">餐廳名稱</span>  
						<input type="text" name="restaurant_name" placeholder="請輸入關鍵字"/>  
 						<button type="submit" class="btn btn-primary">Search</button>  
 						</form>  
					</div> 

 					<div class="search">
 					<form action="<%=application.getContextPath()%>/usernameSearch" method="POST" > 
 						<span class="sp_search">會員帳號</span> 
 						<input type="text" name="username" placeholder="請輸入會員帳號" /> 
 						<button type="submit" class="btn btn-primary">Search</button> 
 					</form> 
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
						
							<tr>
								<td>${r.r_sn}</td>
								<td>${r.name}</td>
								<td>${r.address}</td>
								<td>${r.region}</td>
								<td>${r.username}</td>
								<td>
									<form action="<%=application.getContextPath()%>/DisplayRestaurant" method="POST">
									<button type="submit" class="btn btn-warning">Modify</button>
									<Input type='hidden' name='r_sn' value='${r.r_sn}'>
									</form>
								</td>
							</tr>
						
						
						</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>


		</div>
	</div>


</body>
</html>
