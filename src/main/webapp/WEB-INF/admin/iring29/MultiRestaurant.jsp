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

</style>
</head>
<body>
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />

<%-- 	<c:forEach var="res" items="${Multi_Rdata}"> --%>
<!-- 		<FORM -->
<%-- 			action="<%=pageContext.getServletContext().getContextPath()%>/DisplyRestaurant" --%>
<!-- 			method="POST"> -->
<!-- 			<div class="div1"> -->
<!-- 				<div class="div2"> -->
<%-- 					<h4>${res.name}</h4>  --%>
<%-- 					<span class="sp_result">${res.region}</span> --%>

<!-- 					<span class="sp_result">region</span> -->
<%-- 					<span class="sp_result">rating：${res.rating}</span> --%>
<%-- 					<span class="sp_result">${res.type}</span> --%>

<!-- 				</div> -->
<!-- 				<div class='go-btn'><button name="go" value="go" class="btn btn-success">Go</button></div> -->
				
<%-- 				<Input type='hidden' name='restaurant_name' value='${res.name}'> --%>
<%-- 				<Input type='hidden' name='book_date' value='${book_date}'> --%>
<%-- 				<Input type='hidden' name='person_numer' value='${person_numer}'> --%>

<!-- 			</div> -->
<!-- 		</FORM> -->
<%-- 	</c:forEach> --%>

	<!-- body -->
	<div class="Rbody">
	 <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
        	<div class="col-lg-3 sidebar">
        		<div class="sidebar-wrap bg-light">
        			<h3 class="heading mb-4">Find City</h3>
        			<form action="#">
        				<div class="fields">
		              <div class="form-group">
		                <input type="text" class="form-control" placeholder="Destination, City">
		              </div>
		              <div class="form-group">
		                <div class="select-wrap one-third">
	                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                    <select name="" id="" class="form-control" placeholder="Keyword search">
	                      <option value="">Select Location</option>
	                      <option value="">San Francisco USA</option>
	                      <option value="">Berlin Germany</option>
	                      <option value="">Lodon United Kingdom</option>
	                      <option value="">Paris Italy</option>
	                    </select>
	                  </div>
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
		              </div>
		              <div class="form-group">
		                <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
		              </div>
		              <div class="form-group">
		              </div>
		              <div class="form-group">
		                <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
		              </div>
		            </div>
	            </form>
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
          	
          	<c:forEach var="res" items="${Multi_Rdata}">
          		<div class="col-md-4 ">
		    				<div class="destination">
		    					<a href="hotel-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg');">
		    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<div class="R_info">
		    						<div class="d-flex">
		    							<div class="one">
				    						<h3><a href="hotel-single.html">${res.name}</a></h3>
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
		    						<p>${res.type}</p>
		    						</div>
		    						<hr>
		    						<p class="bottom-area d-flex">
		    							<span><i class="icon-map-o"></i> Miami, Fl</span> 
		    							<span class="ml-auto"><a href="#">訂位去</a></span>
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