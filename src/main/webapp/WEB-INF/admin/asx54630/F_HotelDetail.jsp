<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
<!--     css -->
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--     css -->

<style>

body{
	margin:0px;
	padding:0px;
	background:url('https://i.imgur.com/6DuGxHp.jpg') center center fixed no-repeat;
	background-size: cover;　
} 
.box{
 	background:white; 
	margin:120px 120px;
}
.bg-dark {
     background-color: transparent !important; 
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
    <!-- Start nav -->    
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />

<div class="box">

    <!-- Offcanvas Menu Section Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="canvas-open">
        <i class="icon_menu"></i>
    </div>
    <div class="offcanvas-menu-wrapper">
        <div class="canvas-close">
            <i class="icon_close"></i>
        </div>
        <div class="search-icon search-switch">
            <i class="icon_search"></i>
        </div>
 
        </div>
       
        <div id="mobile-menu-wrap"></div>

    
    <!-- Offcanvas Menu Section End -->


    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>${hoteldetail.NAME}</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Room Details Section Begin -->
    <section class="room-details-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="room-details-item">
                        <img src="https://i.imgur.com/D690ggE.jpg" alt="">
                        <div class="rd-text">
                            <div class="rd-title">
                                <h3>${hoteldetail.NAME}</h3>
                                <div class="rdt-right">
                                    <div class="rating" id="rating">
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star-half_alt"></i> -->
                                        <span>${hoteldetail.RATING}</span>
                                      <script>
										var star = Math.floor("${hoteldetail.RATING}");
										console.log("star = " + star);
										var tags = "";
// 										var half = " <i class='icon_star-half_alt'></i>";
										var zerostar = "";
										for(var i = 0; i < star; i++){
											tags += " <i class='icon_star'></i>";
											}
										for(var j = star ; j < 5 ; j++){
											zerostar += " <i class='fa fa-star-o'></i>";
											}
										$("#rating").prepend(tags, zerostar);
										</script>
                                    </div>
                                    <a href="#">Booking Now</a>
                                </div>
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">地址:</td>
                                        <td>${hoteldetail.ADDRESS}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">電話:</td>
                                        <td>${hoteldetail.TEL}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">雙人房價格:</td>
                                        <td>${hoteldetail.DOUBLE_ROOM}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">四人房價格:</td>
                                        <td>${hoteldetail.QUADRUPLE_ROOM}</td>
                                    </tr>
 
                                    <tr>
                                        <td class="r-o">類型:</td>
                                        <td>${hoteldetail.TYPE}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <p class="f-para">${hoteldetail.DESCRIPTION}</p>
							 <div class="f-para">
                            <iframe width="100%" height="300" frameborder="0" src="https://www.google.com/maps?q=${hoteldetail.ADDRESS}&mrt=all&hl=zh-TW&z=15&output=embed ">
                			</iframe></div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-4">
                    <div class="room-booking">
                        <h3>立即預訂</h3>
                        <form class="HBooking" action="<%=pageContext.getServletContext().getContextPath()%>/HotelOrder" method="POST">
                        	 <input type="hidden" id="H_SN" value="${hoteldetail.SN}">
                            <div class="check-date">
                                <label for="date-in">入住日期:</label>
                                <input type="date" class="date-input hasDatepicker" id="date_in" name="date_in" onchange="checkin()">
<!--                                 <i class="icon_calendar"></i> -->
                                <script>
                                var book = "${date_in}";
        						console.log(book);
        						console.log(typeof(book));
        						document.getElementById("date_in").value = book;
        						
        						var date = new Date();

        						var day = date.getDate();
        						var month = date.getMonth() + 1;
        						var year = date.getFullYear();

        						if (month < 10)
        							month = "0" + month;
        						if (day < 10)
        							day = "0" + day;

        						var today = year + "-" + month + "-" + day;
        						document.getElementById("date_in").min = today;
        						document.getElementById("date_in").value = today;
        						
        						function rclick(){
        							var date_in = document.getElementById("date_in").value
        							console.log(date_in);
        							}
								</script>

                            </div>
                            <div class="check-date">
                                <label for="date-out">退房日期:</label>
                                <input type="date" class="date-input hasDatepicker" id="date_out" name="date_out">
<!--                                 <i class="icon_calendar"></i> -->
 								<script>
                                var book = "${date_out}";
        						console.log(book);
        						console.log(typeof(book));
        						document.getElementById("date_out").value = book;
        						
        						var day = new Date();
        						var month = date.getMonth() + 1;
        						var year = date.getFullYear();

        						if (month < 10)
        							month = "0" + month;
        						if (day < 10)
        							day = "0" + day;
									
        						var inittoday = year + "-" + month + "-" + day;
        						document.getElementById("date_out").min = inittoday;
        						document.getElementById("date_out").value = inittoday;
        						
        						
        						function checkin(){
        							var today = document.getElementById("date_in").value; 
        							document.getElementById("date_out").min = today;
        							document.getElementById("date_out").value = today;
        							console.log(date_out);
									}
								
//         						var today = document.getElementById("date_in").value;
        						function rclick(){
        							var theDate = document.getElementById("date_out").value
        							console.log(theDate);
        							}
								</script>
                            </div>
                            <div class="select-option">
                                <label for="guest">人數:</label>
								<input id="guest_dec" type="button" value="-">
   								<input id="guest" type="text" value="1" size="1" style="text-align:center;" disabled="disabled">
    							<input id="guest_inc" type="button" value="+">
    							<script type="text/javascript">
    					            var count = document.getElementById("guest");
    					            var inc = document.getElementById("guest_inc");
    					            var dec = document.getElementById("guest_dec");
    					            inc.onclick = function() {
    					        	   count.value = parseInt(count.value) + 1;
    					            };
    					            dec.onclick = function() {
    					            	count.value = parseInt(count.value) - 1;
    					            };
    					            console.log(count.value);
    					        
    							</script>
                            </div>
                            <div class="select-option">
                                <label for="dbroom">雙人房:</label><span id="nameDB">&nbsp;</span>
                                <select id="dbroom" class="form-control">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                </select>
                            </div>
                            <div class="select-option">
                                <label for="qdroom">四人房:</label>
                                <select id="qdroom" class="form-control">
									<option value="0">0</option>
									<option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                </select>
                            </div>
                            
                            <div class="select-option">
                                <label for="client_name">姓名:</label><span id="idsp">&nbsp;*必填</span><span id="nameCk">&nbsp;</span>
                                <input type="text" name="client_name" id="client_name">
                            </div>
                            <div class="select-option">
                                <label for="client_phone">電話:</label><span id="idsp">&nbsp;*必填</span><span id="phoneCK">&nbsp;</span>
                                <input type="text" name="client_name" id="client_phone">
                            </div>                            
                            <button type="button" id="order" >我要訂房</button>
                            <script>
                            var item = 0;
								$("#order").click(function(){
									var H_SN = $("#H_SN").val();
									var date_in = $("#date_in").val();
									var date_out = $("#date_out").val();
									var guest = $("#guest").val();
									var dbroom = $("#dbroom").val();
									var qdroom = $("#qdroom").val();
									var client_name = $("#client_name").val();
									var client_phone = $("#client_phone").val();
									console.log(H_SN);
									console.log(date_in);
									console.log(date_out);
									console.log(guest);
									console.log(dbroom);
									console.log(qdroom);
									console.log(client_name);
									console.log(client_phone);
									if($("#client_name").val() == ""){
										$("#nameCk").html("&nbsp;<font color='red' id='idsp'>&nbsp;請輸入訂位者姓名</font>");
									}else{
										$("#nameCk").html("");
										}
									if($("#client_phone").val() == ""){
										$("#phoneCK").html("&nbsp;<font color='red' id='idsp'>&nbsp;請輸入手機號碼</font>");
									}else if(!$("#client_phone").val().match(/^09[0-9]{8}$/)){
										$("#phoneCK").html("&nbsp;<font color='red' id='idsp'>&nbsp;手機號碼格式不正確！</font>");
									}else {
										$("#phoneCK").html("");
									}
									if($("#dbroom").val() == "0" && $("#qdroom").val() == "0"){
										$("#nameDB").html("&nbsp;<font color='red' id='nameDB'>&nbsp;請至少選擇一種房型</font>");
									}else{
										$("#nameDB").html("");
										}
								
									console.log("t or f = " + (!$("#client_phone").val().match(/^09[0-9]{8}$/)))
									if(client_name != "" && client_phone != "" && (!$("#client_phone").val().match(/^09[0-9]{8}$/)) == false && date_out != ""){
										$.ajax(
							                    {
							                        type: 'POST',
							                        data: { "H_SN":H_SN, "date_in":date_in, "date_out":date_out},
							                        url: '${pageContext.servletContext.contextPath}/CheckOrderDate',
							                        dataType: 'html',
							                        success:function(response){
							                        	console.log("h = " + response);
							                           if(response == "false"){
								                           console.log("in h = " + response);
							                        	   var hotel_context = "";
							                        	   hotel_context += '<button type="button" class="btn btn-primary" id="tableckbtn" data-toggle="modal" data-target="#tableresponse" style="display:none;"></button>';
								                        	$("#rating").html(hotel_context);
								                        	$("#tableckbtn").click();
							                        	   
								                        }else{
								                        	$.ajax(
												                    {
												                        type: 'POST',
												                        data: {"H_SN":H_SN, "dbroom":dbroom, "qdroom":qdroom },
												                        url: '${pageContext.servletContext.contextPath}/CheckOrderRoom',
												                        dataType: 'html',
												                        success:function(response){
												                        	console.log("r = " + response);
												                           if(response == "false"){
													                           console.log("in r = " + response);
												                        	   var hotel_context = "";
												                        	   hotel_context += '<button type="button" class="btn btn-primary" id="tableckbtn" data-toggle="modal" data-target="#tableresponse" style="display:none;"></button>';
													                        	$("#rating").html(hotel_context);
													                        	$("#tableckbtn").click();
												                        	   
													                        }else{
													                        	   $(".HBooking").submit();
														                    }
												                        }
												                    }
												                )
									                    }
							                        }
							                    }
							                )
										
									}
									})
									
                            </script>
                        </form>
                        
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
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Room Details Section End -->
   </div>                 	
</body>
                     <c:import url="/WEB-INF/admin/fragment/footer.jsp" />
</html>