<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="a" items="${userList}">
	<tr>
		<td id="username">${a.userName}</td>
		<td>${a.iName}</td>
		<td>${a.email}</td>
		<td>${a.registerString}</td>
		<td>${a.modify_DateString}</td>
		<td id="status"><c:choose>
				<c:when test="${a.status == '啟用'}">
					<label
						class="switch switch-text switch-success switch-pill form-control-label">
						<input type="checkbox" class="switch-input form-check-input"
						id="checkbox" value="啟用" checked="checked"> <span
						class="switch-label" data-on="啟用" data-off="禁用"></span> <span
						class="switch-handle"></span>
					</label>
				</c:when>
				<c:otherwise>
					<label
						class="switch switch-text switch-success switch-pill form-control-label">
						<input type="checkbox" class="switch-input form-check-input"
						id="checkbox" value="禁用"> <span class="switch-label"
						data-on="啟用" data-off="禁用"></span> <span class="switch-handle"></span>
					</label>
				</c:otherwise>
			</c:choose></td>
		<td>
			<form action="<%=application.getContextPath()%>/admin/displayAccount"
				method="POST">
				<button type="submit" class="btn btn-warning">修改</button>
				<button type="button" id="delAcc" class="btn btn-danger">刪除</button>
				<Input type='hidden' name='username' value='${a.userName}'>
			</form>
		</td>
	</tr>
</c:forEach>
