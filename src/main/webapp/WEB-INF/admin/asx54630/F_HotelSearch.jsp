<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />



<div class="row">
	<c:set var ="size" value= "${fn:length(hoteldata)}"></c:set>
		<c:if test = "${size < 1}" >
			<h5>很抱歉，沒有符合的飯店</h5>
		</c:if>
		<c:if test = "${size > 0}" >
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
				    						<h3><a href="hotel-single.html">${hotels.NAME}</a></h3>
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
		        </c:if>
		        <script type="text/javascript">
				$("#${currentPage}").attr("class","active");
				$("#${currentPage}").remove("a");
		        </script>
          	
          	<script type="text/javascript">
					currentPage = ${hpage.currentPage};
					totalPage = ${hpage.totalPageCount};

            </script>
          	
		        		       
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 