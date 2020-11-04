<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>論壇管理</title>

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
					<div class="search" class="form-group">
						<form:form action="artTypeSearch" method="GET">
							<span class="sp_search">文章類型</span>
							<select name="articleType" id="inputState" class="form-control">
								<option value="">選擇類型</option>
								<option value="旅遊">旅遊</option>
								<option value="美食">美食</option>
								<option value="住宿">住宿</option>
							</select>
							<button type="button" class="btn btn-primary">Search</button>
						</form:form>
					</div>
					<div class="search">
						<form:form action="titleSearch" method="POST"
							modelAttribute="articles">
							<span class="sp_search">文章標題</span>
							<input class="form-control mr-sm-2" type="search" placeholder="Search" >
							<button type="button" class="btn btn-primary">Search</button>
						</form:form>
					</div>

					<div class="search">
						<form:form action="searchByUserId" method="GET"
							>
							<span class="sp_search">作者</span>
							<input class="form-control " type="search" placeholder="Search" name="userid">
							<button type="button" class="btn btn-primary" >Search</button>
						</form:form>
					</div>
				</div>
				<h2>文章列表</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>ID</th>
								<th>Title</th>
								<th>Create Time</th>
								<th>Author</th>
								<th>Type</th>


							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${artBean}">
								<tr>
									<td>${article.artId}</td>
									<td><a class="text-dark" href=""> ${article.artTitle}</a></td>
									<td>${article.artCreDate}</td>
									<td><a class="text-dark" href="">${article.artUserId}</a></td>
									<td>${article.artType}</td>
									<td><button>Edit</button></td>
									<td><button>Delete</button></td>

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
