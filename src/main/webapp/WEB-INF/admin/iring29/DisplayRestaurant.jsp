<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Info</title>
    <script src="${pageContext.servletContext.contextPath}/static/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .box {
            width: 900px;
            margin: 50px auto;
            border: 1px solid gray;
        }

        .div_img {
            width: 900px;
            height: 400px;
            margin: auto;
			overflow: hidden;
			display:flex;
        }
		img{
			width: 100%;
		}
        /* div {
            border: 1px solid rgb(212, 212, 212);
        } */
        .div-1{
        	padding-bottom: 20px;
        }
        h2 {
            padding: 20px;
            color:white;
        }

        .title {
            text-align: center;
            background-color: 	#BB3D00;
            margin:0px;
        }

        .top {
            display: flex;
        }

        .booking {
            width: 300px;
            padding: 10px 0;
            line-height: 22px;
            text-align: center;
            /* background-color: #FFCC00; */
            cursor: pointer;
            /* border: 1px solid gray; */
            border-top: solid 1.5px #f04e2f;
        }

        .info {
            width: 300px;
            padding: 10px 0;
            line-height: 22px;
            text-align: center;
            background-color: #FF9900;
            cursor: pointer;
            /* border: 1px solid gray; */
        }

        .comment {
            width: 300px;
            padding: 10px 0;
            line-height: 22px;
            text-align: center;
            border-top: solid 1.5px #f04e2f;
            cursor: pointer;
            /* border: 1px solid gray; */
        }



        .res_data {
            position: relative;
            background-color: #eeeeee;
            padding: 10px 30px;
            border: 1px solid gray;
            /* font-size: 15px; */
            /* font-weight: 400; */
        }

        .res_result {
            padding: 10px 30px;
        }

        .p_result {
            padding: 10px 30px;
        }
		.btn.btn-warning{
			width: 750px;
			margin-left: 70px;
		}
        

        .rating {
            float: left;
            padding-right: 20px; 
            padding: 10px 30px;
            
        }
        
        .sp_rating{
            padding: 10px 30px;
            line-height: 35px;
            /* float: left; */
        }
        .book-btn {
            /* background-color: #ec7551; */
            border-radius: 4px;
            color: #000000;
            padding: 8px 0;
            text-align: center;
            cursor: pointer;
            width: 400px;
        }

        h3 {
            padding: 10px 30px;
        }
        p{
			font-size:16px;
		}
		.star{
			width:20px;
		}
		.book-top{
			border-style:none; 
			background-color:transparent;
		}
    </style>
</head>
<body>
<c:import url="/WEB-INF/admin/fragment/FrontHeader.jsp" />


<div class="box" >
        <div>
            <h2 class="title">${res_data.name}</h2>
            <div class="top">
            	<FORM  action="<c:url value='BookRestaurantServlet' />" method="POST">
                <div class="booking">
                	<Input class="book-top" type='submit' value='訂位'>
                </div>
                <!-- 隱藏欄位都會送到後端 /BookRestaurantServlet-->  
          		<Input type='hidden' name='res_name' value='${res_data.name}'>
          		<Input type='hidden' name='r_id' value='${res_data.r_sn}'>
                </FORM>
                <div class="info">資訊</div>
                <div class="comment">評論</div>
            </div>
            <div class="div_img" >
            	<c:if test="${!empty res_data.pic}">
                	<img id="Rimg" src="<%=application.getContextPath()%>/ShowPic">
                </c:if>
                <c:if test="${empty res_data.pic}">
                	<img id="Rimg" src="<%=application.getContextPath()%>/assets/img/iring29/Restaurant_img.png">
                </c:if>
            </div>
            
           
            
            <div class="div-1">
                <h3>${res_data.name}</h3>
                    <h5 class="rating">Rating</h5>
                    <input type="hidden" id="test" value="${res_data.rating}">
                    <!-- star -->
                    <span>
        <img class="star" src="<%=application.getContextPath()%>/assets/img/iring29/star.png" alt="">
        <img class="star" src="<%=application.getContextPath()%>/assets/img/iring29/star.png" alt="">
        <img class="star" src="<%=application.getContextPath()%>/assets/img/iring29/star.png" alt="">
        <img class="star" src="<%=application.getContextPath()%>/assets/img/iring29/star.png" alt="">
        <img class="star" src="<%=application.getContextPath()%>/assets/img/iring29/star.png" alt="">
   					</span>
                    <span class="sp_rating">${res_data.rating}</span>
                    
         <script type="text/javascript">
        
        var num = parseInt((document.getElementById("test").value)*10,10);
        console.log(num);
        var imgs = document.getElementsByClassName("star");
        first = Math.floor(num/10);
        console.log(first);
        second = Math.ceil(num%10);
        console.log(second);
        for(let i = 0; i < first; i++){
            imgs[i].src="assets/img/iring29/chngstar.gif";
        }
        if(second != 0){
        	imgs[first].src="assets/img/iring29/halfstar.png";
        }
        
        
    </script>
                    
               <FORM  action="<c:url value='BookRestaurantServlet' />" method="POST">
               	<Input class="btn btn-warning" type='submit' value='Booking'>
          <!-- 隱藏欄位都會送到後端 /BookRestaurantServlet-->  
          		<Input type='hidden' name='res_name' value='${res_data.name}'>
          		<Input type='hidden' name='r_id' value='${res_data.r_sn}'>
                </FORM>
            </div>
            <div>
                <h4 class="res_data">餐廳地點</h4>
            </div>
            <div>
                <h4 class="res_result">地址</h4>
                <p class="p_result">${res_data.address}</p>
            </div>
            <div>
                <h4 class="res_result">交通方式</h4>
                <pre><p class="p_result">${res_data.transportation}</p></pre>
            </div>
            <div>
            	<iframe
                        width="100%"
                        height="300"
                        frameborder="0"
                        src="https://www.google.com/maps?q=${res_data.address}&mrt=all&hl=zh-TW&z=15&output=embed ">
                </iframe>
            </div>
            <div>
                <h4 class="res_data">菜色介紹</h4>
            </div>
            <div>
                <h4 class="res_result">適合聚餐類型</h4>
                <p class="p_result">${res_data.serviceinfo}</p>
            </div>
            <div>
                <h4 class="res_result">料理種類</h4>
                <p class="p_result">${res_data.type}</p>
            </div>
            <div>
                <h4 class="res_data">餐廳資訊</h4>
            </div>
            <div>
                <h4 class="res_result">營業時間</h4>
                <pre><p class="p_result">${res_data.opentime}</p></pre>
            </div>
            <div>
                <h4 class="res_result">餐廳描述</h4>
                <p class="p_result">${res_data.description}</p>
            </div>
        </div>

    </div>
</body>
</html>