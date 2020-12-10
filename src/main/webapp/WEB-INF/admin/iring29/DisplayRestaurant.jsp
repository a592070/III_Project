<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找餐廳</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
    
<style>
* {
	margin: 0;
	padding: 0;
}

body{
	margin:0px;
	padding:0px;
	background:url('direngine-master/images/AsianFood.jpg') center center fixed no-repeat;
	background-size: cover;　
}    
.box{
 	background:white; 
	margin:120px 120px;
}
img{
	width:700px;
}
.i{
	width:30px;
}
.room-details-item{
	padding-left:50px;
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.bg-dark {
     background-color: transparent !important; 
}
#b-name, #b-phone{
	width:290px;
	height:52px;
}

.room-booking form button {
    color: #ffffff;
    background: #dfa974;
}
#idsp{
	float:left; 
	color:red;
	font-size:13px;
	font-style:italic;
}

element.style {
}
.rd-reviews,.review-add {
	margin-left: 50px;
}
</style>
</head>
<body>
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 
    <!-- Start nav -->    
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <script>
    	$(".nav-shop__circle").html('${cartnum}');
    	console.log("nu = " + ${cartnum});
    </script>
<div class="box">
<!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>${res_data.name}</h2>
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
                        <img src="<%=application.getContextPath()%>/ShowRPic" alt="">
                        <div class="rd-text">
                            <div class="rd-title">
                                <h3>${res_data.name}</h3>
                                <div class="rdt-right">
                                    <div class="rating" id="rating">
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star"></i> -->
<!--                                         <i class="icon_star-half_alt"></i> -->
                                        <span>${res_data.rating}</span>
                                      <script>
										var star = Math.floor("${res_data.rating}");
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
<%--                                     <form id="shop_cart" action="<%=pageContext.getServletContext().getContextPath()%>/PrepareOrder" method="POST"> --%>
<!--                                     	<a href="javascript:document.getElementById('shop_cart').submit();">放入購物車</a> -->
<!--                                     	<Input type='hidden' name='time' value='11:00'> -->
<%--                                     	<Input type='hidden' name='book_date' value='${book_date}'> --%>
<!--                                     	<Input type='hidden' name='b_name' value=''> -->
<!--                                     	<Input type='hidden' name='b_phone' value=''> -->
<%--                                     	<Input type='hidden' name='person_number' value='${person_number}'> --%>
<!--                                     </form> -->
									<a href="javascript:void();" id="addCart" class="review-add ra-form button">放入購物車</a>
									<script>
										$("#addCart").on('click',function(){
											$.ajax(
								                    {
								                        type: 'POST',
								                        data: { },
								                        url: '${pageContext.servletContext.contextPath}/checkLogin',
								                        dataType: 'json',
								                        success:function(response){
									                        console.log("re = " + response);
									                        if(response == true){
									                        	var thedate = $("#theDate").val();
																var thetime = $("#sel").val();
																var num = $("#p_num").val();
																var name = $("#b-name").val();
																var phone = $("#b-phone").val();
																console.log("resule =" + thedate, thetime, num, name, phone);
//									                        	檢查桌數
																$.ajax(
													                    {
													                        type: 'GET',
													                        data: { "book_date":thedate,"time":thetime },
													                        url: '${pageContext.servletContext.contextPath}/checkTable',
													                        dataType: 'html',
													                        success:function(response){
													                        	console.log("r = " + response);
													                           if(response == "false"){
														                           console.log("in r = " + response);
													                        	   var res_context = "";
														                        	res_context += '<button type="button" class="btn btn-primary" id="tableckbtn" data-toggle="modal" data-target="#tableresponse" style="display:none;"></button>';
														                        	$("#rating").html(res_context);
														                        	$("#tableckbtn").click();
													                        	   
														                        }else{
																				//加入購物車
														                        	$.ajax(
																		                    {
																		                        type: 'POST',
																		                        data: { "time":thetime, "book_date":thedate, "b_name":name,"b_phone":phone ,"person_number": num},
																		                        url: '${pageContext.servletContext.contextPath}/addOrder',
																		                        dataType: 'html',
																		                        success:function(response){
																			                        console.log("re = " + response);
																		                        	var res_context = "";
																		                        	res_context += '<button type="button" class="btn btn-primary" id="modalbtn" data-toggle="modal" data-target="#exampleModalCenter" style="display:none;"></button>';
																		                        	$("#rating").html(res_context);
																		                        	$("#modalbtn").click();
																		                        	$(".nav-shop__circle").html(response);
																		                        }
																		                    }
																		                )
														                        	   
															                    }
													                        }
													                    }
													                )
								                        		
									                        }else if(response == false){
									                        	var res_context = "";
									                        	res_context += '<button type="button" class="btn btn-primary" id="commentbtn" data-toggle="modal" data-target="#loginbtn" style="display:none;"></button>';
								                        		$("#comment_rating").append(res_context);
								                        		$("#commentbtn").click();
										                    }
								                        }
								                    }
								                )
											
											
											
										});
									</script>
									<!-- Modal -->
									<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  									<div class="modal-dialog modal-dialog-centered" role="document">
    									<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title" id="exampleModalLongTitle">Fun X Taiwan</h5>
        									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        									</button>
      									</div>
      									<div class="modal-body">
       									 已成功加入購物車 !          
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
<!--                             <h2>159$<span>/Pernight</span></h2> -->
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">地址</td>
                                        <td>${res_data.address}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">交通方式</td>
                                        <td><pre>${res_data.transportation}</pre></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">適合聚餐類型</td>
                                        <td>${res_data.serviceinfo}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">料理種類</td>
                                        <td>${res_data.type}</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">營業時間</td>
                                        <td><pre>${res_data.opentime}</pre></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div>${res_data.description}</div>
                            <br>
                            <br>
                            <div class="f-para">
                            <iframe width="100%" height="300" frameborder="0" src="https://www.google.com/maps?q=${res_data.address}&mrt=all&hl=zh-TW&z=15&output=embed ">
                			</iframe></div>
                            
                        </div>
                    </div>
                    <div class="rd-reviews">
                        <h4>評論</h4>
                        <!-- review -->
                        <div id="reviews">
                        <c:forEach var="comm" items="${comment}" >
                        <div class="review-item" id="${comm.com_id}">
                            <div class="ri-pic">
                                <img src="https://img.icons8.com/pastel-glyph/2x/person-male.png" alt="">
                            </div>
                            <div class="ri-text">
                                <span>${comm.com_dateString}</span>
                                <div class="rating" id="commrating${comm.com_id}">
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star-half_alt"></i> -->
                                </div>
                                <h5>${comm.username}</h5>
                                <p>${comm.com_content}</p>
                                <script>
										var commstar = Math.floor("${comm.rating}");
										console.log("star = " + commstar);
										var commtags = "";
// 										var half = " <i class='icon_star-half_alt'></i>";
										var commzerostar = "";
										for(var i = 0; i < commstar; i++){
											commtags += " <i class='icon_star'></i>";
											}
										for(var j = commstar ; j < 5 ; j++){
											commzerostar += " <i class='fa fa-star-o'></i>";
											}
										$("#commrating${comm.com_id}").prepend(commtags, commzerostar);
                                </script>
                            </div>
                        </div>
                        </c:forEach>
                        </div>
                        <!-- .review -->
                    </div>
                        
                    <div class="review-add" id="review-add">
                        <h4>歡迎寫下您的評論</h4>
<!--                         <form  class="ra-form"> -->
                            <div class="ra-form">
                            <div class="row">
                                <div class="col-lg-6">
<!--                                     <input type="text" placeholder="Name*"> -->
                                </div>
                                <div class="col-lg-6">
<!--                                     <input type="text" placeholder="Email*"> -->
                                </div>
                                <div class="col-lg-12">
                                    <div id="leavecomm">
                                        <h5 id="comment_rating">您的評分</h5>
                                        <div class="rating">
<!--                                             <i class="icon_star"></i> -->
                                             <i id="starRating" class='fa fa-star-o'></i>
                                             <i id="starRating" class='fa fa-star-o'></i>
                                             <i id="starRating" class='fa fa-star-o'></i>
                                             <i id="starRating" class='fa fa-star-o'></i>
                                             <i id="starRating" class='fa fa-star-o'></i>
                                             <Input type='hidden' name='stars' id= 'stars' value=''>
                                        </div>
                                    </div>
                                             <span id="starcomm"></span>
                                         <script>
                                             var start = 0;
                                         $("i#starRating").on("mouseenter", function () {
                                             start = 0;
                                             console.log("size = " + $("i#starRating").size())
                                             $("i#starRating").attr("class", "fa fa-star-o")
                                             let num = $("i#starRating").index($(this)) + 1;
                                             console.log(num);
                                             for (let i = 0; i < num; i++) {
                                                 $("i#starRating").eq(i).attr("class", "icon_star")
                                             }
                                         }).mouseout(function () {
                                             if (start == 0) {
                                                 $("i#starRating").attr("class", "fa fa-star-o")
                                             }
                                         }).click(function () {
                                             start = 1;
                                             let clicknum = $("i#starRating").index($(this)) + 1;
                                             console.log("num" + clicknum);
                                             for (let i = 0; i < num; i++) {
                                                 $("i#starRating").eq(i).attr("class", "icon_star")
                                             }
                                             $("#stars").val(clicknum);
                                         })
                                         
                                         </script>
                                         <span id="com_msg"></span>
                                    <textarea placeholder="寫下您對於此餐廳的評論" id="r_comment"></textarea>
                                    <button type="button" id="commbtn" onclick="sendcomment()">送出</button>
                                    <!-- add comment -->
                                    <script>
										function sendcomment(){
											var comment = $("#r_comment").val();
											var stars = $("#stars").val();
											console.log("comment = " + comment + ", stars = " + stars );
											if($("#stars").val() == ""){
												$("#starcomm").html("&nbsp;<font color='red' id='idsp'>&nbsp;評分不可為零</font>");
											}else{
												$("#starcomm").html("");
												}
											if($("#r_comment").val() == ""){
												$("#com_msg").html("&nbsp;<font color='red' id='idsp'>&nbsp;留言不可為空白</font>");
											}else{
												$("#com_msg").html("");
												}
											if($("#r_comment").val() != "" && $("#stars").val() != ""){
											//檢查是否登入
											$.ajax(
								                    {
								                        type: 'POST',
								                        data: { },
								                        url: '${pageContext.servletContext.contextPath}/checkLogin',
								                        dataType: 'json',
								                        success:function(response){
									                        console.log("re = " + response);
									                        if(response == true){
									                        	//是否重複登入 & 可登入
									                        	$.ajax(
													                    {
													                        type: 'POST',
													                        data: {"com_content":comment, "rating":stars},
													                        url: '${pageContext.servletContext.contextPath}/addComment',
													                        dataType: 'json',
													                        success:function(comm){
														                        if(comm == true){
														                        	console.log("dup = " + comm)
													                        		var res_context = "";
												                        			res_context += '<button type="button" class="btn btn-primary" id="commentbtn" data-toggle="modal" data-target="#addComment" style="display:none;"></button>';
												                        			$("#comment_rating").append(res_context);
												                        			$("#commentbtn").click();
														                        }
														                        if(comm == false){
															                        console.log("duplicate = " + comm)
														                        	var res_context = "";
												                        			res_context += '<button type="button" class="btn btn-primary" id="msgbtn" data-toggle="modal" data-target="#commalready" style="display:none;"></button>';
												                        			$("#comment_rating").append(res_context);
												                        			$("#msgbtn").click();
															                    }
													                        }
													                    }
																)
								                        		
									                        }else if(response == false){
									                        	var res_context = "";
									                        	res_context += '<button type="button" class="btn btn-primary" id="commentbtn" data-toggle="modal" data-target="#loginbtn" style="display:none;"></button>';
								                        		$("#comment_rating").append(res_context);
								                        		$("#commentbtn").click();
										                    }
								                        }
								                    }
								                )
											}
										}
                                    </script>
                                    
                                    <!-- Modal 成功留言-->
									<div class="modal fade" id="addComment" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  									<div class="modal-dialog modal-dialog-centered" role="document">
    									<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title" id="exampleModalLongTitle">Fun X Taiwan</h5>
        									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        									</button>
      									</div>
      									<div class="modal-body">
       									 新增成功，謝謝您的寶貴意見 !          
      									</div>
      									<div class="modal-footer">
									<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
        									<button type="button" data-dismiss="modal" class="btn btn-primary" id="addcommbtn">確認</button>
      									</div>
    									</div>
  									</div>
									</div><!-- .Modal 成功留言-->
									
									<!-- Modal 導向登入-->
									<div class="modal fade" id="loginbtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  									<div class="modal-dialog modal-dialog-centered" role="document">
    									<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title" id="exampleModalLongTitle">Fun X Taiwan</h5>
        									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        									</button>
      									</div>
      									<div class="modal-body">
       									請先登入哦 !          
      									</div>
      									<div class="modal-footer">
											<form id="form-1" action="<%=pageContext.getServletContext().getContextPath()%>/user/singinPage">
        										<button type="submit" class="btn btn-primary" id="">登入</button>
											</form>
      									</div>
    									</div>
  									</div>
									</div><!-- .Modal 導向登入-->
									
									<!-- Modal 重複留言-->
									<div class="modal fade" id="commalready" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  									<div class="modal-dialog modal-dialog-centered" role="document">
    									<div class="modal-content">
      									<div class="modal-header">
        									<h5 class="modal-title" id="exampleModalLongTitle">Fun X Taiwan</h5>
        									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          									<span aria-hidden="true">&times;</span>
        									</button>
      									</div>
      									<div class="modal-body">
       									抱歉，您已留言過囉 !          
      									</div>
      									<div class="modal-footer">
        										<button type="button" data-dismiss="modal" class="btn btn-primary" id="">關閉</button>
      									</div>
    									</div>
  									</div>
									</div><!-- .Modal 重複留言-->
									
									<script>
									 $(function () { $('#addComment').modal('hide')});
									 $(function () { $('#commalready').modal('hide')});
									</script>
									<script>
									 $(function () { $('#addComment').on('hide.bs.modal', function () {
										var list = $(".review-item");
										console.log("size = " + list.size());
										$("#reviews").remove();
										$("#r_comment").val('');
										$.ajax(
							                    {
							                        type: 'POST',
							                        data: { },
							                        url: '${pageContext.servletContext.contextPath}/flashComment',
							                        dataType: 'html',
							                        success:function(comm){
														$(".rd-reviews").append(comm);
														$("i#starRating").attr("class", "fa fa-star-o")
														$("#commentbtn").empty();
							                        }
							                    }
										)
										})
									 });
									 $(function () { $('#commalready').on('hide.bs.modal', function () {
										var list = $(".review-item");
										console.log("size = " + list.size());
// 										$("#reviews").remove();
										$("#r_comment").val('');
										$.ajax(
							                    {
							                        type: 'POST',
							                        data: { },
							                        url: '${pageContext.servletContext.contextPath}/flashComment',
							                        dataType: 'html',
							                        success:function(comm){
// 														$(".rd-reviews").append(comm);
														$("i#starRating").attr("class", "fa fa-star-o")
														$("#commentbtn").empty();
							                        }
							                    }
										)
										})
									 });
									</script>
                                </div>
                            </div>
                         </div>
<!--                         </form> -->
                    </div>
<!--       									<script> -->
<!-- 											$("#addcommbtn").click(function(){ -->
<!--  												$(".review-add").remove(); -->
<!-- 												}) -->
<!--       									</script> -->
                </div>
                <div class="col-lg-4">
                    <div class="room-booking">
                        <h3>訂位資料</h3>
                        <form class="booking2" action="<%=pageContext.getServletContext().getContextPath()%>/PrepareOrder" method="POST">
                            <div class="check-date">
                                <label for="date-in">日期:</label>
                                <input type="date" name="book_date" id="theDate" class="date-input hasDatepicker">
<!--                                 <i class="icon_calendar"></i> -->
                                <script>
                                var book = "${book_date}";
        						console.log(book);
        						console.log(typeof(book));
        						document.getElementById("theDate").value = book;
        						
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
        						document.getElementById("theDate").min = today;

        						function rclick(){
        							var theDate = document.getElementById("theDate").value
        							console.log(theDate);
        							}
								</script>
                            </div>
                            <div class="check-date">
                                <label for="date-out">時間:</label>
                                <select id=sel name="time"  class="form-control">
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
                            <div class="check-date">
                                <label for="date-out">人數:</label>
                                <select name="person_number" id="p_num" class="form-control">
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
								var num  =  ${person_number};
								console.log("type" + typeof(num));
		        				var opts=document.getElementById("p_num");
								console.log("num" + opts[num].value);
		       					opts[num-1].selected=true;
   								</script>
                            </div>
                            <div class="select-option">
                                <label for="guest">請輸入訂位者姓名:</label><span id="idsp">&nbsp;*必填</span><span id="nameck">&nbsp;</span>
                                <input type="text" id="b-name" name="b_name" placeholder="" onchange="checkinfoN()">
                            </div>
                            <div class="select-option">
                                <label for="room">請輸入訂位者電話:</label><span id="idsp">&nbsp;*必填</span><span id="phoneck">&nbsp;</span>
                                <input type="text" id="b-phone" name="b_phone" placeholder="09xxxxxxxx" onchange="checkinfoP()">
                            </div>
                            <button id="order" type="button" class="orderbtn">我要訂位</button>
                            <Input type='hidden' name='cartnum' value=''>
                            <script>
                            var item = 0;
								$("#order").click(function(){
									//檢查是否登入
									$.ajax(
								                    {
								                        type: 'POST',
								                        data: { },
								                        url: '${pageContext.servletContext.contextPath}/checkLogin',
								                        dataType: 'json',
								                        success:function(response){
									                        console.log("re = " + response);
									                        if(response == true){
									                        	var name = $("#b-name").val();
																var phone = $("#b-phone").val();
																var date = $("#theDate").val();
																var time = $("#sel").val();
																if($("#b-name").val() == ""){
																	$("#nameck").html("&nbsp;<font color='red' id='idsp'>&nbsp;請輸入訂位者姓名</font>");
																}else{
																	$("#nameck").html("");
																	}
																if($("#b-phone").val() == ""){
																	$("#phoneck").html("&nbsp;<font color='red' id='idsp'>&nbsp;請輸入手機號碼</font>");
																}else if(!$("#b-phone").val().match(/^09[0-9]{8}$/)){
																	$("#phoneck").html("&nbsp;<font color='red' id='idsp'>&nbsp;手機號碼格式不正確！</font>");
																}else {
																	$("#phoneck").html("");
																}
																console.log("t or f = " + (!$("#b-phone").val().match(/^09[0-9]{8}$/)))
																if(name != "" && phone != "" && (!$("#b-phone").val().match(/^09[0-9]{8}$/)) == false){
																	$.ajax(
														                    {
														                        type: 'GET',
														                        data: { "book_date":date,"time":time },
														                        url: '${pageContext.servletContext.contextPath}/checkTable',
														                        dataType: 'html',
														                        success:function(response){
														                        	console.log("r = " + response);
														                           if(response == "false"){
															                           console.log("in r = " + response);
														                        	   var res_context = "";
															                        	res_context += '<button type="button" class="btn btn-primary" id="tableckbtn" data-toggle="modal" data-target="#tableresponse" style="display:none;"></button>';
															                        	$("#rating").html(res_context);
															                        	$("#tableckbtn").click();
														                        	   
															                        }else{
															                        	   $(".booking2").submit();
																                    }
														                        }
														                    }
														                )
																	
																}
								                        		
									                        }else if(response == false){
									                        	var res_context = "";
									                        	res_context += '<button type="button" class="btn btn-primary" id="commentbtn" data-toggle="modal" data-target="#loginbtn" style="display:none;"></button>';
								                        		$("#comment_rating").append(res_context);
								                        		$("#commentbtn").click();
										                    }
								                        }
								                    }
								                )
								})
									
							function checkinfoN(){
									var name = $("#b-name").val();
									if($("#b-name").val() == ""){
										$("#nameck").html("&nbsp;<font color='red' id='idsp'>&nbsp;請輸入訂位者姓名</font>");
									}else{
										$("#nameck").html("");
										}
									console.log("name = " + name);
									}
							function checkinfoP(){
									var phone = $("#b-phone").val();
									if($("#b-phone").val() == ""){
										$("#phoneck").html("&nbsp;<font color='red' id='idsp'>&nbsp;請輸入手機號碼</font>");
									}else if(!$("#b-phone").val().match(/^09[0-9]{8}$/)){
										$("#phoneck").html("&nbsp;<font color='red' id='idsp'>&nbsp;手機號碼格式不正確！</font>");
									}else {
										$("#phoneck").html("");
									}
									console.log("phone = " + phone);
							}
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