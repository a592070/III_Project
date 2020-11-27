<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="hotels" items="${hoteldata}">
            <tr>
				<td id="SN">${hotels.SN}</td>
                <td>${hotels.NAME}</td>
                <td>${hotels.REGION}</td>
                <td>${hotels.ADDRESS}</td>
                <td>${hotels.TYPE}</td>
<%-- 開關(綠色) --%><td id="STATUS"><label class="switch switch-text switch-success switch-pill form-control-label">
                	<c:choose>
                	  <c:when test="${hotels.STATUS eq '啟用'}">
	      				<input type="checkbox" name="status" class="switch-input form-check-input" id="checkbox" value="啟用" checked >
	      				<span class="switch-label" data-on="啟用" data-off="禁用"></span>
	      				<span class="switch-handle"></span>
	      			  </c:when>
	      			  <c:otherwise>
	      				<input type="checkbox" name="status" class="switch-input form-check-input"  id="checkbox" value="禁用" >
	      				<span class="switch-label" data-on="啟用" data-off="禁用"></span>
	      				<span class="switch-handle"></span>
	      			  </c:otherwise>
	      			</c:choose>
	      			</label></td> <%-- 開關(綠色) --%> 
                <td><button type="button" class="btn btn-warning mb-2"  onclick="clickdetail('${hotels.SN}')">修改</button></td>
               <td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter" onclick="clickdelete('${hotels.SN}')">刪除</button></td>
            </tr>
            </c:forEach>
            <script type="text/javascript">
				currentPage = ${hpage.currentPage};
				totalPage = ${hpage.totalPageCount};
				$("#page-btn").text(currentPage);

				if(currentPage == 1){
					$(".page-link.first").attr("disabled", true);
					$(".page-link.previous").attr("disabled", true);						
				}else{
					$(".page-link.first").attr("disabled", false);
					$(".page-link.previous").attr("disabled", false);
					}

				if(currentPage == totalPage){
					$(".page-link.last").attr("disabled", true);
					$(".page-link.next").attr("disabled", true);						
				}else{
					$(".page-link.last").attr("disabled", false);
					$(".page-link.next").attr("disabled", false);
					}
            </script>