<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="hotels" items="${hotelOdata}">
	<tr>
		<td class="Brid">${hotels.SN_ORDER}</td>
		<td class="rid">${hotels.ORDER_ID}</td>
		<td class="rname">${hotels.NAME}</td>
		<td>${hotels.DOUBLE_ROOM}</td>
		<td>${hotels.QUADRUPLE_ROOM}</td>
		<td>${hotels.CHECK_IN}</td>
		<td>${hotels.CHECK_OUT}</td>

		<c:if test="${hotels.CHECK_OUT > date}">
			<td><span class="badge badge-success">訂單待完成</span></td>
		</c:if>
		<c:if test="${hotels.CHECK_OUT < date}">
			<td><span class="badge badge-secondary">訂單已完成</span></td>
		</c:if>


		<td>
			<form
				action="<%=application.getContextPath()%>/admin/hotelOrderdetail"
				method="POST">
				<c:if test="${hotels.CHECK_OUT > date}">
				<Input type='hidden' name='detailsn' value='${hotels.SN_ORDER}'>
					<button type="submit" class="btn btn-warning">修改</button>
				</c:if>
				<c:if test="${hotels.CHECK_OUT < date}">
					<button type="submit" class="btn btn-warning" disabled>修改</button>
				</c:if>
			</form>
		</td>
		<td>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#訂單${hotels.SN_ORDER}">刪除</button> <!-- Modal -->
			<div class="modal fade" id="訂單${hotels.SN_ORDER}" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">刪除提醒</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">確認刪除飯店訂單 ${hotels.SN_ORDER} 資料？</div>
						<div class="modal-footer">
							<form id="statuss" name="statuss"
								action="<%=application.getContextPath()%>/admin/hotelOrderdelete"
								method="POST">
								<input type="hidden" value="${hotels.SN_ORDER}" name="deleteId">
								<button type="submit" class="btn btn-primary">確認</button>
								<Input type='hidden' name='rid' value='${hotels.SN_ORDER}'>
							</form>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</td>

	</tr>


</c:forEach>
<script type="text/javascript">
	currentPage = ${hpage.currentPage};
	totalPage = ${hpage.totalPageCount};
	$("#page-btn").text(currentPage + "/" + totalPage);

	if (currentPage == 1) {
		$(".page-link.first").attr("disabled", true);
		$(".page-link.previous").attr("disabled", true);
	} else {
		$(".page-link.first").attr("disabled", false);
		$(".page-link.previous").attr("disabled", false);
	}

	if (currentPage == totalPage) {
		$(".page-link.last").attr("disabled", true);
		$(".page-link.next").attr("disabled", true);
	} else {
		$(".page-link.last").attr("disabled", false);
		$(".page-link.next").attr("disabled", false);
	}
</script>