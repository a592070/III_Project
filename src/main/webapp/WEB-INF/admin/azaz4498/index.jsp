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
				<div class="box ">

					<div class="search">
						<form:form action="titleSearch" method="GET" class="mr-5"
							modelAttribute="articles">
							<div class="sp_search">文章標題</div>
							<input class="form-control" type="search" placeholder="請輸入文章標題"
								name="title">
							<button type="submit" class="btn btn-primary btn-sm m-2">Search</button>
						</form:form>
					</div>

					<div class="search">
						<form:form action="searchByUserId" method="GET" class="mr-5">
							<span class="sp_search">作者</span>
							<input class="form-control" type="search" placeholder="請輸入用戶名稱"
								name="userid" />
							<button type="submit" class="btn btn-primary btn-sm m-2">Search</button>
						</form:form>
					</div>
					<div class="search">
						<form:form action="artTypeSearch" method="GET" class="mr-5">
							<span class="sp_search">文章類型</span>
							<br />
							<select name="articleType" id="inputType" class="form-control">
								<option value="">選擇類型</option>
								<c:forEach var="Type" items="${typeBean}">
									<option value="${Type.typeId}">${Type.typeName }</option>
								</c:forEach>
								
							</select>
							<br />
							<button type="submit" class="btn btn-primary btn-sm m-2">Search</button>
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
									<td>${article.artCreTime}</td>
									<td><a class="text-dark" href="">${article.artUserId}</a></td>
									<td>${article.articleType.typeId}</td>
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
