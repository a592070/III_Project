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
	background-color:white;
	padding:20px;
	border:solid 0.5px #8a909d;
	color:black;
}

.modify_div {
	width: 500px;
	text-align: center;
}

.div-back {
	margin-left: 80px;
	margin-top: 20px;
}
.mb-3{
	color:gray;
}
.mb-3.font-color{
	float:left;
}
.col-md-6.mb-3{
	clear:both;
}
h5{
	color:black
}
.btn.btn-danger{
 	margin:30px;
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
					action="<%=pageContext.getServletContext().getContextPath()%>/admin/hotelOrderindex"
					method="GET">
					<div class="div-back">
						<button type="submit" class="btn btn-primary">回飯店訂單列表</button>
					</div>
				</FORM>


				<div class="col-md-8 order-md-1">
				
				<FORM  id="modifyH" name="modifyH" method="POST" enctype="multipart/form-data">
					<h4 class="mb-3 font-color">大訂單號碼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><h4 color="black">${hotelOdetail.ORDER_ID}</h4>
					<hr>
					<h4 class="mb-3 font-color">餐廳訂單號碼&nbsp;&nbsp;&nbsp;</h4><h4 color="black">${hotelOdetail.SN_ORDER}</h4>
					<Input type='hidden' name='id' value='${hotelOdetail.SN_ORDER}'>
					<Input type='hidden' name='order_id' value='${hotelOdetail.ORDER_ID}'>
					<hr>
					<h4 class="mb-3">餐廳名稱&nbsp;</h4>
					<h4>${hotelOdetail.NAME}</h4>
					<hr>
					<h4 class="mb-3">下訂帳號&nbsp;</h4>
					<h4>${hotelOdetail.USERNAME}</h4>
					<hr>
<!-- 					<h4 class="mb-3">入住日期&nbsp;</h4> -->
<%-- 					<h4>${hotels.CHECK_IN}</h4> --%>
<!-- 					<hr> -->
					<div class="row"></div>
					<h4 class="mb-3">訂單資料</h4>
					<div class="col-md-6 mb-3">
						<label for="ordername"><h5>入住日期</h5></label> 
						<textarea class="form-control" name="CHECK_IN"	id="CHECK_IN" cols="80" rows="1">${hotelOdetail.CHECK_IN}</textarea>

					</div>
					<div class="col-md-6 mb-3">
						<label for="ordername"><h5>退房日期</h5></label> 
						<textarea class="form-control" name="CHECK_OUT"	id="CHECK_OUT" cols="80" rows="1">${hotelOdetail.CHECK_OUT}</textarea>

					</div>
					<div class="row"></div>
					<div class="col-md-6 mb-3">
						<label for="ordername"><h5>下訂者姓名</h5></label> 
						<textarea class="form-control" name="CLIENT_NAME"	id="CLIENT_NAME" cols="80" rows="1">${hotelOdetail.CLIENT_NAME}</textarea>

					</div>

					<div class="col-md-6 mb-3">
						<label for="phone"><h5>下訂者電話</h5></label> 
						<textarea class="form-control" name="CLIENT_PHONE"	id="CLIENT_PHONE" cols="80" rows="1">${hotelOdetail.CLIENT_PHONE}</textarea>

					</div>
					
					<div class="col-md-6 mb-3">
						<label for="phone"><h5>預訂房間數:雙人房</h5></label> 
						<textarea class="form-control" name="DOUBLE_ROOM"	id="DOUBLE_ROOM" cols="80" rows="1">${hotelOdetail.DOUBLE_ROOM}</textarea>

					</div>
					<div class="col-md-6 mb-3">
						<label for="phone"><h5>預訂房間數:四人房</h5></label> 
						<textarea class="form-control" name="QUADRUPLE_ROOM"	id="QUADRUPLE_ROOM" cols="80" rows="1">${hotelOdetail.QUADRUPLE_ROOM}</textarea>

					</div>
					<hr>

					</FORM>
					<hr>
					<h4 class="mb-3">總金額${hotelOdetail.HPRICE}元</h4>
					<hr>

					
									<div class="modify_div">
											<!-- Button trigger modal -->
											<form action="<%=application.getContextPath()%>/admin/hotelOrderdetail" method="POST">
											<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#訂單${hotelOdetail.SN_ORDER}">
											  送出修改
											</button>
											<button type="submit" class="btn btn-danger">資料重置</button>
											<Input type='hidden' name='rid' value='${hotelOdetail.SN_ORDER}'>
											</form>
									</div>
											<!-- Modal -->
											<div class="modal fade" id="訂單${hotelOdetail.SN_ORDER}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 											 <div class="modal-dialog modal-dialog-centered" role="document">
  											  <div class="modal-content">
 											     <div class="modal-header">
 											       <h5 class="modal-title" id="exampleModalLabel">修改提醒</h5>
 											       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  											        <span aria-hidden="true">&times;</span>											
  											      </button>											
  											    </div>
  											    <div class="modal-body">
  											      是否確認修改餐廳餐廳餐廳  ${hotelOdetail.SN_ORDER}  資料？
     											</div>											
 											     <div class="modal-footer">
   											     	<button type="submit" class="btn btn-primary" onclick="confrimModify()">確認</button>
   											     	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
   											   </div>
  											  </div>
  											</div>
											</div>

					
					<script type="text/javascript"> 
					 function confrimModify(){ 
								document.forms["modifyH"].action="<%=application.getContextPath()%>/admin/hotelOrderupdate";
								document.forms["modifyH"].method = "POST";
								document.forms["modifyH"].submit();
						}

			
						
					</script>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>