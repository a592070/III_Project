<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- import js -->
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />

<c:forEach var="comm" items="${comment}">
	<div class="review-item" id="${comm.com_id}">
		<div class="ri-pic">
			<img src="https://img.icons8.com/pastel-glyph/2x/person-male.png"
				alt="">
		</div>
		<div class="ri-text">
			<span>${comm.com_dateString}</span>
			<div class="rating" id="commrating${comm.com_id}"></div>
			<h5>${comm.username}</h5>
			<p>${comm.com_content}</p>
			<script>
				var commstar = Math.floor("${comm.rating}");
				console.log("star = " + commstar);
				var commtags = "";
				// 										var half = " <i class='icon_star-half_alt'></i>";
				var commzerostar = "";
				for (var i = 0; i < commstar; i++) {
					commtags += " <i class='icon_star'></i>";
				}
				for (var j = commstar; j < 5; j++) {
					commzerostar += " <i class='fa fa-star-o'></i>";
				}
				$("#commrating${comm.com_id}").prepend(commtags, commzerostar);
			</script>
		</div>
	</div>
</c:forEach>

<!-- import js -->
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
