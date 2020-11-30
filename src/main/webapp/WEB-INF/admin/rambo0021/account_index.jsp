<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>用戶清單</title>
<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<style>
th, td {
	text-align: center;
}
</style>
</head>

<body class="sidebar-fixed sidebar-dark header-light header-fixed"
	id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper content row ">
<!-- 				<div class=""> -->
<!-- 					<div class=""> -->
						<div class="box col-12">
<!-- 							<div class=" "> -->
								<div class="mx-auto my-3" style="width: 1200px">
									<form class="form-inline" action="hotelselect" method="GET">
										<div class="form-group mb-2">
											<h5>帳號搜尋:</h5>
										</div>
										<div class="form-group mx-sm-3 mb-2">
											<input type="text" class="form-control" id="namekeyword"
												name="namekeyword" placeholder="請輸入帳號" style="width: 140px;">
										</div>
										<div class="form-group col-md-2">
											<div class="form-group mb-2">
												<h5>身分:</h5>
												<select id="idkeyword" class="form-control" name="idkeyword">
													<option value="" id="defaultId">請選擇..</option>
													<c:forEach var="i" items="${idList}">
														<option value="${i.name}">${i.name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group mb-2">
											<h5>email搜尋:</h5>
										</div>
										<div class="form-group mx-sm-3 mb-2">
											<input type="text" class="form-control" id="emailkeyword"
												name="emailkeyword" placeholder="請輸入email"
												style="width: 140px;">
										</div>
										<div>
											<button type="button" class="btn btn-primary"
												value="delsearch" name="delsearch" id="delsearch">重置條件</button>
										</div>
										<div>
											<button type="button" class="btn btn-success"
												onclick="location.href='${pageContext.servletContext.contextPath}/admin/createAccountPage'">新增帳號</button>
										</div>
									</form>
								</div>
								<div>
									<h2>用戶列表</h2>
									<div class="table-responsive" id="appendbody">
										<table class="table table-striped table-sm" id="table">
											<thead>
												<tr>
													<th>帳號<i class="fa fa-fw fa-sort" id="uSort"></i></th>
													<th>身分<i class="fa fa-fw fa-sort" id="iSort"></i></th>
													<th>email<i class="fa fa-fw fa-sort" id="eSort"></i></th>
													<th>註冊日期<i class="fa fa-fw fa-sort" id="rSort"></i></th>
													<th>修改日期<i class="fa fa-fw fa-sort" id="mSort"></i></th>
													<th>狀態</th>
													<th>功能</th>
												</tr>
											</thead>
											<tbody id="tbody">
												<c:forEach var="a" items="${userList}">
													<tr>
														<td id="username">${a.userName}</td>
														<td>${a.identityBean.name}</td>
														<td>${a.email}</td>
														<td>${a.registerString}</td>
														<td>${a.modify_DateString}</td>
														<td id="status"><c:choose>
																<c:when test="${a.status == '啟用'}">
																	<label
																		class="switch switch-text switch-success switch-pill form-control-label">
																		<input type="checkbox"
																		class="switch-input form-check-input" id="checkbox"
																		value="啟用" checked="checked"> <span
																		class="switch-label" data-on="啟用" data-off="禁用"></span>
																		<span class="switch-handle"></span>
																	</label>
																</c:when>
																<c:otherwise>
																	<label
																		class="switch switch-text switch-success switch-pill form-control-label">
																		<input type="checkbox"
																		class="switch-input form-check-input" id="checkbox"
																		value="禁用"> <span class="switch-label"
																		data-on="啟用" data-off="禁用"></span> <span
																		class="switch-handle"></span>
																	</label>
																</c:otherwise>
															</c:choose></td>
														<td>
															<form
																action="<%=application.getContextPath()%>/admin/displayAccountPage"
																method="POST">
																<button type="submit" class="btn btn-warning">修改</button>
																<button type="button" id="delAcc" class="btn btn-danger">刪除</button>
																<Input type='hidden' name='username'
																	value='${a.userName}'>
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
															<button class="page-link previous"
																id="page-botton-previous" value="previous">&laquo;</button>
														</li>
													</c:if>

													<!-- current page -->
													<li class="page-item active">
														<button class="page-link" class="sr-only" id="page-btn"
															name="currentPage" value="${page.currentPage}">${page.currentPage}/${page.totalPageCount}</button>
													</li>

													<c:if test="${page.currentPage ne page.totalPageCount}">
														<!-- NEXT -->
														<li class="page-item">
															<button class="page-link next" id="page-botton-next"
																value="next">&raquo;</button>
														</li>
													</c:if>


													<li class="page-item last">
														<button class="page-link last" id="page-botton-last"
															value="${page.totalPageCount}">最末頁</button>
													</li>
													<!-- 									<li class="page-item last"> -->
													<%-- 										<span>結果${page.totalCount}筆,共${page.totalPageCount}頁</span> --%>
													<!-- 									</li> -->
												</ul>
											</nav>
<!-- 										</div> -->
									</div>
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#delModalCenter" style="display: none" id="modal">
	</button>

	<!-- Modal -->
	<div class="modal fade" id="delModalCenter" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"
						style="color: black;">刪除帳號</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body"
					style="color: black; text-align: center;"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="confirm">確認</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		//刪除帳號資料
		$("#appendbody")
				.on(
						'click',
						'#delAcc',
						function() {
							console.log("刪除");

							var username = $(this).closest('td').siblings(
									"#username").text()
							var deltr = $(this).closest('tr');
							$("#modal").click();
							$("#modal-body").text(
									"是否確定要刪除 " + username + " 帳號資料?")
							$("#confirm")
									.click(
											function() {
												$
														.ajax({
															type : 'POST',
															data : {
																"username" : username
															},
															url : '${pageContext.servletContext.contextPath}/admin/delAccount',
															dataType : 'text',
															success : function(
																	response) {
																console
																		.log(response)
																$("#close")
																		.click()
																deltr.remove();
															}

														})
											})

						})
		//啟用 禁用 checkbox
		$("#appendbody")
				.on(
						'change',
						'#checkbox',
						function() {
							var status = $(this).val();
							if (status == "啟用") {
								console.log("禁用帳號")
								var username = $(this).closest('td').siblings(
										"#username").text()
								var cgstatus = "禁用"
								$(this).val(cgstatus)
								$
										.ajax({
											type : 'POST',
											data : {
												"username" : username,
												"status" : cgstatus
											},
											url : '${pageContext.servletContext.contextPath}/admin/disableAccount',
											dataType : 'text',
											success : function(response) {
												console.log(response)

											}
										})

							} else {
								console.log("啟用帳號")
								var username = $(this).closest('td').siblings(
										"#username").text()
								var cgstatus = "啟用"
								$(this).val(cgstatus)
								$
										.ajax({
											type : 'POST',
											data : {
												"username" : username,
												"status" : cgstatus
											},
											url : '${pageContext.servletContext.contextPath}/admin/enableAccount',
											dataType : 'text',
											success : function(response) {
												console.log(response)

											}

										})
							}
						})
		//username email搜尋
		$("#namekeyword,#emailkeyword").keyup(function() {
			console.log("input搜尋")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()

			var uSort = $("#uSort").attr("class").substring(17, 21)
			var eSort = $("#eSort").attr("class").substring(17, 21)
			var rSort = $("#rSort").attr("class").substring(17, 21)
			var iSort = $("#iSort").attr("class").substring(17, 21)
			var mSort = $("#mSort").attr("class").substring(17, 21)
			$.ajax({
				type : 'POST',
				data : {
					"username" : username,
					"identity" : identity,
					"email" : email,
					"uSort" : uSort,
					"eSort" : eSort,
					"rSort" : rSort,
					"iSort" : iSort,
					"mSort" : mSort
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})
		})
		//身分搜尋
		$("#idkeyword").change(function() {
			console.log("select搜尋")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()

			var uSort = $("#uSort").attr("class").substring(17, 21)
			var eSort = $("#eSort").attr("class").substring(17, 21)
			var rSort = $("#rSort").attr("class").substring(17, 21)
			var iSort = $("#iSort").attr("class").substring(17, 21)
			var mSort = $("#mSort").attr("class").substring(17, 21)
			$.ajax({
				type : 'POST',
				data : {
					"username" : username,
					"identity" : identity,
					"email" : email,
					"uSort" : uSort,
					"eSort" : eSort,
					"rSort" : rSort,
					"iSort" : iSort,
					"mSort" : mSort
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})
		})
		//重置
		$("#delsearch").click(function() {
			console.log("reset")
			$("#namekeyword").val("");
			$("#idkeyword").val("");
			$("#emailkeyword").val("");
			$.ajax({
				type : 'POST',
				data : {
					"username" : "",
					"identity" : "",
					"email" : ""
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})
		})
		//第一頁
		$("#appendbody").on('click', '#page-botton-first', function() {
			console.log("第一頁")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			var currentPage = 1

			var uSort = $("#uSort").attr("class").substring(17, 21)
			var eSort = $("#eSort").attr("class").substring(17, 21)
			var rSort = $("#rSort").attr("class").substring(17, 21)
			var iSort = $("#iSort").attr("class").substring(17, 21)
			var mSort = $("#mSort").attr("class").substring(17, 21)
			$.ajax({
				type : 'POST',
				data : {
					"username" : username,
					"identity" : identity,
					"email" : email,
					"currentPage" : currentPage,
					"uSort" : uSort,
					"eSort" : eSort,
					"rSort" : rSort,
					"iSort" : iSort,
					"mSort" : mSort
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})

		})
		//前一頁
		$("#appendbody").on('click', '#page-botton-previous', function() {
			console.log("前一頁")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			var currentPage = parseInt($("#page-btn").val()) - 1

			var uSort = $("#uSort").attr("class").substring(17, 21)
			var eSort = $("#eSort").attr("class").substring(17, 21)
			var rSort = $("#rSort").attr("class").substring(17, 21)
			var iSort = $("#iSort").attr("class").substring(17, 21)
			var mSort = $("#mSort").attr("class").substring(17, 21)
			$.ajax({
				type : 'POST',
				data : {
					"username" : username,
					"identity" : identity,
					"email" : email,
					"currentPage" : currentPage,
					"uSort" : uSort,
					"eSort" : eSort,
					"rSort" : rSort,
					"iSort" : iSort,
					"mSort" : mSort
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})

		})

		//後一頁
		$("#appendbody").on('click', '#page-botton-next', function() {
			console.log("後一頁")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			var currentPage = parseInt($("#page-btn").val()) + 1

			var uSort = $("#uSort").attr("class").substring(17, 21)
			var eSort = $("#eSort").attr("class").substring(17, 21)
			var rSort = $("#rSort").attr("class").substring(17, 21)
			var iSort = $("#iSort").attr("class").substring(17, 21)
			var mSort = $("#mSort").attr("class").substring(17, 21)
			$.ajax({
				type : 'POST',
				data : {
					"username" : username,
					"identity" : identity,
					"email" : email,
					"currentPage" : currentPage,
					"uSort" : uSort,
					"eSort" : eSort,
					"rSort" : rSort,
					"iSort" : iSort,
					"mSort" : mSort
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})

		})
		//最末頁
		$("#appendbody").on('click', '#page-botton-last', function() {
			console.log("最末頁")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			var currentPage = $("#page-botton-last").val()

			var uSort = $("#uSort").attr("class").substring(17, 21)
			var eSort = $("#eSort").attr("class").substring(17, 21)
			var rSort = $("#rSort").attr("class").substring(17, 21)
			var iSort = $("#iSort").attr("class").substring(17, 21)
			var mSort = $("#mSort").attr("class").substring(17, 21)
			$.ajax({
				type : 'POST',
				data : {
					"username" : username,
					"identity" : identity,
					"email" : email,
					"currentPage" : currentPage,
					"uSort" : uSort,
					"eSort" : eSort,
					"rSort" : rSort,
					"iSort" : iSort,
					"mSort" : mSort
				},
				url : '${pageContext.servletContext.contextPath}/admin/search',
				dataType : 'html',
				success : function(response) {
					$("#appendbody").children().remove();
					$("#appendbody").append(response)

				}

			})

		})
		//帳號排序
		$("#appendbody")
				.on(
						'click',
						'#uSort,#eSort,#rSort,#iSort,#mSort',
						function() {
							console.log("排序")
							if ($(this).attr("class") == "fa fa-fw fa-sort") {
								$(this).attr("class", "fa fa-fw fa-sort-asc")
								$(this).val("asc")
							} else if ($(this).attr("class") == "fa fa-fw fa-sort-asc") {
								$(this).attr("class", "fa fa-fw fa-sort-desc")
								$(this).val("desc")
							} else if ($(this).attr("class") == "fa fa-fw fa-sort-desc") {
								$(this).attr("class", "fa fa-fw fa-sort")
								$(this).val("default")
							}
							var uSort = $("#uSort").attr("class").substring(17,
									21)
							var eSort = $("#eSort").attr("class").substring(17,
									21)
							var rSort = $("#rSort").attr("class").substring(17,
									21)
							var iSort = $("#iSort").attr("class").substring(17,
									21)
							var mSort = $("#mSort").attr("class").substring(17,
									21)

							var username = $("#namekeyword").val()
							var identity = $("#idkeyword").val()
							var email = $("#emailkeyword").val()

							var currentPage = parseInt($("#page-btn").val())

							$
									.ajax({
										type : 'POST',
										data : {
											"username" : username,
											"identity" : identity,
											"email" : email,
											"currentPage" : currentPage,
											"uSort" : uSort,
											"eSort" : eSort,
											"rSort" : rSort,
											"iSort" : iSort,
											"mSort" : mSort
										},
										url : '${pageContext.servletContext.contextPath}/admin/search',
										dataType : 'html',
										success : function(response) {
											$("#appendbody").children()
													.remove();
											$("#appendbody").append(response)

										}

									})

						})
	</script>
</body>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>用戶清單</title>
	<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="mx-auto my-3" style="width: 1100px">
					<form class="form-inline" action="hotelselect" method="GET">
						<div class="form-group mb-2">
							<h5>帳號搜尋:</h5>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input type="text" class="form-control" id="namekeyword" name="namekeyword"
								placeholder="請輸入帳號">
						</div>
						<div class="form-group col-md-2">
							<div class="form-group mb-2">
								<h5>身分:</h5>
								<select id="idkeyword" class="form-control" name="idkeyword">
									<option value="" id="defaultId">請選擇..</option>
									<option value="管理員">管理員</option>
									<option value="一般會員">一般會員</option>
									<option value="餐廳業者">餐廳業者</option>
									<option value="住宿業者">住宿業者</option>
									<option value="交通業者">交通業者</option>
								</select>
							</div>				
						</div>
						<div class="form-group mb-2">
							<h5>email搜尋:</h5>
						</div>
						<div class="form-group mx-sm-3 mb-2">
							<input type="text" class="form-control" id="emailkeyword" name="emailkeyword"
								placeholder="請輸入email">
						</div>

						<button type="button" class="btn btn-primary mb-2" value="delsearch" name="delsearch"
							id="delsearch">重置搜尋</button>
					</form>
				</div>
				<div>
					<h2>用戶列表</h2>
					<div class="table-responsive" id="appendbody">
						<table class="table table-striped table-sm" id="table">
							<thead>
								<tr>
									<th>帳號<i class="fa fa-fw fa-sort" id="uSort"></i></th>
									<th>身分<i class="fa fa-fw fa-sort" id="iSort"></i></th>
									<th>email<i class="fa fa-fw fa-sort" id="eSort"></i></th>
									<th>註冊日期<i class="fa fa-fw fa-sort" id="rSort"></i></th>
									<th>修改日期<i class="fa fa-fw fa-sort" id="mSort"></i></th>
									<th>狀態</th>
									<th>功能</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach var="a" items="${userList}">
									<tr>
										<td id="username">${a.userName}</td>
										<td>${a.identityBean.name}</td>
										<td>${a.email}</td>
										<td>${a.registerString}</td>
										<td>${a.modify_DateString}</td>
										<td id="status">
											<c:choose>
												<c:when test="${a.status == '啟用'}">
													<label
														class="switch switch-text switch-success switch-pill form-control-label">
														<input type="checkbox" class="switch-input form-check-input"
															id="checkbox" value="啟用" checked="checked">
														<span class="switch-label" data-on="啟用" data-off="禁用"></span>
														<span class="switch-handle"></span>
													</label>
												</c:when>
												<c:otherwise>
													<label
														class="switch switch-text switch-success switch-pill form-control-label">
														<input type="checkbox" class="switch-input form-check-input"
															id="checkbox" value="禁用">
														<span class="switch-label" data-on="啟用" data-off="禁用"></span>
														<span class="switch-handle"></span>
													</label>
												</c:otherwise>
											</c:choose>
										</td>
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
									<button class="page-link previous" id="page-botton-previous" value="previous">&laquo;</button>
								</li>
							</c:if>
							
							<!-- current page -->
								<li class="page-item active">
									<button class="page-link" class="sr-only" id="page-btn" name="currentPage" value="${page.currentPage}">${page.currentPage}</button>
								</li>
						   
						   <c:if test="${page.currentPage ne page.totalPageCount}">
							<!-- NEXT -->
								<li class="page-item">
									<button class="page-link next" id="page-botton-next" value="next">&raquo;</button>
								</li>
							</c:if>
							
							
								<li class="page-item last">
									<button class="page-link last" id="page-botton-last" value="${page.totalPageCount}">最末頁</button>
								</li>
								<li class="page-item last">
								     <span>結果${page.totalCount}筆,共${page.totalPageCount}頁</span>	
								</li>			
					</ul>
				</nav>
			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		//刪除帳號資料
		$("#appendbody").on('click', '#delAcc', function () {

			if (confirm("確定要刪除此筆資料?")) {
				var username = $(this).closest('td').siblings("#username").text()
				$(this).closest('tr').remove();
				$.ajax(
					{
						type: 'POST',
						data: { "username": username },
						url: '${pageContext.servletContext.contextPath}/admin/delAccount',
						dataType: 'text',
						success: function (response) {
							alert(response)

						}

					}
				)
			}
		})
		//啟用 禁用 checkbox
		$("#appendbody").on('change', '#checkbox', function () {
			var status = $(this).val();
			if (status == "啟用") {
				console.log("禁用帳號")
				var username = $(this).closest('td').siblings("#username").text()
				var cgstatus = "禁用"
				$(this).val(cgstatus)
				$.ajax(
					{
						type: 'POST',
						data: { "username": username, "status": cgstatus },
						url: '${pageContext.servletContext.contextPath}/admin/disableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}
					}
				)

			} else {
				console.log("啟用帳號")
				var username = $(this).closest('td').siblings("#username").text()
				var cgstatus = "啟用"
				$(this).val(cgstatus)
				$.ajax(
					{
						type: 'POST',
						data: { "username": username, "status": cgstatus },
						url: '${pageContext.servletContext.contextPath}/admin/enableAccount',
						dataType: 'text',
						success: function (response) {
							console.log(response)

						}

					}
				)
			}
		})
		//username email搜尋
		$("#namekeyword,#emailkeyword").keyup(function () {
			console.log("input搜尋")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			
			$.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity, "email" : email },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)
		})
		//身分搜尋
		$("#idkeyword").change(function () {
			console.log("select搜尋")
			var username = $("#namekeyword").val()
			var identity = $("#idkeyword").val()
			var email = $("#emailkeyword").val()
			
			$.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity, "email" : email },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)
		})
		//重置搜尋
		$("#delsearch").click(function(){
			console.log("reset")
			$("#namekeyword").val("");
            $("#idkeyword").val("");
			$("#emailkeyword").val("");
			$.ajax(
					{
						type: 'POST',
						data: { "username": "", "identity": "", "email" : "" },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)
		})
		//第一頁
		$("#appendbody").on('click', '#page-botton-first', function (){
           console.log("第一頁")
		   var username = $("#namekeyword").val()
		   var identity = $("#idkeyword").val()
		   var email = $("#emailkeyword").val()
		   var currentPage=1
		   $.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity , "email" : email ,"currentPage": currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)


		}) 
		//前一頁
		$("#appendbody").on('click', '#page-botton-previous', function (){
           console.log("前一頁")
		   var username = $("#namekeyword").val()
		   var identity = $("#idkeyword").val()
		   var email = $("#emailkeyword").val()
		   var currentPage=parseInt($("#page-btn").val())-1
		   $.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity , "email" : email ,"currentPage": currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)


		}) 

		//後一頁
		$("#appendbody").on('click', '#page-botton-next', function (){
           console.log("後一頁")
		   var username = $("#namekeyword").val()
		   var identity = $("#idkeyword").val()
		   var email = $("#emailkeyword").val()
		   var currentPage=parseInt($("#page-btn").val())+1
		   $.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity , "email" : email ,"currentPage": currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)


		}) 
		//最末頁
		$("#appendbody").on('click', '#page-botton-last', function (){
           console.log("最末頁")
		   var username = $("#namekeyword").val()
		   var identity = $("#idkeyword").val()
		   var email = $("#emailkeyword").val()
		   var currentPage=$("#page-botton-last").val()
		   $.ajax(
					{
						type: 'POST',
						data: { "username": username, "identity": identity , "email" : email ,"currentPage": currentPage },
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)


		}) 
		//帳號排序
		$("#appendbody").on('click','#uSort,#eSort,#rSort,#iSort,#mSort',function(){
			console.log("排序")
			if($(this).attr("class") == "fa fa-fw fa-sort"){
				$(this).attr("class","fa fa-fw fa-sort-asc")
				$(this).val("asc")
			}else if($(this).attr("class") == "fa fa-fw fa-sort-asc"){
				$(this).attr("class","fa fa-fw fa-sort-desc")
				$(this).val("desc")
			}else if($(this).attr("class") == "fa fa-fw fa-sort-desc"){
				$(this).attr("class","fa fa-fw fa-sort")
				$(this).val("default")
			}
			var uSort = $("#uSort").val()
			var eSort = $("#eSort").val()
			var rSort = $("#rSort").val()
			var iSort = $("#iSort").val()
			var mSort = $("#mSort").val()

		   var username = $("#namekeyword").val()
		   var identity = $("#idkeyword").val()
		   var email = $("#emailkeyword").val()

		   $.ajax(
					{
						type: 'POST',
						data: { "username": username, 
						        "identity": identity, 
								"email" : email,
								"uSort" : uSort,
								"eSort" : eSort,
								"rSort" : rSort,
								"iSort": iSort,
								"mSort": mSort
								},
						url: '${pageContext.servletContext.contextPath}/admin/search',
						dataType: 'html',
						success: function (response) {
							$("#appendbody").children().remove();
							$("#appendbody").append(response)

						}

					}
				)
			
		})

	</script>
</body>

>>>>>>> parent of 279278d... Merge pull request #143 from a592070/dev_rambo0021
</html>