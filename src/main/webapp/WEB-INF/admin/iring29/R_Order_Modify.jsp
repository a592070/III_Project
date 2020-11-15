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
.div-back {
	margin-left: 80px;
	margin-top: 20px;
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

				<FORM id="RHome" name="RHome"
					action="<%=pageContext.getServletContext().getContextPath()%>/RestaurantList"
					method="GET">
					<div class="div-back">
						<button type="submit" class="btn btn-primary">回餐廳列表</button>
					</div>
				</FORM>


				<div class="col-md-8 order-md-1">
				
				<FORM  id="modifyR" name="modifyR" method="POST" enctype="multipart/form-data">
					<h3 class="mb-3">大訂單號碼&nbsp;${ROList.order_id}</h3>
					<hr>
					<h4 class="mb-3">餐廳訂單號碼&nbsp;${ROList.id}</h4>
					<Input type='hidden' name='id' value='${ROList.id}'>
					<Input type='hidden' name='order_id' value='${ROList.order_id}'>
					<hr>
					<h4 class="mb-3">餐廳名稱&nbsp;</h4>
					<h4>${ROList.name}</h4>
					<hr>
					<h4 class="mb-3">下訂帳號&nbsp;</h4>
					<h4>${ROList.username}</h4>
					<hr>
					<h4 class="mb-3">訂單成立時間&nbsp;</h4>
					<h4>${ROList.order_date}</h4>
					<hr>
					<div class="row"></div>
					<h4 class="mb-3">訂單資料</h4>
					<div class="col-md-6 mb-3">
						<label for="ordername">下訂者姓名</label> 
						<textarea class="form-control" name="cus_name"	id="cus_name" cols="80" rows="1">${ROList.cus_name}</textarea>

					</div>

					<div class="col-md-6 mb-3">
						<label for="phone">下訂者電話</label> 
						<textarea class="form-control" name="cus_phone"	id="cus_phone" cols="80" rows="1">${ROList.cus_phone} </textarea>

					</div>
					<hr>


					<h4 class="mb-3">預定時間&nbsp;${date}&nbsp;${time}</h4>
					<div class="col-md-6 mb-3">
						<label>日期</label> <input type="date" name="book_date" id="theDate" >
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
						document.getElementById("theDate").value = "${date}";
						document.getElementById("theDate").min = today;
					</script>

						<label>時間</label> 
						<select id=sel name="book_time">
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
						</select>
						<script>
							console.log("${time}");
							switch ("${time}"){
							case'11:00':
								document.getElementById("sel")[0].selected=true;
								break;
							case'12:00':
								document.getElementById("sel")[1].selected=true;
								break;
							case'13:00':
								document.getElementById("sel")[2].selected=true;
								break;
							case'14:00':
								document.getElementById("sel")[3].selected=true;
								break;
							case'17:00':
								document.getElementById("sel")[4].selected=true;
								break;
							case'18:00':
								document.getElementById("sel")[5].selected=true;
								break;
							case'19:00':
								document.getElementById("sel")[6].selected=true;
								break;
							case'20:00':
								document.getElementById("sel")[7].selected=true;
								break;
							}
							
						</script>
					</div>
					</FORM>
					<hr>
					<h4 class="mb-3">總金額 500 元</h4>
					<hr>
					<h4 class="mb-3">訂單狀態&nbsp;</h4>
					<hr>
					<div class="modify_div">
						<button class="btn btn-warning" name="confirm" value="confrim"
							onclick="confrimModify()">確認修改</button>
					</div>
					
					<script type="text/javascript"> 
					 function confrimModify(){ 
						 if (confirm("確定送出修改 ? ") ) { 
								document.forms["modifyR"].action="<%=application.getContextPath()%>/ROrderModify";
								document.forms["modifyR"].method = "POST";
								document.forms["modifyR"].submit();
								
								return;
							} else {
								return;
							}
						}

			
						
					</script>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>