<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>找餐廳</title>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
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
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 	
    <!-- Start nav -->
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <!-- END nav -->
    <script>
    $(".nav-shop__circle").html('${cartnum}');
//     console.log($(".nav-shop__circle").val());
    console.log("nu = " + ${cartnum});
// 	   console.log("num");
    </script>
    <div class="hero-wrap js-fullheight" style="background-image: url('direngine-master/images/res_index.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2">FUN x 臺灣</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">探索臺灣的美食</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg" id="top">
      <div class="container">
        <div class="row" id="index">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light ftco-animate">
        			<h3 class="heading mb-4">找餐廳</h3>
        			<form action="<%=pageContext.getServletContext().getContextPath()%>/SearchRestaurant" method="post">
        				<div class="fields">
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <span class="sp_search">地區搜尋</span> 
	                    <select name="region_name" id="region" class="form-control">
	                      <option value="">請選擇地區</option>
								<option value="基隆">基隆</option>
								<option value="新北">新北</option>
								<option value="台北">台北</option>
								<option value="桃園">桃園</option>
								<option value="新竹">新竹</option>
								<option value="苗栗">苗栗</option>
								<option value="台中">台中</option>
								<option value="彰化">彰化</option>
								<option value="南投">南投</option>
								<option value="雲林">雲林</option>
								<option value="嘉義">嘉義</option>
								<option value="台南">台南</option>
								<option value="高雄">高雄</option>
								<option value="屏東">屏東</option>
								<option value="宜蘭">宜蘭</option>
								<option value="花蓮">花蓮</option>
								<option value="台東">台東</option>
								<option value="澎湖">澎湖</option>
								<option value="金門">金門</option>
								<option value="連江">連江</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
						<span class="sp_search">餐廳名稱搜尋</span> 
						<input type="text" name="restaurant_name" id="restaurant_name" placeholder="請輸入關鍵字" class="form-control">
		              </div>
		              <div class="form-group">
		                <span class="sp_search">用餐日期</span> 
		                <input type="date" name="book_date" id="theDate" min="" class="form-control">
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
								console.log(typeof(today));
								document.getElementById("theDate").value = today;
								document.getElementById("theDate").min = today;
						
							</script>
		              </div>
		              </div>
		              <div class="form-group">
		              	<span class="sp_search">用餐人數</span> 
		                <select name="person_number" id="inputState" class="form-control">
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
		              </div>
		              <div class="form-group">
		                <input type="button" id="clickbtn" value="找餐廳" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
        		</div>
<!--         		<div class="sidebar-wrap bg-light ftco-animate"> -->
<!--         			<h3 class="heading mb-4">Star Rating</h3> -->
<!--         			<form method="post" class="star-rating"> -->
<!-- 							  <div class="form-check"> -->
<!-- 									<input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 									<label class="form-check-label" for="exampleCheck1"> -->
<!-- 										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p> -->
<!-- 									</label> -->
<!-- 							  </div> -->
<!-- 							  <div class="form-check"> -->
<!-- 						      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p> -->
<!-- 						      </label> -->
<!-- 							  </div> -->
<!-- 							  <div class="form-check"> -->
<!-- 						      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p> -->
<!-- 						     </label> -->
<!-- 							  </div> -->
<!-- 							  <div class="form-check"> -->
<!-- 							    <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p> -->
<!-- 						      </label> -->
<!-- 							  </div> -->
<!-- 							  <div class="form-check"> -->
<!-- 						      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
<!-- 						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p> -->
<!-- 							    </label> -->
<!-- 							  </div> -->
<!-- 							</form> -->
<!--         		</div> -->
          </div>
          
          <!-- Display stores -->
          	<div class="col-lg-9" id="r_content">
          	
          	<div class="row" id="rowheight">
          	
          	<c:forEach var="res" items="${res_data}">
          		<div class="col-md-4 ftco-animate">
		    				<div class="destination">
		    				<form id="form${res.r_sn}" action="<%=pageContext.getServletContext().getContextPath()%>/DisplayRestaurant" method="POST">
		    					<a href="javascript:document.getElementById('form${res.r_sn}').submit();" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('<%=pageContext.getServletContext().getContextPath()%>/Restaurant/pic/${res.r_sn}');">
		    						<div class="icon d-flex justify-content-center align-items-center">
    									<span class="icon-search2"></span>
    								</div>
		    					</a>
		    					<Input type='hidden' name='restaurant_name' value='${res.name}'>
								<Input type='hidden' name='book_date' value='${book_date}'>
								<Input type='hidden' name='person_number' value='${person_number}'>
		    				</form>
		    					<div class="text p-3">
		    						<form action="<%=pageContext.getServletContext().getContextPath()%>/DisplayRestaurant" method="POST">
		    						<div class="R_info">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h3><a href="hotel-single.html">${res.name}</a></h3>
				    						<p class="rate" id="test${res.r_sn}" >
				    							<span>${res.rating}</span>
				    						</p>
			    						</div>
				    						<script>
				    						var star = Math.floor("${res.rating}");
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
											$("#test${res.r_sn}").prepend(tags, zerostar);
				    						</script>
			    						<div class="two">
			    							<small>訂金&emsp;</small><span class="price per-price">${res.price}<br><small>/人</small></span>
		    							</div>
		    						</div>
		    						<p class="type">${res.type}</p>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i>&emsp;${res.region}</span> 
		    							<span class="ml-auto"><button type="submit" class="btn btn-warning">訂位去</button></span>
		    							<Input type='hidden' name='restaurant_name' value='${res.name}'>
										<Input type='hidden' name='book_date' value='${book_date}'>
										<Input type='hidden' name='person_number' value='${person_number}'>
		    						</p>
		    						</div>
		    					</form>
		    					</div>
		    				</div>
		    			</div>
		    			</c:forEach>		    			
          	</div>
          	<!-- Page -->
          		<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27" id="pageinfo">
		              <ul>
<!-- 		                <li><a href="javascript:;" id="clickbtn">&lt;</a></li> -->
		              <c:forEach var="page"  begin="1" end="${userPage.totalPageCount}">
		              	<li id="${page}" value="${page}"><a href="#" onclick="return false" id="clickbtn" >${page}</a></li>
		              </c:forEach>
<!-- 		              	<li><a href="javascript:;" id="clickbtn">&gt;</a></li> -->
		              </ul>
		            </div>
		          </div>
		        </div>  <!-- .Page -->
		        <script>
				$("#${userPage.currentPage}").attr("class","active");
				$("#${userPage.currentPage}").remove("a");
		        </script>
          </div> <!-- .col-md-8 -->
          
          <script>
          
          $("#index").on('click', '#clickbtn', function (e) {

        	  $("html,body").animate({ scrollTop: $("#index").offset().top - 160 },600)
    			
				var region_name = $("#region").val();
				var restaurant_name = $("#restaurant_name").val();
				var book_date = $("#theDate").val();
				var person_number = $("#inputState").val();
				var currentPage = (e.target.text);
				console.log("typeof(currentPage) = " + typeof(currentPage))
				if(typeof(currentPage) == "undefined"){
					currentPage = 1;
					parseInt(currentPage);
					console.log("cp = "+ currentPage)
				}
				console.log(region_name, restaurant_name, book_date, person_number, currentPage)
				$.ajax(
	                    {
	                        type: 'POST',
	                        data: { "region_name":region_name, "restaurant_name":restaurant_name, "book_date":book_date,"person_number":person_number ,"currentPage": currentPage},
	                        url: '${pageContext.servletContext.contextPath}/SearchRestaurant',
	                        dataType: 'html',
	                        success:function(response){
	                            $("#r_content").children().remove();
	                            $("#r_content").append(response);
	                        }
	                    }
	                )
				})
				
          
          </script>
          
        </div>
      </div>
    </section> 
    <!-- .section -->

  <!-- footer -->
     <c:import url="/WEB-INF/admin/fragment/footer.jsp"/> 

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>    
    
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
</body>
</html>