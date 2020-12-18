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
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />


<style>
.cart_area{
	margin:auto;
	margin-top:50px;
	width:1100px;
}
.form-control.time{
	width:100px;
	margin-top:10px;
}
.form-control.p_num{
	width:85px;
}
.col-sm-12.col-md-10.col-md-offset-1{
	width:1100px;
	margin-left: 100px;
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
h5{
	font-size:16px;
}
.form-control{
	font-size:16px;
}
#idsp{
	float:left; 
	color:red;
	font-size:13px;
	font-style:italic;
}
</style>

</head>
<body>
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 	
    
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <script>
    $(".nav-shop__circle").html('${cartnum}');
//     console.log($(".nav-shop__circle").val());
    console.log("nu = " + ${cartnum});
// 	   console.log("num");
    </script>
    <!-- background -->
    <div class="hero-wrap js-fullheight" style="background-image: url('direngine-master/images/shopping.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2">FUN x 臺灣</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">差一步，旅行即將開始</h1>
          </div>
        </div>
      </div>
    </div><!-- .background -->
<section class="cart_area"  id="index">

		<c:set var ="size" value= "${fn:length(OTBean.hotelOrder)}"></c:set>
		<c:if test = "${size > 0}" >
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<h2>訂飯店</h2>
						</tr>
						<tr>
							<th><h5>飯店資訊</h5></th>
							<th></th>
							<th><h5>預定日期</h5></th>
							<th></th>
							<th class="text-center"><h5>人數</h5></th>
							<th class="text-center"><h5>價格</h5></th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="h" items="${OTBean.hotelOrder}">
						<tr id="orderInfo${h.hotel.SN}">
							<td class="col-sm-8 col-md-6">
								<div class="div_title"><h5 class="media-heading">飯店名稱&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading">飯店地址&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><div class="div_title input"><h5 class="media-heading input_n">訂房人姓名&emsp;<span id="idsp">&nbsp;*必填</span><span id="idsp" class="n${h.hotel.SN}"></span></h5></div>
										</div>
										<div class="div_title"><div class="div_title input"><h5 class="media-heading input_p">訂房人電話&emsp;<span id="idsp">&nbsp;*必填<span id="idsp" class="p${h.hotel.SN}"></span></span></h5></div> 
										</div>
							</td>
							<td>
							<Input type='hidden' name='SN' id="SN${h.hotel.SN}" value='${h.hotel.SN}'>
							<div class="content"><h5>${h.hotel.NAME}</h5></div>
							<div class="content"><h5>${h.hotel.ADDRESS}</h5></div>
							<div class="content"><h5><input class="form-control data" value="${h.CLIENT_NAME}" id="client_name${h.hotel.SN}" onchange="changeinfo${h.hotel.SN}()"></h5></div>
							<div class="content"><h5><input class="form-control data phone" value="${h.CLIENT_PHONE}" id="client_phone${h.hotel.SN}" placeholder="09xxxxxxxx" onchange="changeinfo${h.hotel.SN}()"></h5></div>
							</td>
							<td class="col-sm-8 col-md-8">
							<div class="div_title"><h5>入住日期</h5></div>
							<div class="div_title"><h5>退房日期</h5></div>
							</td>
							<td>
							<input type="date" class="form-control" id="exampleInputEmail1" value="${h.CHECK_IN}">
							<input type="date" class="form-control" id="exampleInputEmail1" value="${h.CHECK_OUT}">
							</td>
							<td class="col-sm-1 col-md-1 text-center">
								<input id="guest_dec" type="button" value="-" onclick="dec1()">
   								<input id="guest" name="guest" type="text" value="${h.PROPLE_NUM}" size="1" style="text-align:center;" disabled="disabled">
    							<input id="guest_inc" type="button" value="+" onclick="inc1()">
    							<script type="text/javascript">
    					            var count = document.getElementById("guest");
    					            var inc = document.getElementById("guest_inc");
    					            var dec = document.getElementById("guest_dec");

    					            if(count.value = 1){
    					            	dec.removeAttr('onclick');
        					            }
    					            if(count.value > 35){
    					            	inc.removeAttr('onclick');
        					            }
    					            
    					            function inc1() {
     					        	   count.value = parseInt(count.value) + 1;
     					            };

     					           function dec1() {
    					            	count.value = parseInt(count.value) - 1;
    					            };

    					            
    					            console.log(count.value);
    					        
    							</script>
							</td>
							<td class="col-sm-1 col-md-1 ">
							<h5 class="hPRICE" id="hPRICE${h.hotel.SN}">${h.hPRICE}</h5>
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
							<td><h3>小計</h3></td>
							<td class="text-right">
								<h3 id="Hsum"><strong id="HPrice"></strong></h3>
								</td>
						</tr>

					</tbody>
				</table>
				<script type="text/javascript">
						var hPRICE = document.getElementsByClassName("hPRICE");
						console.log("deposit size = " + hPRICE.length);
						var size = 0;
						for(var i = 0; i < hPRICE.length; i++ ){
							size += parseInt(hPRICE[i].innerHTML);
							console.log("money = " + size);
							console.log("money = " + hPRICE[i].innerHTML);
							}
        				document.getElementById("HPrice").innerHTML = size;
        				
   					</script>
			</div>
		</div>
	</div>
</c:if>

<!-- 餐廳 start -->
		<c:set var ="size" value= "${fn:length(OTBean.r_Order_Lists)}"></c:set>
		<c:if test = "${size > 0}" >
		
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
						<tr id="orderInfo${R.restaurant.r_sn}">
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<div class="media-body">
										<div class="div_title"><h5 class="media-heading">餐廳名稱&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><h5 class="media-heading">餐廳地址&emsp;&emsp;&emsp;</h5></div>
										<div class="div_title"><div class="div_title input"><h5 class="media-heading input_n">訂位人姓名&emsp;<span id="idsp">&nbsp;*必填</span><span id="idsp" class="n${R.restaurant.r_sn}"></span></h5></div>
										</div>
										<div class="div_title"><div class="div_title input"><h5 class="media-heading input_p">訂位人電話&emsp;<span id="idsp">&nbsp;*必填<span id="idsp" class="p${R.restaurant.r_sn}"></span></span></h5></div> 
										</div>
									</div>
								</div>
							</td>
							<td>
							<Input type='hidden' name='r_sn' id="r_sn${R.restaurant.r_sn}" value='${R.restaurant.r_sn}'>
							<Input type='hidden' name='price' id="price${R.restaurant.r_sn}" value='${R.restaurant.price}'>
							<div class="content"><h5>${R.restaurant.name}</h5></div>
							<div class="content"><h5>${R.restaurant.address}</h5></div>
							<div class="content"><h5><input class="form-control data" value="${R.cus_name}" id="cus_name${R.restaurant.r_sn}" onchange="changeinfo${R.restaurant.r_sn}()"></h5></div>
							<div class="content"><h5><input class="form-control data phone" value="${R.cus_phone}" id="cus_phone${R.restaurant.r_sn}" placeholder="09xxxxxxxx" onchange="changeinfo${R.restaurant.r_sn}()"></h5></div>
							</td>
							<td class="col-sm-1 col-md-1" >
								<input type="date" name="book_date" id="theDate${R.restaurant.name}" class="form-control ${R.restaurant.r_sn}" onchange="changeinfo${R.restaurant.r_sn}(), tableck${R.restaurant.r_sn}()">
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
						if (day < 9){
							console.log("d = " + typeof(day));
							day = day + 1;
							day = "0" + day;
						}else{day = day + 1;}

						var today = year + "-" + month + "-" + day;
						
						document.getElementById("theDate${R.restaurant.name}").value = "${bd}";
						document.getElementById("theDate${R.restaurant.name}").min = today;
					</script>
						<select id="sel${R.restaurant.name}" name="book_time" class="form-control time ${R.restaurant.r_sn}"  onchange="changeinfo${R.restaurant.r_sn}(), tableck${R.restaurant.r_sn}()">
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
							<select name="person_number" id="p_num${R.restaurant.name}" class="form-control p_num ${R.restaurant.r_sn}"  onchange="changeinfo${R.restaurant.r_sn}(), totalprice()">
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
   					
							</td>
							<td class="col-sm-1 col-md-1">
								<h5 class="deposit" id="deposit${R.restaurant.r_sn}">${R.deposit}</h5>
							</td>
							<td class="col-sm-1 col-md-1">
								<button type="button" class="btn btn-danger" onclick="remove${R.restaurant.r_sn}(), totalprice(), sumprice()">
									<span class="glyphicon glyphicon-remove"></span>移除
								</button>
							</td>
							
						</tr>
						<!-- 修改訂位者資料 & 檢查桌數-->
						<script>
   						function changeinfo${R.restaurant.r_sn}(){
						var sn = $("#r_sn${R.restaurant.r_sn}").val();
						var name = $("#cus_name${R.restaurant.r_sn}").val();
						if(name == ""){
							$(".n${R.restaurant.r_sn}").html("&nbsp;請輸入姓名");
						}else {
							$(".n${R.restaurant.r_sn}").html("");
							}
						var phone = $("#cus_phone${R.restaurant.r_sn}").val();
						if(phone == ""){
							$(".p${R.restaurant.r_sn}").html("&nbsp;請輸入手機號碼");
						}else if(!phone.match(/^09[0-9]{8}$/)){
							$(".p${R.restaurant.r_sn}").html("&nbsp;手機號碼格式有誤");
						}else{
							$(".p${R.restaurant.r_sn}").html("");
						}
						var bd = $(".form-control.${R.restaurant.r_sn}").val();
						var bt = $(".form-control.time.${R.restaurant.r_sn}").val();
						var pnum = $(".form-control.p_num.${R.restaurant.r_sn}").val();
						var price = $("#price${R.restaurant.r_sn}").val();
						console.log("p = " + price);
						price = parseInt(pnum) * parseInt(price);
						console.log("price = " + price);
						$("#deposit${R.restaurant.r_sn}").html(price);
						console.log("sn = " + sn + ",name = " + name + ",phone = " + phone + ", bd = " + bd + ", bt = " + bt + ", pnum = " + pnum);
						if(name != "" && phone != "" && (!$("#cus_phone${R.restaurant.r_sn}").val().match(/^09[0-9]{8}$/)) == false){
						$.ajax(
			                    {
			                        type: 'POST',
			                        data: { "r_sn":sn, "time":bt, "book_date":bd,"person_number":pnum ,"b_name":name, "b_phone":phone, "person_number": pnum},
			                        url: '${pageContext.servletContext.contextPath}/modifyOrderInfo',
			                        dataType: 'json',
			                        success:function(response){
				                        console.log(response);
				                        $("#sumPrice").html(response);
			                        }
			                    }
			                )
						}
   					}
						//檢查桌數是否已滿
   						function tableck${R.restaurant.r_sn}(){
   	   	   					var bd = $(".form-control.${R.restaurant.r_sn}").val();
   							var bt = $(".form-control.time.${R.restaurant.r_sn}").val();
   							$.ajax(
   				                    {
   				                        type: 'GET',
   				                        data: { "book_date":bd,"time":bt },
   				                        url: '${pageContext.servletContext.contextPath}/checkTable',
   				                        dataType: 'html',
   				                        success:function(response){
   				                        	console.log("r = " + response);
   				                           if(response == "false"){
   					                           console.log("in r = " + response);
   				                        	   var res_context = "";
   					                        	res_context += '<button type="button" class="btn btn-primary" id="tableckbtn" data-toggle="modal" data-target="#tableresponse" style="display:none;"></button>';
   					                        	$("#Rsum").html(res_context);
   					                        	$("#tableckbtn").click();
   				                        	   
   					                        }
   				                        }
   				                    }
   				                )
   	   	   	   					}
   	   					
   					</script>
   					
   								<!-- Modal -->
									<div class="modal fade" id="tableresponse" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  									<div class="modal-dialog modal-dialog-centered" role="document">
    									<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title" id="exampleModalLongTitle">Fun X Taiwan</h5>
        									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        									</button>
      									</div>
      									<div class="modal-body">
       									抱歉 !   訂位已滿，請重新選擇日期及時段
      									</div>
      									<div class="modal-footer">
									<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
        									<button type="button" data-dismiss="modal" class="btn btn-primary">確認</button>
      									</div>
    									</div>
  									</div>
									</div><!-- .Modal -->
						<script>
							function remove${R.restaurant.r_sn}(){
								var sn = $("#r_sn${R.restaurant.r_sn}").val();
								$.ajax(
					                    {
					                        type: 'POST',
					                        data: { "r_sn":sn},
					                        url: '${pageContext.servletContext.contextPath}/removeInfo',
					                        dataType: 'json',
					                        success:function(response){
						                        console.log(response);
					                        }
					                    }
					                )
					            $(".nav-shop__circle").html('${cartnum}'-1);
					            $("#orderInfo${R.restaurant.r_sn}").remove();    
								}
						</script>
						<script type="text/javascript">
						function totalprice(){
							console.log("in total")
						var deposit = document.getElementsByClassName("deposit");
						console.log("deposit size = " + deposit.length);
						var size = 0;
						for(var i = 0; i < deposit.length; i++ ){
							size += parseInt(deposit[i].innerHTML);
							console.log("money = " + size);
							console.log("money = " + deposit[i].innerHTML);
							}
        				document.getElementById("tPrice").innerHTML = size;
						}
        				
   						</script>
						
					</c:forEach>
						

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h4>小計</h4></td>
							<td class="text-right">
							<h3 id="Rsum"><strong id="tPrice"></strong></h3></td>
							<td> </td>
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
</c:if>
<!-- 餐廳 END -->


<!-- 交通 -->
<c:set var ="size" value= "${fn:length(OTBean.t_Order_Lists)}"></c:set>
<c:if test = "${size > 0}" >

	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<h2>訂交通</h2>
						</tr>
						<tr>
							<th>交通資訊</th>
							<th>高鐵車次</th>
							<th class="text-center">張數</th>
							<th class="text-center">價格</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="T" items="${OTBean.t_Order_Lists}">
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									
									<div class="media-body">
										<h4 class="media-heading">車次${T.highSpeedRail.idHSR}</h4>
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
									<span class="glyphicon glyphicon-remove"></span> 移除
								</button>
							</td>
						</tr>

						</c:forEach>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>小計</h3></td>
							<td class="text-right"><h3>
									<strong></strong>
								</h3></td>
						</tr>
					</tbody>
				</table>
					
			</div>
		</div>
	</div>
</c:if>

<!-- 交通 -->



	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">

				<table class="table table-hover">
					<tbody>
						<tr>
							<td class="total"> </td>
							<td><h3>總金額</h3></td>
							<td class="text-right"><h2>
									<strong id="sumPrice">${OTBean.totalPrice}</strong>
								</h2></td>
						</tr>
						
					</tbody>
				</table>
				<!-- 總金額 -->
<!-- 					<script > -->
					
<!-- 					function sumprice(){ -->
<!-- 						var Rsum = $("#tPrice").val(); -->
<!-- 						var Hsum = $("#HPrice").val(); -->
<!-- 						console.log("R = " + Rsum) -->
<!-- 						console.log("H = " + Hsum) -->
						
<!-- // 						console.log("sum = " + TotalSum); -->
<!-- // 						document.getElementById("sumPrice").innerHTML = TotalSum; -->
<!-- 					} -->
<!-- 					</script>  -->
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
							<form action="<%=pageContext.getServletContext().getContextPath()%>/FunTaiwan">
								<button type="submit" class="btn btn-primary">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									繼續逛
								</button>
							</form>
							</td>
							<td>
							
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="" id="check" onclick="checkbtn()">
							  我要結帳</button>
							  <!-- 判斷資料是否全部有填寫 -->
							  <script type="text/javascript">
							  function checkbtn(){
									var totaldata = document.getElementsByClassName("form-control data");
									var totalphone = document.getElementsByClassName("form-control data phone");
									console.log("otaldata =" + totaldata.length);
									var flag = true;
									for(var j = 0; j < totaldata.length; j++){
										console.log("value=" + totaldata[j].value);
											if(totaldata[j].value == ""){
												console.log("empty");
												document.getElementById("check").setAttribute("data-target", "#checkagain");	
												document.getElementById("check").setAttribute("type","button");							
											flag = false;
											}
										}
									for(var z = 0; z < totalphone.length; z++){
										var p = totalphone[z].value;
										var pattern = /^09[0-9]{8}$/;
										console.log("phone = " + totalphone[z].value);
										var p_result = pattern.test(p);
										if(p_result == false){
											document.getElementById("check").setAttribute("data-target", "#checkagain");	
											document.getElementById("check").setAttribute("type","button");
											flag = false;	
											}
										}
									if(flag == true){
										document.getElementById("check").setAttribute("data-target", "#exampleModalCenter");	
										document.getElementById("check").setAttribute("type","button");					
									}
								  }
							  </script>

							<!-- Modal -->
							<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  							<div class="modal-dialog modal-dialog-centered" role="document">
    							<div class="modal-content">
      							<div class="modal-header">
        							<h5 class="modal-title" id="exampleModalLongTitle">結帳提醒</h5>
        							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        							</button>
      								</div>
      							<div class="modal-body">
        							請務必確認訂單資訊是否填寫正確
      							</div>
      							<div class="modal-footer">
        						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
        						<form action="<%=pageContext.getServletContext().getContextPath()%>/ShowOrderList" method="POST">
        							<button type="submit" class="btn btn-info">確認</button>
        						</form>
      							</div>
    							</div>
  							</div>
							</div><!-- .Button trigger modal -->
							
							<!-- Modal -->
							<div class="modal fade" id="checkagain" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  							<div class="modal-dialog modal-dialog-centered" role="document">
    							<div class="modal-content">
      							<div class="modal-header">
        							<h5 class="modal-title" id="exampleModalLongTitle">結帳提醒</h5>
        							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          							<span aria-hidden="true">&times;</span>
        							</button>
      								</div>
      							<div class="modal-body">
        							資料不齊全，請確認後再送出!
      							</div>
      							<div class="modal-footer">
      							<button type="button" class="btn btn-info" data-dismiss="modal">確定</button>
    							</div>
    							</div>
  							</div>
							</div><!-- .Button trigger modal -->
							
							</td>
							<td></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

    <script>
      $(document).ready(function(){
      $('body,html').delay(1000).animate({scrollTop: $("#index").offset().top - 160}, 600); 
      });

    </script>
  <!-- footer -->
     <c:import url="/WEB-INF/admin/fragment/footer.jsp"/> 

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>    
    
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
</body>
</html>