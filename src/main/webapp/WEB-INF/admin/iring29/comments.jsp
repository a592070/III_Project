<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- import js -->
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />

<c:forEach var="comm" items="${comment}">
	<div class="review-item" id="${comm.com_id}">
		<div class="ri-pic">
			<img src="https://img.icons8.com/pastel-glyph/2x/person-male.png"
				alt="">
		</div>
		<div class="ri-text">
			<c:set var="time" value="${comm.com_date}" />
			<c:set var="datetime" value="${fn:substring(time, 0, 10)}" />
			<c:set var="hr_min" value="${fn:substring(time, 11, 16)}" />
			<span>${datetime}&emsp;${hr_min}</span>
			<div class="rating">
				<i class="icon_star"></i> <i class="icon_star"></i> <i
					class="icon_star"></i> <i class="icon_star"></i> <i
					class="icon_star-half_alt"></i>

			</div>
			<h5>name</h5>
			<p>${comm.com_content}</p>
		</div>
	</div>
</c:forEach>

<!-- import js -->
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
