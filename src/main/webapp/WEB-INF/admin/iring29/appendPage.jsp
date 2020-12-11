<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 
    
		<div class="row" id="rowheight">
		
		<c:set var ="size" value= "${fn:length(res_data)}"></c:set>
		<c:if test = "${size < 1}" >
			<h5>很抱歉，沒有符合的餐廳</h5>
		</c:if>
         
        <c:if test = "${size > 0}" >
		
          	<c:forEach var="res" items="${res_data}">
          		<div class="col-md-4 ftco-animate">
		    				<div class="destination">
		    				<form id="form${res.r_sn}" action="<%=pageContext.getServletContext().getContextPath()%>/DisplayRestaurant/${res.r_sn}">
		    					<a href="javascript:document.getElementById('form${res.r_sn}').submit();" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url('<%=pageContext.getServletContext().getContextPath()%>/Restaurant/pic/${res.r_sn}');">
		    						<div class="icon d-flex justify-content-center align-items-center">
    									<span class="icon-search2"></span>
    								</div>
		    					</a>
<%-- 		    					<Input type='hidden' name='r_sn' value='${res.r_sn}'> --%>
<%-- 								<Input type='hidden' name='book_date' value='${book_date}'> --%>
<%-- 								<Input type='hidden' name='person_number' value='${person_number}'> --%>
		    				</form>
		    					<div class="text p-3">
		    						<form action="<%=pageContext.getServletContext().getContextPath()%>/DisplayRestaurant/${res.r_sn}">
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
<%-- 		    							<Input type='hidden' name='r_sn' value='${res.r_sn}'> --%>
<%-- 										<Input type='hidden' name='book_date' value='${book_date}'> --%>
<%-- 										<Input type='hidden' name='person_number' value='${person_number}'> --%>
		    						</p>
		    						</div>
		    					</form>
		    					</div>
		    				</div>
		    			</div>
		    			</c:forEach>	
		    		</c:if>  	    			
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
        
    <!-- import js -->
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 