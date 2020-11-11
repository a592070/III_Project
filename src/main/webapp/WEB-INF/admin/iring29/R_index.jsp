<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	padding-right: 20px;
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

td {
	color: black;
}
th{
	text-align:center;
}
.pages{
	width: 1140px;
	margin-left:50px ;
	margin-bottom:50px ;
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
						<form id="formR" name="formR" action="<%=application.getContextPath()%>/regionSearch"
							method="POST">
							<span class="sp_search">餐廳地區</span> 
							<select name="region_name"	id="inputState" class="form-control">
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
						</form>
					</div>
				<script>
				$("#inputState").change(function(){
						console.log("change");
						console.log($("#inputState").val());
						document.formR.attributes["action"].value ="<%=application.getContextPath()%>/regionSearch";
						document.formR.submit();
					})

				</script>	
				
					<div class="search">
						<form action="<%=application.getContextPath()%>/key" method="GET"> 
							<span class="sp_search">關鍵字搜尋</span> <input type="text"
 								name="keyword" placeholder="請輸入關鍵字" /> 
 							<button type="submit" class="btn btn-primary">Search</button> 
						</form> 
 					</div> 

				</div>
				<h2>餐廳列表</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>ID</th>
								<th>餐廳名稱</th>
								<th>餐廳地址</th>
								<th>地區</th>
								<th>會員帳號</th>
								<th>狀態</th>
								<th>修改</th>
								<th>刪除</th>
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
									<form id="statuss" name="statuss">
										<c:if test="${r.status == 'N'}">停用&nbsp;
											<button class="btn btn-success" onclick="statusR()" >啟用</button>
										</c:if>
										<c:if test="${r.status == 'Y'}">啟用&nbsp;
											<button class="btn btn-secondary" onclick="statusR()" >停用</button>
										</c:if>
											<Input type='hidden' name='status' value='${r.status}'>
											<Input type='hidden' name='r_sn' value='${r.r_sn}'>
									</form>
									</td>
																		
									<td>
										<form
											action="<%=application.getContextPath()%>/DisplayRestaurant"
											method="POST">
											<button type="submit" class="btn btn-warning">修改</button>
											<Input type='hidden' name='r_sn' value='${r.r_sn}'>
										</form>
									</td>
									<td><button type="submit" class="btn btn-danger">刪除</button></td>
								</tr>

							</c:forEach>

						</tbody>
					</table>
<script type="text/javascript">				
function statusR(){
	if (confirm("確定修改店家狀態 ? ") ) {
		console.log("in modify");
		document.forms["statuss"].action="<%=application.getContextPath()%>/ModifyStatus";
		document.forms["statuss"].method="POST";
		document.forms["statuss"].submit();
	}else{
		return null;
		}
	 
}
</script>
				</div>
			</div>
			

		<div class="pages">
			<nav aria-label="...">
				<ul class="pagination">
			<c:if test="${currentPage != null}">
				<c:if test="${currentPage == 1}">
					<li class="page-item disabled"><a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage-1}" tabindex="-1">Previous</a></li>
				</c:if>
				<c:if test="${currentPage > 1}">
					<li class="page-item"><a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage-1}" tabindex="-1">Previous</a></li>
				</c:if>
					<li class="page-item active"><a class="page-link" href="#">${currentPage}
					<span class="sr-only">(current)</span></a></li>
				<c:if test="${currentPage != totalPage && currentPage != ''}">
					<li class="page-item"><a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage+1}">Next</a></li>
				</c:if>
				<c:if test="${currentPage == totalPage && currentPage != ''}">
					<li class="page-item disabled"><a class="page-link" href="<%=application.getContextPath()%>/Restaurant?currentPage=${currentPage+1}">Next</a></li>
				</c:if>
			</c:if>

			<c:if test="${currentKPage != null}">
				<c:if test="${currentKPage == 1}">
					<li class="page-item disabled"><a class="page-link" href="<%=application.getContextPath()%>/key?currentKPage=${currentKPage-1}" tabindex="-1">Previous</a></li>
				</c:if>
				<c:if test="${currentKPage > 1}">
					<li class="page-item"><a class="page-link" href="<%=application.getContextPath()%>/key?currentKPage=${currentKPage-1}&keyword=${keyword}" tabindex="-1">Previous</a></li>
				</c:if>
					<li class="page-item active"><a class="page-link" href="#">${currentKPage}
					<span class="sr-only">(current)</span></a></li>
				<c:if test="${currentKPage != totalKPage}">
					<li class="page-item"><a class="page-link" href="<%=application.getContextPath()%>/key?currentKPage=${currentKPage+1}&keyword=${keyword}">Next</a></li>
				</c:if>
				<c:if test="${currentKPage == totalKPage}">
					<li class="page-item disabled"><a class="page-link" href="<%=application.getContextPath()%>/keywords?currenKPage=${currentKPage+1}">Next</a></li>
				</c:if>
			</c:if>
			
			
				</ul>
			</nav>
		</div>



		</div>
	</div>


</body>
</html>
