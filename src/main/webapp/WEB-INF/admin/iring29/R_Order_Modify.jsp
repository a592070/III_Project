<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUN x TAIWAN</title>
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
					action="<%=pageContext.getServletContext().getContextPath()%>/admin/RestaurantList"
					method="GET">
					<div class="div-back">
						<button type="submit" class="btn btn-primary">回餐廳訂單列表</button>
					</div>
				</FORM>


				<div class="col-md-8 order-md-1">
				
				<FORM  id="modifyR" name="modifyR" method="POST" enctype="multipart/form-data">
					<h4 class="mb-3 font-color">大訂單號碼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4><h4 color="black">${ROList.order_id}</h4>
					<hr>
					<h4 class="mb-3 font-color">餐廳訂單號碼&nbsp;&nbsp;&nbsp;</h4><h4 color="black">${ROList.id}</h4>
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
						<label for="ordername"><h5>下訂者姓名</h5></label> 
						<textarea class="form-control" name="cus_name"	id="cus_name" cols="80" rows="1">${ROList.cus_name}</textarea>

					</div>

					<div class="col-md-6 mb-3">
						<label for="phone"><h5>下訂者電話</h5></label> 
						<textarea class="form-control" name="cus_phone"	id="cus_phone" cols="80" rows="1">${ROList.cus_phone}</textarea>

					</div>
					
					<div class="col-md-6 mb-3">
						<label for="phone"><h5>訂位人數</h5></label> 
<%-- 						<textarea class="form-control" name="cus_phone"	id="cus_phone" cols="80" rows="1">${ROList.customer_num}</textarea> --%>
						<select name="customer_num" id="p_num" class="form-control" onchange="changenum()">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						</select>
					<script type="text/javascript">
						var num  =  ${ROList.customer_num};
						console.log("type" + typeof(num));
        				var opts=document.getElementById("p_num");
						console.log("num" + opts[num].value);
       					opts[num-1].selected=true;
   					</script>
					</div>
					<hr>


					<h4 class="mb-3 font-color">原預定時間&nbsp;&nbsp;&nbsp;&nbsp;</h4><h4 color="black" >${date}&nbsp;${time}</h4>
					
					<div class="col-md-6 mb-3">
						<label><h5>日期&nbsp;</h5></label> 
						<input type="date" name="book_date" id="theDate" >
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

						<label><h5>時間&nbsp;</h5></label> 
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
					<h4 class="mb-3">總金額 <span id="deposit">${ROList.deposit}</span> 元</h4>
					<hr>
					<script>
// 					function changenum(){
// 						console.log("in change" + $("#deposit").html("300"))
					
// 						}
					</script>
<!-- 					<div class="modify_div"> -->
<!-- 						<button class="btn btn-warning" name="confirm" value="confrim" -->
<!-- 							onclick="confrimModify()">確認修改</button> -->
<!-- 					</div> -->
					
									<div class="modify_div">
											<!-- Button trigger modal -->
											<form action="<%=application.getContextPath()%>/admin/ROrderDisplay" method="POST">
											<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#訂單${ROList.id}">
											  送出修改
											</button>
											<button type="submit" class="btn btn-danger">資料重置</button>
											<Input type='hidden' name='rid' value='${ROList.id}'>
											</form>
									</div>
											<!-- Modal -->
											<div class="modal fade" id="訂單${ROList.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
 											 <div class="modal-dialog modal-dialog-centered" role="document">
  											  <div class="modal-content">
 											     <div class="modal-header">
 											       <h5 class="modal-title" id="exampleModalLabel">修改提醒</h5>
 											       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
  											        <span aria-hidden="true">&times;</span>											
  											      </button>											
  											    </div>
  											    <div class="modal-body">
  											      是否確認修改餐廳    ${ROList.id}  資料？
     											</div>											
 											     <div class="modal-footer">
   											     	<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
   											     	<button type="submit" class="btn btn-primary" onclick="confrimModify()">確認</button>
   											   </div>
  											  </div>
  											</div>
											</div>

					
					<script type="text/javascript"> 
					 function confrimModify(){ 
								document.forms["modifyR"].action="<%=application.getContextPath()%>/admin/ROrderModify";
								document.forms["modifyR"].method = "POST";
								document.forms["modifyR"].submit();
						}

			
						
					</script>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>