<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Restaurant Order</title>
<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<style type="text/css">
.col-md-8.order-md-1 {
	margin: 50px auto;
	margin-left:200px;
	width: 500px;
	/* 	border:solid 1px gray; */
}

.modify_div {
	width: 500px;
	text-align: center;
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

				<div class="col-md-8 order-md-1">
					<h3 class="mb-3">大訂單號碼</h3>
					<hr>
					<h4 class="mb-3">餐廳訂單號碼</h4>
					<hr>
					<h4 class="mb-3">餐廳名稱</h4>
					<hr>
					<h4 class="mb-3">下訂帳號</h4>
					<hr>
					<div class="row"></div>
					<h4 class="mb-3">訂單資料</h4>
					<div class="col-md-6 mb-3">
						<label for="ordername">下訂者姓名</label> <input class="form-control"
							id="ordername">

					</div>

					<div class="col-md-6 mb-3">
						<label for="phone">下訂者電話</label> <input class="form-control"
							id="phone">

					</div>
					<hr>


					<h4 class="mb-3">預定時間</h4>
					<div class="col-md-6 mb-3">
						<label>日期</label> <input type="date" name="book_date" id="theDate"
							min="">
						<script>
							var date = new Date();

							var day = date.getDate();
							var month = date.getMonth() + 1;
							var year = date.getFullYear();

							if (month < 10)
								month = "0" + month;
							if (day < 10)
								day = "0" + day;

							var today = year + "-" + month + "-" + day;
							console.log(typeof (today));
							document.getElementById("theDate").value = today;
							document.getElementById("theDate").min = today;
						</script>

						<label>時間</label> <select>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
						</select>
					</div>
					<hr>
					<h4 class="mb-3">總金額 500 元</h4>
					<hr>
					<h4 class="mb-3">訂單狀態</h4>
					<hr>
					<div class="modify_div">
						<button class="btn btn-warning" name="confirm" value="confrim"
							onclick="confrimModify()">確認修改</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>