<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<form action="hotelupdate" method="POST">
					<table>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label"></label> <input
								type="hidden" value="${hoteldetail.SN}" name="upId"> 名稱:<input
								class="form-control" type="text" value="${hoteldetail.NAME}"
								name="upName"><br> 地區:<input class="form-control"
								type="text" value="${hoteldetail.REGION}" name="upRegion"><br>
							地址:<input class="form-control" type="text"
								value="${hoteldetail.ADDRESS}" name="upAddress"><br>
							電話:<input class="form-control" type="text"
								value="${hoteldetail.TEL}" name="upTel"><br> 雙人房價格:<input
								class="form-control" type="text"
								value="${hoteldetail.DOUBLE_ROOM}" name="upDBroom"><br>
							四人房價格:<input class="form-control" type="text"
								value="${hoteldetail.QUADRUPLE_ROOM}" name="upQDroom"><br>
							介紹:<input class="form-control" value="${hoteldetail.DESCRIPTION}"
								name="upDescription"><br> 營業時間:<input
								class="form-control" type="text" value="${hoteldetail.OPENTIME}"
								name="upOpentime"><br> 住宿類型:<input
								class="form-control" type="text" value="${hoteldetail.TYPE}"
								name="upType"><br>
						</div>
						<div>
							<p class="p_result">
								<c:if test="${hoteldetail.STATUS == '停用'}">停用&nbsp;
											<button class="btn btn-success" onclick="Hstatus()">啟用</button>
								</c:if>
								<c:if test="${hoteldetail.STATUS == '啟用'}">啟用&nbsp;
											<button class="btn btn-secondary" onclick="Hstatus()">停用</button>
								</c:if>
								<Input type='hidden' name='status' value='${hoteldetail.STATUS}'>
								<Input type='hidden' name='r_sn' value='${hoteldetail.SN}'>
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								onclick="history.back()">取消</button>
							<button type="submit" class="btn btn-primary">確認</button>
						</div>
					</table>
				</form>


			


			</div>
		</div>
	</div>


</body>
</html>
