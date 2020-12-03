<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找餐廳</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="/WEB-INF/admin/fragment/user_ref.jsp" /> 
    
<style>
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
.box{
 	background:white; 
	margin:120px 120px;
}
img{
	width:700px;
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
</style>
</head>
<body>
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />

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
										var half = " <i class='icon_star-half_alt'></i>";
										var zerostar = "";
										for(var i = 0; i < star; i++){
											tags += " <i class='icon_star'></i>";
											}
										for(var j =( star + 1 ); j < 5 ; j++){
											zerostar += " <i class='fa fa-star-o'></i>";
											}
										$("#rating").prepend(tags, half, zerostar);
                                      </script>
                                    </div>
                                    <form id="shop_cart" action="<%=pageContext.getServletContext().getContextPath()%>/PrepareOrder" method="POST">
                                    	<a href="javascript:document.getElementById('shop_cart').submit();">放入購物車</a>
                                    	<Input type='hidden' name='time' value='11:00'>
                                    	<Input type='hidden' name='book_date' value='${book_date}'>
                                    	<Input type='hidden' name='b_name' value=''>
                                    	<Input type='hidden' name='b_phone' value=''>
                                    	<Input type='hidden' name='person_number' value='${person_number}'>
                                    </form>
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
                        <h4></h4>
                        <div class="review-item">
                            <div class="ri-pic">
<!--                                 <img src="" alt=""> -->
                            </div>
                            <div class="ri-text">
                                <span></span>
                                <div class="rating">
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star-half_alt"></i> -->

                                </div>
                                <h5></h5>
                                <p></p>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="ri-pic">
<!--                                 <img src="" alt=""> -->
                            </div>
                            <div class="ri-text">
                                <span></span>
                                <div class="rating">
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star"></i> -->
<!--                                     <i class="icon_star-half_alt"></i> -->
                                </div>
                                <h5></h5>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    <div class="review-add">
                        <h4></h4>
                        <form action="#" class="ra-form">
                            <div class="row">
                                <div class="col-lg-6">
<!--                                     <input type="text" placeholder="Name*"> -->
                                </div>
                                <div class="col-lg-6">
<!--                                     <input type="text" placeholder="Email*"> -->
                                </div>
                                <div class="col-lg-12">
                                    <div>
                                        <h5></h5>
                                        <div class="rating">
<!--                                             <i class="icon_star"></i> -->
<!--                                             <i class="icon_star"></i> -->
<!--                                             <i class="icon_star"></i> -->
<!--                                             <i class="icon_star"></i> -->
<!--                                             <i class="icon_star-half_alt"></i> -->
                                        </div>
                                    </div>
<!--                                     <textarea placeholder="Your Review"></textarea> -->
<!--                                     <button type="submit">Submit Now</button> -->
                                </div>
                            </div>
                        </form>
                    </div>
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
        						if (day < 10)
        							day = "0" + day;

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
                                <label for="guest">請輸入訂位者姓名:</label>
                                <input type="text" id="b-name" name="b_name" placeholder="">
                            </div>
                            <div class="select-option">
                                <label for="room">請輸入訂位者電話:</label>
                                <input type="text" id="b-phone" onblur="checkPhone()" name="b_phone" placeholder="09xxxxxxxx">
                            </div>
                            <button id="order" type="button" class="orderbtn">我要訂位</button>
                            <Input type='hidden' name='cartnum' value=''>
                            <script>
                            var item = 0;
								$("#order").click(function(){
// 									item ++;
// 									console.log("item = " + item)
// 									$(".nav-shop__circle").html(item);
									$(".booking2").submit();
									})
                            </script>
                        </form>
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