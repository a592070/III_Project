<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>

<style type="text/css">
.total{
	width:740px;
}

.form-control.time{
	width:100px;
}
.form-control.p_num{
	width:100px;
}
.media-heading.input_n{
	float:left;
}
.media-heading.input_p{
	float:left;
}
input{
	clear:both;
}
.div_title{
	padding-bottom: 10px;
}

</style>

</head>
<body>

	<link
		href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->



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
							<th>餐廳資訊</th>
							<th>訂位日期</th>
							<th>訂位時間</th>
							<th class="text-center">訂位人數</th>
							<th class="text-center">價格</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="R" items="${OTBean.r_Order_Lists}">
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<div class="media-body">
										<div class="div_title"><h4 class="media-heading">餐廳名稱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${R.restaurant.name}</h4></div>
										<div class="div_title"><h4 class="media-heading">餐廳地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${R.restaurant.address}</h4></div>
										<div class="div_title"><h4 class="media-heading input_n">訂位人姓名&nbsp;&nbsp;</h4> <input value="${R.cus_name}"></div>
										<div class="div_title"><h4 class="media-heading input_p">訂位人電話&nbsp;&nbsp;</h4> <input value="${R.cus_phone}"></div>
									</div>
								</div>
							</td>
							<td class="col-sm-1 col-md-1" >
								<input type="date" name="book_date" id="theDate" >
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
						
						document.getElementById("theDate").value = "${bd}";
						document.getElementById("theDate").min = today;
					</script>
							</td>
							<td class="col-sm-1 col-md-1 text-center time">
							<select id=sel name="book_time" class="form-control time">
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
							console.log("time = " + "${bt}");
							switch ("${bt}"){
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
							</td>
							<td class="col-sm-1 col-md-1 text-center">
							<select name="person_number" id="p_num" class="form-control p_num">
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
        				var opts=document.getElementById("p_num");
						console.log("num" + opts[num].value);
       					opts[num-1].selected=true;
       					var price = ${R.deposit};
       					console.log("price = " + price);
   					</script>
							</td>
							<td class="col-sm-1 col-md-1">
								<h5 id="deposit">&nbsp;&nbsp;&nbsp;&nbsp;${R.deposit}</h5>
							</td>
							<td class="col-sm-1 col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr>
					</c:forEach>
						

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>小計</h3></td>
							<td class="text-right">
							<h3 id="tPrice"><strong>$24.59</strong></h3></td>
						</tr>
					</tbody>
				</table>
					<script type="text/javascript">
						var deposit = document.getElementById("deposit");
// 						var size  =  ${size}.legnth;
// 						console.log("size = " + size);
        				size = 500;
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
							<td>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									Continue Shopping
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-success">
									Checkout <span class="glyphicon glyphicon-play"></span>
								</button>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>