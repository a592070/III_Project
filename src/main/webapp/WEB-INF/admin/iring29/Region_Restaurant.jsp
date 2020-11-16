
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search</title>
<script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

.div_box {
	margin: 50px auto;
	width: 500px;
	/* height: 400px; */
	/* border: 1px solid black; */
}

.div_search {
	width: 500px auto;
	border: 1px solid black;
	/* display: flex; */
}

.search {
	/* width: 500px; */
	text-align: center;
	border-bottom: solid 1px #c1c0c1;
	cursor: pointer;
	padding: 20px;
}

.search_date {
	/* width: 500px; */
	text-align: center;
	border-bottom: solid 1px #c1c0c1;
	cursor: pointer;
	padding: 25px;
}

.sp_search {
	/* border: 1px solid black; */
	width: 100px;
	float: left;
	padding-top: 10px;
	margin-left: 50px;
	text-align: right;
}
.sp_search-1{
	width: 100px;
	float: left;
	padding-top: 10px;
	margin-left: 50px;
	margin-right: 28px;
	text-align: right;
}
#inputState.form-control{
	width: 250px;
	padding-left: 20px;
}

input {
	width: 250px;
	line-height: 35px;
}

button {
	padding: 5px;
	margin-left: 10px;
}

.div1 {
	margin: 50px auto;
	width: 850px;
	height: 100px;
	border: 1px solid black;
}

.div2 {
	width: 750px;
	float: left;
}

a {
	width: 100px;
	height: 50px;
}

.go-btn{
padding-top: 25px;
}

h4 {
	padding-left: 30px;
	padding-top: 15px;
	margin-bottom: 15px;
}

.sp_result {
	padding: 30px;
}

.button {
	text-align: center;
}
</style>
</head>

<body>
<c:import url="/WEB-INF/admin/fragment/FrontHeader.jsp" />

	<c:forEach var="res" items="${res_data_region}">
		<FORM
			action="<%=pageContext.getServletContext().getContextPath()%>/RestaurantServlet"
			method="POST">
			<div class="div1">
				<div class="div2">
					<h4>${res.name}</h4>

					<!-- <span class="sp_result">region</span> -->
					<%-- <span class="sp_result">rating：${res.rating}</span> --%>
					<span class="sp_result">${res.type}</span>

				</div>
				<div class='go-btn'><button name="go" value="go" class="btn btn-success">Go</button></div>
				
				<Input type='hidden' name='restaurant_name' value='${res.name}'>
				<Input type='hidden' name='book_date' value='${book_date}'>
				<Input type='hidden' name='person_numer' value='${person_numer}'>

			</div>
		</FORM>
	</c:forEach>
	
	<div class="div_box">
		<div class="search">
		
		<FORM  action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant_index" >
			<button class="btn btn-success">重新查詢</button>
		</FORM>
		
		</div>
	</div>

</body>

</html>