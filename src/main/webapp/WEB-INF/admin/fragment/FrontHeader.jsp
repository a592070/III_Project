<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/10/9
  Time: 下午 03:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.badge {
  padding-left: 9px;
  padding-right: 9px;
  -webkit-border-radius: 9px;
  -moz-border-radius: 9px;
  border-radius: 9px;
}
.label-warning[href],
.badge-warning[href] {
  background-color: #c67605;
}
#lblCartCount {
    font-size: 12px;
    background: #ff0000;
    color: #fff;
    padding: 0 5px;
    vertical-align: top;
    margin-left: -10px; 
}
.fa.fa-shopping-cart.fa-2x{
	color:white;
	padding-left:10px;
}

</style>


<%--樣式跑掉，將下面4行加入引入頁面--%>
<%--    <script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>

<header class="masthead mb-auto sticky-top">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand"
			href="${pageContext.servletContext.contextPath}/index.jsp"><img src="${pageContext.servletContext.contextPath}/static/Logo.png" height="50"/></a>
		
			<c:if test="${!empty Login}"><p style="font-size: 10px;" class="navbar-brand">您好，<c:out value="${Login.nickName}" /></p></c:if>

		<div class="collapse navbar-collapse nav justify-content-center"
			id="navb">
			<ul class="navbar-nav ">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/asx54630/HotelService.jsp">找旅館</a>
				</li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/iring29/Restaurant_index.jsp">找餐廳</a>
				</li>
				<li class="nav-item dropdown"><a href="#"
					class="nav-link dropdown-toggle" data-toggle="dropdown"> 找交通 <b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li class="dropdown-item"><a
							href="${pageContext.servletContext.contextPath}/innocence741/ajax_traffic.jsp">找高鐵</a></li>
						<li class="dropdown-item"><a href="#">找租車</a></li>
						<li class="dropdown-item"><a
							href="${pageContext.servletContext.contextPath}/innocence741/showT_Order.jsp">我的交通訂單</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/a592070/attractionInfo.jsp">找景點</a>
				</li>

				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/a592070/travelSetSelect.jsp">我的行程</a>
				</li>
                <!--餐廳 -->
				<c:if test="${Login.identityBean.id eq 3}">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/Restaurant_HPServlet">店家頁面</a>
				</li>
				</c:if>
				<!--住宿 -->
				<c:if test="${Login.identityBean.id eq 4}">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/H_HomepageServlet">店家頁面</a>
				</li>
				</c:if>
				<!--交通 -->
				<c:if test="${Login.identityBean.id eq 5}">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.servletContext.contextPath}/">店家頁面</a>
				</li>
				</c:if>
				
				<!-- Shopping Cart -->
				<li>
					<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
					<i class="fa fa-shopping-cart fa-2x"></i>
					<span class='badge badge-warning' id='lblCartCount'>  </span>
  				</li>
				
			</ul>
		</div>

		<div>
			<form class="form-inline my-3">
				<input class="form-control mr-sm-2" type="text" placeholder="Search" />
				<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
			</form>
		</div>
		<div class="btn-group">
			<c:if test="${empty Login}">
				<button type="button" class="btn btn-primary"
					onclick="document.location.href='${pageContext.servletContext.contextPath}/rambo0021/login.jsp'" />
            登入</button>
				<button type="button" class="btn btn-primary"
					onclick="document.location.href='${pageContext.servletContext.contextPath}/rambo0021/register.jsp'">
					註冊</button>
			</c:if>
			<c:if test="${!empty Login}">
			<button type="button" class="btn btn-primary"
					onclick="document.location.href='${pageContext.servletContext.contextPath}/rambo0021/homePage.jsp'" />
           個人頁面</button>
            <button type="button" class="btn btn-primary"
					onclick="document.location.href='${pageContext.servletContext.contextPath}/Logout'" />
            登出</button>
			</c:if>
			<button type="button" class="btn btn-primary"
				onclick="document.location.href='${pageContext.servletContext.contextPath}/ForumServlet'">
				論壇</button>
		</div>
	</nav>
</header>

<div class="d-flex flex-row-reverse fixed-bottom pt-0">
	<button class="btn btn-primary" onclick="document.location.href='${pageContext.servletContext.contextPath}/ChatServlet'">
		<span class="spinner-grow spinner-grow-sm"></span>聯絡客服
	</button>
</div>


