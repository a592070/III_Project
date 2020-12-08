<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>DirEngine - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />


    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
	<c:import url="/WEB-INF/admin/fragment/nav.jsp" />

  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">dirEngine.</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
          <li class="nav-item"><a href="tour.html" class="nav-link">Tour</a></li>
          <li class="nav-item active"><a href="hotel.html" class="nav-link">Hotels</a></li>
          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
          <li class="nav-item cta"><a href="contact.html" class="nav-link"><span>Add listing</span></a></li>
        </ul>
      </div>
    </div>
  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_5.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Hotel</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">Find City</h3>
        			<form id="formId">
        				<div class="fields">

		              <div class="form-group">
		                <div class="select-wrap one-third">
							<label for="startPoint" class="trainShow">起始站:</label>
						<!-- <div class="icon"><span class="ion-ios-arrow-down"></span></div> -->
                        <select name="startPoint" id="startPoint" class="trainShow form-control">
                            <option value="Nangang" selected>南港站</option>
                            <option value="Taipei">台北站</option>
                            <option value="Banqiao">板橋站</option>
                            <option value="Taoyuan">桃園站</option>
                            <option value="Hsinchu">新竹站</option>
                            <option value="Miaoli">苗栗站</option>
                            <option value="Taichung">台中站</option>
                            <option value="Changhua">彰化站</option>
                            <option value="Yunlin">雲林站</option>
                            <option value="Chiayi">嘉義站</option>
                            <option value="Tainan">台南站</option>
                            <option value="Zuoying">左營站</option>
                        </select>
	                  </div>
					  </div>
					  
		              <div class="form-group">
		                <div class="select-wrap one-third">
							<label for="destination" class="trainShow">終點站:</label>
							<!-- <div class="icon"><span class="ion-ios-arrow-down"></span></div> -->
						<select name="destination" id="destination" class="trainShow form-control">
							<option value="Nangang">南港站</option>
							<option value="Taipei">台北站</option>
							<option value="Banqiao">板橋站</option>
							<option value="Taoyuan">桃園站</option>
							<option value="Hsinchu">新竹站</option>
							<option value="Miaoli">苗栗站</option>
							<option value="Taichung">台中站</option>
							<option value="Changhua">彰化站</option>
							<option value="Yunlin">雲林站</option>
							<option value="Chiayi">嘉義站</option>
							<option value="Tainan">台南站</option>
							<option value="Zuoying" selected>左營站</option>
                        </select>
	                  </div>
		              </div>

		              <div class="form-group">
						<label for="departureDate" class="trainShow">出發日期:</label>
						<input type="date" id="departureDate" name="departureDate" min="2020-12-25" max="2021-01-08" class="trainShow form-control">
					</div>


		              <div class="form-group">
		                <input type="button" id="trainSubmit" value="查詢" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
				</div>
				

          </div>
          <div class="col-lg-9">
          	<div class="row">

				<div id="anotherSection" style="width: 800px; height: 100px; margin: 0 auto;">
 
					<!-- 用來顯示Ajax回傳值的fieldset -->
		 
				 <fieldset>
		 
					 <legend>查詢結果</legend>
		 
					 <div id="ajaxResponse" style="width: 800px; margin: 0 auto;">
						<table id="ajaxTable" style="margin: 0 auto;" class="table table-striped table-sm">
		
						</table>
					</div>
		 
				 </fieldset>
		 
				</div> 

          	</div>

          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">dirEngine</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Service</a></li>
                <li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Become a partner</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <c:import url="/WEB-INF/admin/fragment/footer.jsp"/> 
  <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
<!--   <script src="js/jquery.timepicker.min.js"></script> -->
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>



  <script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
<script>
          Cookies.set('HSR', 'bar')

          //在網頁加載後，對id=doAjaxBtn的Button設定click的function
          function chooseType(){
             if(document.querySelector("#transportation").value == "rentalCar"){
                 var changeTrainClass = document.querySelectorAll(".trainShow");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "tmp";
                 }
                 var changeTrainClass = document.querySelectorAll(".trainHide");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainShow";
                 }
                 var changeTrainClass = document.querySelectorAll(".tmp");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainHide";
                 }
             }else if(document.querySelector("#transportation").value == "train"){
                 var changeTrainClass = document.querySelectorAll(".trainHide");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "tmp";
                 }
                 var changeTrainClass = document.querySelectorAll(".trainShow");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainHide";
                 }
                 var changeTrainClass = document.querySelectorAll(".tmp");
                 for(var i=0; i<changeTrainClass.length; i++){
                     changeTrainClass[i].className = "trainShow";
                 }
             }
         }
         let startPoint;
         let destination;
         $(document).ready(function(){

            $("#trainSubmit").click(function(){
             //console.log($("#formId").serialize());
              startPoint = $("#startPoint").val().toLowerCase();
              destination = $("#destination").val().toLowerCase();

            //  console.log($("#startPoint").val().toLowerCase())
                $.ajax({

                     type:"POST",                    //指定http參數傳輸格式為POST

                     url: "HsrServlet",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy

                     data: $("#formId").serialize(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之

                                                     //內含有name的物件value

                     dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                     //Ajax成功後執行的function，response為回傳的值

                     //此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]}

                     success : function(response){

                         //在id=ajaxResponse的fieldset中顯示Ajax的回傳值
                        // console.log(response.length);
                        //console.log($("#startPoint").val())
                        console.log(response[0].length);
                        let tableData = "<thead><tr><th>列車號</th><th>出發時間</th><th>抵達時間</th><th>票價</th><th>訂票</th></tr></thead>";
                        for(let i = 0; i < response[0].length; i++){
                            tableData += "<tr>";
                            tableData += "<td>" + response[0][i]["idHSR"] + "</td>" + "<td>" + response[0][i][startPoint] + "</td>" + "<td>" + response[0][i][destination] + "</td>" + "<td>" + response[1]["price"] + "</td>" + "<td>" + '<input type="button" class="orderTicket" value="點我訂票">' + "</td>";
                            tableData += "</tr>";
                        }
                        //console.log(tableData);
                        $("#ajaxTable").html(tableData);
                        
                        var table = document.getElementById('ajaxTable');
                        console.log(table.rows[0].cells[0].innerHTML);



                     },

                     //Ajax失敗後要執行的function，此例為印出錯誤訊息

                     error:function(xhr, ajaxOptions, thrownError){

                         console.log(xhr.status+"\n"+thrownError);
                     }

                 });
            
            });



         });  
            $("#ajaxTable").on("click", ".orderTicket", function(){
                var index = $(".orderTicket").index(this);
                console.log(index);
                var table = document.getElementById('ajaxTable');
               //console.log(table.rows[index+1].cells[0].innerHTML);
                //console.log($("#destination").val().toLowerCase())
                strCookies = table.rows[index+1].cells[0].innerHTML+","+startPoint+","+destination+","+$("#departureDate").val();
                Cookies.set('HSR', strCookies)
                window.location="\orderHSRticket.jsp";
                //console.log(startPoint)
            })

     </script>
    
  </body>
</html>