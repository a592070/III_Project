<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.Rbody{
 	background:white; 
	margin:150px;
/* 	padding-top:30 50px; */
	padding-left:25px;
	padding-right:25px;
}
.R_info{
	height:250px;
}
h3{
	height:100px;
}
.div_box{
	text-align: center;
}
.heading.mb-4{
	height:50px;
}
.btn.btn-warning{
	border-radius: 5px;
	font-size: 10px;
	background: #f85959;
	border: 1px solid #f85959;
    color: #fff;
}
</style>
</head>
<body>
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    
	<!-- body -->
	<div class="Rbody">
	 <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light">
        			<h3 class="heading mb-4">找餐廳</h3>
        			<FORM ACTION="<%=pageContext.getServletContext().getContextPath()%>/SearchRestaurant" method="post">
        				<div class="fields">
		              <div class="form-group">
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
		              <div class="form-group">
		                <div class="select-wrap one-third">
						<span class="sp_search">餐廳名稱搜尋</span> 
						<input type="text" name="restaurant_name" placeholder="請輸入關鍵字" class="form-control">
	                  </div>
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
		              </div>
		              <div class="form-group">
		                <input type="submit" value="找餐廳" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </FORM>
        		</div>
        		<div class="sidebar-wrap bg-light ">
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
          
          <!-- Display stores -->
          <div class="col-lg-9">
          	<div class="row">
          	
          	<c:forEach var="res" items="${res_data}">
          		<div class="col-md-4 ">
		    				<div class="destination">
		    				<FORM id="form${res.r_sn}" action="<%=pageContext.getServletContext().getContextPath()%>/DisplayRestaurant" method="POST">
<%--		    					<a href="javascript:document.getElementById('form${res.r_sn}').submit();" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg');">--%>
		    					<a href="javascript:document.getElementById('form${res.r_sn}').submit();" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('${pageContext.servletContext.contextPath}/restaurant/pic/${res.r_sn}');">
<%--		    					<a href="javascript:document.getElementById('form${res.r_sn}').submit();" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('${pageContext.servletContext.contextPath}/attraction/pic/1/08299ea3-9700-317d-b8c5-dd9de05ff5ca.jpg');">--%>
		    						<div class="icon d-flex justify-content-center align-items-center">
    								<span class="icon-search2"></span>
    								</div>
		    					</a>
		    					<Input type='hidden' name='restaurant_name' value='${res.name}'>
								<Input type='hidden' name='book_date' value='${book_date}'>
								<Input type='hidden' name='person_number' value='${person_number}'>
		    				</FORM>
		    					<div class="text p-3">
		    						<FORM action="<%=pageContext.getServletContext().getContextPath()%>/DisplayRestaurant" method="POST">
		    						<div class="R_info">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h3><a href="hotel-single.html">${res.name}</a></h3>
				    						<p class="rate"  id="test${res.rating}" >
				    							<i id="stars" class="icon-star" ></i>
				    							<i id="stars" class="icon-star" ></i>
				    							<i id="stars" class="icon-star" ></i>
				    							<i id="stars" class="icon-star" ></i>
				    							<i id="stars" class="icon-star-o" ></i>
				    							<span>${res.rating}</span>
				    						</p>
				    						<script>
				    						
				    						</script>
			    						</div>
			    						<div class="two">
<!-- 			    							<span class="price per-price">$40<br><small>/night</small></span> -->
		    							</div>
		    						</div>
		    						<p>${res.type}</p>
		    						</div>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i>&emsp;${res.region}</span> 
		    							<span class="ml-auto"><button type="submit" class="btn btn-warning">訂位去</button></span>
		    							<Input type='hidden' name='restaurant_name' value='${res.name}'>
										<Input type='hidden' name='book_date' value='${book_date}'>
										<Input type='hidden' name='person_number' value='${person_number}'>
		    						</p>
		    						</FORM>
		    					</div>
		    				</div>
		    			</div>
		    			</c:forEach>
		    			
		    			
          	</div>
          	<div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
		              </ul>
		<br>                     
      	<div class="div_box">
		<div class="search">
		
		<FORM  action="<%=pageContext.getServletContext().getContextPath()%>/Restaurant_index" >
			<button class="btn btn-success">重新查詢</button>
		</FORM>
		
		</div>
		</div>
		            </div>		              
		          </div>		        
		        </div>
          </div> 
          <!-- .col-md-8 -->
        </div>
      </div>

    </section> 
    <!-- .section -->
	</div>

	


</body>
</html>