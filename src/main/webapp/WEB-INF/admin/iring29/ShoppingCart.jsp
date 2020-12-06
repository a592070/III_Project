<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUN TAIWAN - 購物車</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="/WEB-INF/admin/fragment/user_ref.jsp" /> 

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body{
	margin:0px;
	padding:0px;
	background:url('https://www.taquerialascumbres.com/static/media/background2.3fec4658.jpg') center center fixed no-repeat;
	background-size: cover;　
} 
.cart_area{
 	background:white; 
	margin:100px 120px;
	padding-left:100px;
	padding-top:50px;
	padding-bottom:70px;
}
</style>

<!-- CSS STYLE -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sona-master/css/style.css" type="text/css">
<style>
.bg-dark {
     background-color: transparent !important; 
}
.form-control.time{
	width:100px;
	margin-top:10px;
}
.form-control.p_num{
	width:85px;
}
.col-sm-12.col-md-10.col-md-offset-1{
	width:950px;
}
.div_title{
	width:150px;
	padding-top:10px;
}
.content{
	width:250px;
	padding-top:10px;
}
.div_title.input{
	width:130px;
	padding-top:10px;
/* 	float:left; */
}
.form-control.data{
	width:250px;
}
.media-heading{
	height: 30px;
}
.deposit{
	width:80px;
	text-align: center;
}
</style>

</head>
<body>
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <script>
    $(".nav-shop__circle").html('${cartnum}');
//     console.log($(".nav-shop__circle").val());
    console.log("nu = " + ${cartnum});
// 	   console.log("num");
    </script>
<section class="cart_area">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<h2>Hotel</h2>
						</tr>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<a class="thumbnail pull-left" href="#"> <img
										class="media-object"
										src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
										style="width: 72px; height: 72px;">
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#">Product name</a>
										</h4>
										<h5 class="media-heading">
											by <a href="#">Brand name</a>
										</h5>
										<span>Status: </span><span class="text-success"><strong>In
												Stock</strong></span>
									</div>
								</div>
							</td>
							<td class="col-sm-1 col-md-1" style="text-align: center"><input
								type="email" class="form-control" id="exampleInputEmail1"
								value="3"></td>
							<td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
							<td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
							<td class="col-sm-1 col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr>
						<tr>
							<td class="col-md-6">
								<div class="media">
									<a class="thumbnail pull-left" href="#"> <img
										class="media-object"
										src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
										style="width: 72px; height: 72px;">
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#">Product name</a>
										</h4>
										<h5 class="media-heading">
											by <a href="#">Brand name</a>
										</h5>
										<span>Status: </span><span class="text-warning"><strong>Leaves
												warehouse in 2 - 3 weeks</strong></span>
									</div>
								</div>
							</td>
							<td class="col-md-1" style="text-align: center"><input
								type="email" class="form-control" id="exampleInputEmail1"
								value="2"></td>
							<td class="col-md-1 text-center"><strong>$4.99</strong></td>
							<td class="col-md-1 text-center"><strong>$9.98</strong></td>
							<td class="col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>Subtotal</h3></td>
							<td class="text-right"><h3>
									<strong>$24.59</strong>
								</h3></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>


<!-- 餐廳 start -->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<h2>訂餐廳</h2>
						</tr>
						<tr>
							<th><h5>餐廳資訊</h5></th>
							<th><h5></h5></th>
							<th><h5>訂位時間</h5></th>
							<th class="text-center"><h5>訂位人數</h5></th>
							<th class="text-center"><h5>價格</h5></th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="R" items="${OTBean.r_Order_Lists}">
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<div class="media-body">
										<div class="div_title"><h5 class="media-heading">餐廳名稱&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading">餐廳地址&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><div class="div_title input"><h5 class="media-heading input_n">訂位人姓名&emsp;</h5></div>
										</div>
										<div class="div_title"><div class="div_title input"><h5 class="media-heading input_p">訂位人電話&emsp;</h5></div> 
										</div>
									</div>
								</div>
							</td>
							<td>
							<Input type='hidden' name='book_date' id="r_sn${R.restaurant.r_sn}" value='${R.restaurant.r_sn}'>
							<div class="content"><h5>${R.restaurant.name}</h5></div>
							<div class="content"><h5>${R.restaurant.address}</h5></div>
							<div class="content"><h5><input class="form-control data" value="${R.cus_name}" id="cus_name${R.restaurant.r_sn}" onchange="changeinfo${R.restaurant.r_sn}()"></h5></div>
							<div class="content"><h5><input class="form-control data" value="${R.cus_phone}" id="cus_phone${R.restaurant.r_sn}" onchange="changeinfo${R.restaurant.r_sn}()"></h5></div>
							</td>
							<td class="col-sm-1 col-md-1" >
								<input type="date" name="book_date" id="theDate${R.restaurant.name}" class="form-control ${R.restaurant.r_sn}" onchange="changeinfo${R.restaurant.r_sn}()">
								<c:set var="booktime" value="${R.bookt_time}" />
								<c:set var="bd" value="${fn:substring(booktime, 0, 10)}" />
								<c:set var="bt" value="${fn:substring(booktime, 11, 16)}" />
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
						
						document.getElementById("theDate${R.restaurant.name}").value = "${bd}";
						document.getElementById("theDate${R.restaurant.name}").min = today;
					</script>
						<select id="sel${R.restaurant.name}" name="book_time" class="form-control time ${R.restaurant.r_sn}"  onchange="changeinfo${R.restaurant.r_sn}()">
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
						</select>
							</td>
						<script>
							console.log("time = " + "${bt}");
							switch ("${bt}"){
							case'11:00':
								document.getElementById("sel${R.restaurant.name}")[0].selected=true;
								break;
							case'12:00':
								document.getElementById("sel${R.restaurant.name}")[1].selected=true;
								break;
							case'13:00':
								document.getElementById("sel${R.restaurant.name}")[2].selected=true;
								break;
							case'14:00':
								document.getElementById("sel${R.restaurant.name}")[3].selected=true;
								break;
							case'17:00':
								document.getElementById("sel${R.restaurant.name}")[4].selected=true;
								break;
							case'18:00':
								document.getElementById("sel${R.restaurant.name}")[5].selected=true;
								break;
							case'19:00':
								document.getElementById("sel${R.restaurant.name}")[6].selected=true;
								break;
							case'20:00':
								document.getElementById("sel${R.restaurant.name}")[7].selected=true;
								break;
							}
							
						</script>
							<td class="col-sm-1 col-md-1 text-center">
							<select name="person_number" id="p_num${R.restaurant.name}" class="form-control p_num ${R.restaurant.r_sn}"  onchange="changeinfo${R.restaurant.r_sn}()">
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
						var num  =  ${R.customer_num};
						console.log("num = " + num);
						console.log("type" + typeof(num));
        				var opts=document.getElementById("p_num${R.restaurant.name}");
						console.log("num" + opts[num].value);
       					opts[num-1].selected=true;
   					</script>
   					<script>
   					function changeinfo${R.restaurant.r_sn}(){
						var sn = $("#r_sn${R.restaurant.r_sn}").val();
						var name = $("#cus_name${R.restaurant.r_sn}").val();
						var phone = $("#cus_phone${R.restaurant.r_sn}").val();
						var bd = $(".form-control.${R.restaurant.r_sn}").val();
						var bt = $(".form-control.time.${R.restaurant.r_sn}").val();
						var pnum = $(".form-control.p_num.${R.restaurant.r_sn}").val();
						console.log("sn = " + sn + ",name = " + name + ",phone = " + phone + ", bd = " + bd + ", bt = " + bt + ", pnum = " + pnum);
						
						$.ajax(
			                    {
			                        type: 'POST',
			                        data: { "r_sn":sn, "time":bt, "book_date":bd,"person_number":pnum ,"b_name":name, "b_phone":phone, "person_number": pnum},
			                        url: '${pageContext.servletContext.contextPath}/modifyOrderInfo',
			                        dataType: 'json',
			                        success:function(response){
				                        console.log(response);
			                        }
			                    }
			                )
   					}
   					</script>
							</td>
							<td class="col-sm-1 col-md-1">
								<h5 class="deposit">${R.deposit}</h5>
							</td>
							<td class="col-sm-1 col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span>下次再訂
								</button>
							</td>
						</tr>
						
					</c:forEach>
						

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h4>小計</h4></td>
							<td class="text-right">
							<h3 id="tPrice"><strong></strong></h3></td>
						</tr>
					</tbody>
				</table>
					<script type="text/javascript">
						var deposit = document.getElementsByClassName("deposit");
						console.log("deposit size = " + deposit.length);
						var size = 0;
						for(var i = 0; i < deposit.length; i++ ){
							size += parseInt(deposit[i].innerHTML);
							console.log("money = " + size);
							console.log("money = " + deposit[i].innerHTML);
							}
        				document.getElementById("tPrice").innerHTML = size;
        				
   					</script>
			</div>
		</div>
	</div>

<!-- 餐廳 END -->

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<h2>Transportation</h2>
						</tr>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<a class="thumbnail pull-left" href="#"> <img
										class="media-object"
										src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
										style="width: 72px; height: 72px;">
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#">Product name</a>
										</h4>
										<h5 class="media-heading">
											by <a href="#">Brand name</a>
										</h5>
										<span>Status: </span><span class="text-success"><strong>In
												Stock</strong></span>
									</div>
								</div>
							</td>
							<td class="col-sm-1 col-md-1" style="text-align: center"><input
								type="email" class="form-control" id="exampleInputEmail1"
								value="3"></td>
							<td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
							<td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
							<td class="col-sm-1 col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr>
						<tr>
							<td class="col-md-6">
								<div class="media">
									<a class="thumbnail pull-left" href="#"> <img
										class="media-object"
										src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
										style="width: 72px; height: 72px;">
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#">Product name</a>
										</h4>
										<h5 class="media-heading">
											by <a href="#">Brand name</a>
										</h5>
										<span>Status: </span><span class="text-warning"><strong>Leaves
												warehouse in 2 - 3 weeks</strong></span>
									</div>
								</div>
							</td>
							<td class="col-md-1" style="text-align: center"><input
								type="email" class="form-control" id="exampleInputEmail1"
								value="2"></td>
							<td class="col-md-1 text-center"><strong>$4.99</strong></td>
							<td class="col-md-1 text-center"><strong>$9.98</strong></td>
							<td class="col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>Subtotal</h3></td>
							<td class="text-right"><h3>
									<strong>$24.59</strong>
								</h3></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">

				<table class="table table-hover">
					<tbody>
						<tr>
							<td class="total"> </td>
							<td><h3>Total</h3></td>
							<td class="text-right"><h3>
									<strong>$31.53</strong>
								</h3></td>
						</tr>
</tbody>
				</table>
			</div>
		</div>
	</div>
	
		<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">

				<table class="table table-hover">
					<tbody>
						<tr>
							<td  class="total"> </td>
							<td></td>
							<td></td>
							<td>
							<form action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant_index">
								<button type="button" class="btn btn-primary">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									繼續逛
								</button>
							</form>
							</td>
							<td>
							<form action="<%=pageContext.getServletContext().getContextPath()%>/ShowOrderList" method="POST">
								<button type="submit" class="btn btn-success">
									我要結帳 <span class="glyphicon glyphicon-play"></span>
								</button>
							</form>
							</td>
							<td></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>
</body>
</html>