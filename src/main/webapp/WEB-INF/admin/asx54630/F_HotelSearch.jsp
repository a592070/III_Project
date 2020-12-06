<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />

<div class="row">
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
		              	<li><a class="first" href="javascript:;" id="firstBtn" onclick="firstPage()">1</a></li>
		                <li><a class="previous" href="javascript:;" id="previousBtn" onclick="previousPage()">&lt;</a></li>
<%-- 		                <c:forEach var="pages" begin="1" end="${totalPage}"> --%>
		                <li id="${currentPage}" value="${currentPage}"><a href="#" onclick="return false" >${currentPage}/${totalPage}</a></li>
<%-- 		                </c:forEach> --%>
		                <li><a class="next" href="javascript:;" id="nextBtn" onclick="nextPage()">&gt;</a></li>
		                <li><a class="last" href="javascript:;" id="lastBtn" onclick="lastPage()">${totalPage}</a></li>
		              </ul>
		            </div>
		          </div>
		        </div>
		        <script>
// 				$("#${currentPage}").attr("class","active");
				$("#${currentPage}").remove("a");
		        </script>
          	
          	<script type="text/javascript">
					currentPage = ${hpage.currentPage};
					totalPage = ${hpage.totalPageCount};
// 				$("#page-btn").text(currentPage+"/"+totalPage);

				if(currentPage == 1){
					$("#firstBtn").removeAttr('onclick');
					$("#previousBtn").removeAttr('onclick');						
				}

				if(currentPage == totalPage){
					$("#nextBtn").removeAttr('onclick');
					$("#lastBtn").removeAttr('onclick');						
				}
            </script>
          	
<!--           	<div class="row mt-5"> -->
<!-- 		          <div class="col text-center"> -->
<!-- 		            <div class="block-27"> -->
<!-- 		              <ul> -->
<!-- 		                <li><a class="previous" href="javascript:;" id="previousBtn" onclick="previousPage()">&lt;</a></li> -->
<!-- 		                <li class="active"><span>1</span></li> -->
<%-- 		                <c:forEach var="pages" begin="1" end="${totalPage}"> --%>
<%-- 		                <li id="${pages}" value="${pages}"><a href="#" onclick="return false" >${pages}</a></li> --%>
<%-- 		                </c:forEach> --%>
<!-- 		                <li><a class="next" href="javascript:;" id="nextBtn" onclick="nextPage()">&gt;</a></li> -->
<!-- 		              </ul> -->
<!-- 		            </div> -->
<!-- 		          </div> -->
<!-- 		        </div> -->
		        
		        		       
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" /> 