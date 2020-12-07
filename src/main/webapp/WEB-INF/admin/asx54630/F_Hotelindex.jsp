<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>找住宿</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--     css -->
	<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
<!--     css -->
  </head>
  <body>
    <!-- strat nav -->
  <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('https://i.imgur.com/6DuGxHp.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2">FUN x 台灣</span></p>
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
        			<h3 class="heading mb-4">找住宿</h3>
        			<form id="form">
        				<div class="fields">
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="regionkeywd" id="regionkeywd" class="form-control">
	                      <option value="">選擇地區...</option>
                          <option value="基隆市">基隆市</option>
                       	  <option value="新北市">新北市</option>
                          <option value="臺北市">臺北市</option>
                          <option value="桃園市">桃園市</option>
                          <option value="新竹市">新竹市</option>
                          <option value="新竹縣">新竹縣</option>
                          <option value="苗栗縣">苗栗縣</option>
                          <option value="宜蘭縣">宜蘭縣</option>
                          <option value="臺中市">臺中市</option>
                          <option value="彰化縣">彰化縣</option>
                          <option value="南投縣">南投縣</option>
                          <option value="雲林縣">雲林縣</option>
                          <option value="嘉義市">嘉義市</option>
                          <option value="嘉義縣">嘉義縣</option>
                          <option value="臺南市">臺南市</option>
                          <option value="高雄市">高雄市</option>
                          <option value="屏東縣">屏東縣</option>
                          <option value="花蓮縣">花蓮縣</option>
                          <option value="臺東縣">臺東縣</option>
                          <option value="澎湖縣">澎湖縣</option>
                          <option value="金門縣">金門縣</option>
                          <option value="連江縣">連江縣</option>
	                    </select>
	                  </div>
		              </div>
		           	  <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="typekeywd" id="typekeywd" class="form-control" placeholder="類型搜尋">
                     	 <option value="">選擇類型...</option>
                     	 <option value="飯店">飯店</option>
                      	 <option value="民宿">民宿</option>
                     	 <option value="汽車旅館">汽車旅館</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="text" class="form-control" name="keyword" id="keyword" placeholder="輸入關鍵字...">
		              </div>
<!-- 		              <div class="form-group"> -->
<!-- 		                <input type="text" id="checkin_date" class="form-control" placeholder="幾號入住?" value=""> -->
<!-- 		              </div> -->
<!-- 		              <div class="form-group"> -->
<!-- 		                <input type="text" id="checkin_date" class="form-control" placeholder="幾號退房?" value=""> -->
<!-- 		              </div> -->
		              <div class="form-group">
		                <button type="button" id="search" onclick="HotelSearch()"  class="btn btn-primary py-3 px-5">找住宿</button>
		              </div>
		              <div class="form-group">
		                <button type="button"  onclick="resetkeyword()"  class="btn btn-primary py-3 px-5">清空選項</button>
		              </div>
		            </div>
	            </form>
        		</div>
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">Star Rating</h3>
        			<form method="post" class="star-rating">
							  <div class="form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">
										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
									</label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						     </label>
							  </div>
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
						      </label>
							  </div>
							  <div class="form-check">
						      <input type="checkbox" class="form-check-input" id="exampleCheck1">
						      <label class="form-check-label" for="exampleCheck1">
						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
							    </label>
							  </div>
							</form>
        		</div>
          </div>

          <div class="col-lg-9" id="h_data">
          	<div class="row" >
          	<c:forEach var="hotels" items="${hoteldata}">
          		<div class="col-md-4 ftco-animate">
		    				<div class="destination">
		    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('https://i.imgur.com/D690ggE.jpg');">
		    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h3><a href="hotel-single.html">${hotels.NAME}</a></h3>
				    						<p class="rate">
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star"></i>
				    							<i class="icon-star-o"></i>
				    							<span>8 Rating</span>
				    						</p>
			    						</div>
			    						<div class="two">
			    							<span class="price per-price">$40<br><small>/night</small></span>
		    							</div>
		    						</div>
		    						<p>${hotels.TYPE}</p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i>&emsp;${hotels.REGION}</span> 
		    							<span class="ml-auto"><a href="#">Book Now</a></span>
		    						</p>
		    					</div>
		    				</div>
		    			</div>
		    		</c:forEach>
          	</div>
          	<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		              	<li><a class="first" href="javascript:;" id="firstBtn" >首頁</a></li>
		                <li><a class="previous" href="javascript:;" id="previousBtn" >&lt;</a></li>
<%-- 		                <c:forEach var="pages" begin="1" end="${totalPage}"> --%>
		                <li id="${currentPage}" value="${currentPage}"><a href="#" onclick="return false" >${currentPage}/${totalPage}</a></li>
<%-- 		                </c:forEach> --%>
		                <li><a class="next" href="javascript:;" id="nextBtn" onclick="nextPage()">&gt;</a></li>
		                <li><a class="last" href="javascript:;" id="lastBtn" onclick="lastPage()">頁尾</a></li>
		              </ul>
		            </div>
		          </div>
		        </div>
		        <script type="text/javascript">
				if(currentPage == 1){
					$("#firstBtn").removeAttr('onclick');
					$("#previousBtn").removeAttr('onclick');						
				}

				if(currentPage == totalPage){
					$("#nextBtn").removeAttr('onclick');
					$("#lastBtn").removeAttr('onclick');						
				}
		        </script>
          </div> 
          <script type="text/javascript">
          	var currentPage = 1;
  		  	var totalPage = 1;

  		  	function HotelSearch() {
  				console.log("搜尋")
//   				var orderfiled = $("#orderfiled").val()
  				var keyword = $("#keyword").val()
  				var regionkeywd = $("#regionkeywd").val()
  				var typekeywd = $("#typekeywd").val()
//   				var order = $("#order").val()
  				var currentPage=1
  				$.ajax(
  						{
  							type: 'POST',
  							data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "currentPage" : currentPage },
  							url: '${pageContext.servletContext.contextPath}/F_hotelPage',
  							dataType: 'html',
  							success: function (response) {
  								$("#h_data").children().remove();
  								$("#h_data").append(response)

  							}

  						}
  					)
  			}

         	function firstPage() {
    			console.log("第一頁")
//     			var orderfiled = $("#orderfiled").val()
    			var keyword = $("#keyword").val()
    			var regionkeywd = $("#regionkeywd").val()
    			var typekeywd = $("#typekeywd").val()
//     			var order = $("#order").val()
    			var pagebotton = $("#page-previous").val()
    			currentPage = 1;
    			console.log("keyword =" + keyword);
    			console.log("regionkeywd =" + regionkeywd);
    			console.log("typekeywd =" + typekeywd);
    			console.log("pagebotton =" + pagebotton);
    			console.log("currentPage =" + currentPage);
//     			$("#h_content").children().remove();
    			$.ajax(
    					{
    						type: 'POST',
    						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "pagebotton" : pagebotton, "currentPage" : currentPage },
    						url: '${pageContext.servletContext.contextPath}/F_hotelPage',
    						dataType: 'html',
    						success: function (response) {
    							$("#h_data").children().remove();
    							$("#h_data").append(response)

    						}

    					}
    				)
    		}
     	            
          
         	function previousPage() {
			console.log("前一頁")
// 			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
// 			var order = $("#order").val()
			var pagebotton = $("#page-previous").val()
			currentPage--;
			console.log("keyword =" + keyword);
			console.log("regionkeywd =" + regionkeywd);
			console.log("typekeywd =" + typekeywd);
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
// 			$("#h_content").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "pagebotton" : pagebotton, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/F_hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#h_data").children().remove();
							$("#h_data").append(response)

						}

					}
				)
		}
		
         	function nextPage() {
			console.log("下一頁")
// 			var orderfiled = $("#orderfiled").val()
			var keyword = $("#keyword").val()
			var regionkeywd = $("#regionkeywd").val()
			var typekeywd = $("#typekeywd").val()
// 			var order = $("#order").val()
			var pagebotton = $("#page-next").val()
			currentPage++;
			console.log("keyword =" + keyword);
			console.log("regionkeywd =" + regionkeywd);
			console.log("typekeywd =" + typekeywd);
			console.log("pagebotton =" + pagebotton);
			console.log("currentPage =" + currentPage);
// 			$("#h_content").children().remove();
			$.ajax(
					{
						type: 'POST',
						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "pagebotton" : pagebotton, "currentPage" : currentPage },
						url: '${pageContext.servletContext.contextPath}/F_hotelPage',
						dataType: 'html',
						success: function (response) {
							$("#h_data").children().remove();
							$("#h_data").append(response);
							

						}

					}
				)
		}

         	function lastPage() {
    			console.log("最末頁")
//     			var orderfiled = $("#orderfiled").val()
    			var keyword = $("#keyword").val()
    			var regionkeywd = $("#regionkeywd").val()
    			var typekeywd = $("#typekeywd").val()
//     			var order = $("#order").val()
    			var pagebotton = $("#page-next").val()
    			currentPage = totalPage;
    			console.log("keyword =" + keyword);
    			console.log("regionkeywd =" + regionkeywd);
    			console.log("typekeywd =" + typekeywd);
    			console.log("pagebotton =" + pagebotton);
    			console.log("currentPage =" + currentPage);
//     			$("#h_content").children().remove();
    			$.ajax(
    					{
    						type: 'POST',
    						data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "pagebotton" : pagebotton, "currentPage" : currentPage },
    						url: '${pageContext.servletContext.contextPath}/F_hotelPage',
    						dataType: 'html',
    						success: function (response) {
    							$("#h_data").children().remove();
    							$("#h_data").append(response);
    							

    						}

    					}
    				)
    		}

    		function resetkeyword(){
    			console.log("clear");
    		  $("#keyword").val('');
    		  $('#regionkeywd').val('');
    		  $('#typekeywd').val('');
    		}
            	
    		
		</script>
         
          <!-- .col-md-8 -->
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
    
    <script type="text/javascript">
	

    </script>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
</body>
</html>