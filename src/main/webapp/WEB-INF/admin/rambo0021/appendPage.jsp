<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-striped table-sm" id="table">
	<thead>
		<tr>
			<th>帳號</th>
			<th>身分</th>
			<th>email</th>
			<th>註冊日期</th>
			<th>修改日期</th>
			<th>狀態</th>
			<th>功能</th>
		</tr>
	</thead>
	<tbody id="tbody">
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
					<form
						action="<%=application.getContextPath()%>/admin/displayAccount"
						method="POST">
						<button type="submit" class="btn btn-warning">修改</button>
						<button type="button" id="delAcc" class="btn btn-danger">刪除</button>
						<Input type='hidden' name='username' value='${a.userName}'>
					</form>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="pages">
	<nav aria-label="..." id='nav'>
		<ul class="pagination">

			<li class="page-item">
				<button class="page-link" id="page-botton-first" value="1">第一頁</button>
			</li>

			<c:if test="${page.currentPage ne 1}">
				<!-- previous -->
				<li class="page-item">
					<button class="page-link previous" id="page-botton-previous"
						value="previous">&laquo;</button>
				</li>
			</c:if>

			<!-- current page -->
			<li class="page-item active">
				<button class="page-link" class="sr-only" id="page-btn"
					name="currentPage" value="${page.currentPage}">${page.currentPage}</button>
			</li>

			<c:if test="${page.currentPage ne page.totalPageCount}">
				<!-- NEXT -->
				<li class="page-item">
					<button class="page-link next" id="page-botton-next" value="next">&raquo;</button>
				</li>
			</c:if>


			<li class="page-item last">
				<button class="page-link last" id="page-botton-last"
					value="${page.totalPageCount}">最末頁</button>
			</li>
			<li class="page-item last"><span>結果${page.totalCount}筆,共${page.totalPageCount}頁</span>
			</li>
		</ul>
	</nav>
</div>