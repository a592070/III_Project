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
<style type="text/css">

.R_info{
	height:250px;
}
.one{
	height:120px;
}
.type{
	height:50px;
}
h3{
	height:80px;
	width:160px;
}
.btn.btn-warning{
	border-radius: 5px;
	font-size: 10px;
	background: #f85959;
	border: 1px solid #f85959;
    color: #fff;
}
#rowheight{
	height:1030px;
}

</style>
  </head>
  <body>

  
  <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 
    <!-- strat nav -->
  <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <!-- END nav -->
    
          <script>
    $(".nav-shop__circle").html('${cartnum}');
//     console.log($(".nav-shop__circle").val());
    console.log("nu = " + ${cartnum}); 
// 	   console.log("num");
<!--     </script> -->
<!--         <script> -->
<!--        $(document).ready(function(){ -->
<!--      $('body,html').animate({scrollTop: 800}, 800);  -->
<!--        }); -->

<!--     </script> -->
    <div class="hero-wrap js-fullheight" style="background-image: url('https://i.imgur.com/ne4Q62T.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2">FUN x 台灣</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">尋找理想的飯店</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg" id="top">
      <div class="container">
        <div class="row" id="index">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h2 class="heading mb-4">找住宿</h2>
        			<form id="form">
        				<div class="fields">
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="regionkeywd" id="regionkeywd" class="form-control" onchange="HotelRegionSearch()">
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
	                    <select name="typekeywd" id="typekeywd" class="form-control" placeholder="類型搜尋" onchange="HotelTypeSearch()">
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
		                <button type="button"  onclick="resetkeyword()"  class="btn btn-success py-3 px-5">清空選項</button>
		              </div>
		            </div>
	            </form>
        		</div>

          </div>

          <div class="col-lg-9" id="h_data">
          	<div class="row" >
          	<c:forEach var="hotels" items="${hoteldata}">
          		<div class="col-md-4 ftco-animate">
		    				<div class="destination">
		    					<a href="javascript:;" onclick="detailpage('${hotels.SN}')" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('https://i.imgur.com/D690ggE.jpg');">
		    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h3>${hotels.NAME}</h3>
				    						<p class="rate" id="test${hotels.SN}">
				    							<span>${hotels.RATING}</span>
				    						</p>
			    						</div>
				    						<script>
				    						var star = Math.floor("${hotels.RATING}");
											console.log("star = " + star);
											var tags = "";
											var half = "<i class='fa fa-star-half_alt'></i>";
											var zerostar = "";
											for(var i = 0; i < star; i++){
												tags += "<i class='icon-star'></i></span>";
												}
											for(var j = star; j < 5 ; j++){
												zerostar += "<i class='fa fa-star-o'></i>";
												}
											$("#test${hotels.SN}").prepend(tags, zerostar);
				    						</script>
			    						<div class="two">
			    							<p><span class="price per-price"><small>雙人房</small>${hotels.DOUBLE_ROOM}<small>/晚</small></span></p>
			    							<p><span class="price per-price"><small>四人房</small>${hotels.QUADRUPLE_ROOM}<small>/晚</small></span></p>
		    							</div>
		    						</div>
		    						<p>${hotels.TYPE}</p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i>&emsp;${hotels.REGION}</span> 
		    							<span class="ml-auto"><a href="#">訂房去</a></span>
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
<!-- 		              	<li><a class="first" href="javascript:;" id="firstBtn" >首頁</a></li> -->
<!-- 		                <li><a class="previous" href="javascript:;" id="previousBtn" >&lt;</a></li> -->
		                <c:forEach var="pages" begin="1" end="${totalPage}">
		                <li id="${pages}" value="${pages}"><a href="#" onclick="return false" id="clickbtn" >${pages}</a></li>
		                </c:forEach>
<!-- 		                <li><a class="next" href="javascript:;" id="nextBtn" onclick="nextPage()">&gt;</a></li> -->
<!-- 		                <li><a class="last" href="javascript:;" id="lastBtn" onclick="lastPage()">頁尾</a></li> -->
		              </ul>
		            </div>
		          </div>
		        </div>
		        <script type="text/javascript">
				$("#${hpage.currentPage}").attr("class","active");
				$("#${hpage.currentPage}").remove("a");
		        </script>
          </div> 
          <script>
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

  		  	function HotelRegionSearch() {
  				console.log("地區搜尋")
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

  		  	function HotelTypeSearch() {
  				console.log("類型搜尋")
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

  		  $("#index").on('click', '#clickbtn', function (e) {

        	  $("html,body").animate({ scrollTop: $("#index").offset().top - 160 },600)
    			
				var keyword = $("#keyword").val();
        	  	var regionkeywd = $("#regionkeywd").val();
        	  	var typekeywd = $("#typekeywd").val();
				var currentPage = (e.target.text);
				console.log("typeof(currentPage) = " + typeof(currentPage))
				if(typeof(currentPage) == "undefined"){
					currentPage = 1;
					parseInt(currentPage);
					console.log("cp = "+ currentPage)
				}
				console.log(keyword, regionkeywd, typekeywd, currentPage)
				$.ajax(
	                    {
	                        type: 'POST',
	                        data: { "keyword": keyword, "regionkeywd": regionkeywd, "typekeywd" : typekeywd, "currentPage" : currentPage },
	                        url: '${pageContext.servletContext.contextPath}/F_hotelPage',
	                        dataType: 'html',
	                        success:function(response){
	                            $("#h_data").children().remove();
	                            $("#h_data").append(response);
	                        }
	                    }
	                )
				})

    		function resetkeyword(){
    			console.log("clear");
    		  $("#keyword").val('');
    		  $('#regionkeywd').val('');
    		  $('#typekeywd').val('');
    		}

    		function detailpage(id){
    			document.location.href="${pageContext.servletContext.contextPath}/F_hoteldetail/"+id;
        	}
            	
    		
		</script>
         
          <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

	<c:import url="/WEB-INF/admin/fragment/footer.jsp"/> 
    
    <script type="text/javascript">
	

    </script>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
</body>
</html>