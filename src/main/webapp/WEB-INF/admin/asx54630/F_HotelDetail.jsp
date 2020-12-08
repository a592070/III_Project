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
                                    <div class="rating">
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star-half_alt"></i>
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

                        </div>
                    </div>

                </div>
                <div class="col-lg-4">
                    <div class="room-booking">
                        <h3>立即預訂</h3>
                        <form action="#">
                            <div class="check-date">
                                <label for="date-in">入住日期:</label>
                                <input type="text" class="date-input" id="date-in">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">退房日期:</label>
                                <input type="text" class="date-input" id="date-out">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="select-option">
                                <label for="guest">人數:</label>
                                <select id="guest">
                                    <option value="">3 Adults</option>
                                </select>
                            </div>
                            <div class="select-option">
                                <label for="room">房型:</label>
                                <select id="room">
                                    <option value="">雙人房</option>
                                    <option value="">四人房</option>
                                </select>
                            </div>
                            <button type="submit">我要訂房</button>
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