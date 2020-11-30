<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- Created by IntelliJ IDEA.
User: Student Date: 2020/10/29 Time: 上午 09:28 To change this template use File
| Settings | File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>論壇管理</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<c:import url="/WEB-INF/admin/fragment/Forum_ref.jsp" />
<style>
.sp_search-1 {
	float: left;
}

.box {
	display: flex;
}

.search {
	padding-right: 30px;
}

input {
	height: 40px;
}

.sp_search {
	padding: 10px;
	float: left;
}

select {
	float: left;
}

#inputState.form-control {
	width: 200px;
	padding-left: 20px;
}

h2 {
	padding-top: 30px;
	padding-bottom: 30px;
}

.content-wrapper {
	padding-left: 50px;
	padding-top: 50px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/css/theme.bootstrap_4.min.css"
	integrity="sha512-2C6AmJKgt4B+bQc08/TwUeFKkq8CsBNlTaNcNgUmsDJSU1Fg+R6azDbho+ZzuxEkJnCjLZQMozSq3y97ZmgwjA=="
	crossorigin="anonymous" />



</script>
</head>

<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
	
	

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="d-flex justify-content-between">
					<div class="form-inline">
						<input type="text" class="form-control keyword_input" placeholder="輸入文章標題或作者..." aria-label="search" name="keyword" />
						<input type="hidden" value="${articleType }" name="articleType" />
						<button id="search_btn">
							<span class="input-group-text bg-primary text-white"> 搜尋 </span>
						</button>
						<button id="clear_btn">
							<a class="input-group-text bg-primary text-white" href="${pageContext.servletContext.contextPath}/Forum"> 清空搜尋條件 </a>
						</button>
					</div>
					<form method="GET" class="mr-5">
						<select name="articleType" id="typeSelect" class="form-control">
							<option value="">選擇類型</option>
							<option value="1">旅遊</option>
							<option value="2">住宿</option>
							<option value="3">美食</option>
							<option value="4">景點</option>
							<option value="5">交通</option>
							<option value="6">行程</option>
							<option value="7">購物</option>
							<option value="0">其他</option>
						</select>
					</form>
				</div>



				<!-- </div> -->
				<h2>文章列表</h2>
				
				<div class="box">
					<div class="table-responsive">
						<table class="table table-striped table-sm tablesorter" id="articleTable">
							<thead>
								<tr>
									<th><span class="mdi mdi-key"></span> ID</th>
									<th width="40%"><span class="mdi mdi-tag-text-outline"></span> 標題</th>
									<th><span class="mdi mdi-calendar-clock"></span> 建立時間</th>
									<th><span class="mdi mdi-account-edit"></span> 作者</th>
									<th><span class="mdi mdi-directions-fork"></span> 類型</th>
									<th class="sorter-checkbox"><span class="mdi mdi-information-outline"></span>狀態</th>
									<th class="text-left"><span class="mdi mdi-settings"></span>設定</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
						<nav aria-label="Page navigation example" class="pager">
							<ul class="pagination">
								<li class="page-item first"><a class="page-link first" id="first">第一頁</a></li>
								<li class="page-item prev"><a class="page-link prev" id="previous">&#060&#060</a></li>

								<li class="page-item">
								<a class="page-link pagedisplay bg-primary text-white"></a>
										</li>


								<li class="page-item next"><a class="page-link next" id="next">&#062&#062</a></li>
								<li class="page-item last"><a class="page-link last" id="last">最末頁</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--modal-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">確認刪除</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					是否確認刪除?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-pill">確認</button>
					<button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		//文章列表
		$(document)
				.ready(
						function() {
							$.ajax({
								type : "GET",
								url : "Article.controller.json",
								success : function(response) {
									showList(response);
								},
							});

							// 搜尋文章(類別)
							$("#typeSelect")
									.change(
											function() {
												var selected = $(
														"#typeSelect :selected")
														.val();
												var keyword = $(
														".keyword_input").val();
												$
														.ajax({
															type : "GET",
															url : "articleSearch.json",
															data : {
																articleType : selected,
																keyword : keyword
															},
															success : function(
																	response) {
																showList(response);
															},
														});
											});
							//刪除文章
							

							$("tbody").on("click", ".delete_btn", function() {
								var currId = $(this).val();
								$(".modal-body").text("確認要刪除 ID為 "+currId+"的資料");
								if (desicion) {
									$(this).closest("tr").remove();
									$.ajax({
										type : "POST",
										url : "delete.controller",
										data : {
											artId : currId
										},
										success : function(response) {
										},
									});
								} else {
									return;
								}
							});
							//編輯文章
							$("tbody")
									.on(
											"click",
											".edit_btn",
											function() {
												var currId = $(this).val();

												$
														.ajax({
															type : "GET",
															url : "editPage.controller",
															data : {
																artId : currId
															},
															success : function(
																	response) {
																window.location.href = "editPage.controller?artId="
																		+ currId;
															},
														});
											});
							//更改status
							$("tbody").on(
									"click",
									"#status",
									function() {
										var currId = $(this).closest("tr")
												.children().first().text();
										$.ajax({
											type : "POST",
											url : "statusChange.controller",
											data : {
												artId : currId
											},
											success : function(response) {
											},
										});
									});
							//搜尋文章
							$("#search_btn").click(function() {
								var keyword = $(".keyword_input").val();
								var type = $("#typeSelect :selected").val();
								console.log(keyword);
								$.ajax({
									type : "GET",
									url : "articleSearch.json",
									data : {
										keyword : keyword,
										articleType : type
									},
									success : function(response) {
										console.log(response);
										showList(response);
									},
								});
							});
						});
	</script>

	
	<script>
		function showList(response) {
			$("tbody").empty();
			$
					.each(
							response,
							function(index, element) {
								var currStatus = element.artStatus;

								$("tbody")
										.append(
												"<tr>" + "<td>"
														+ element.artId
														+ "</td>"
														+ "<td>"
														+ "<a class='text-dark' href=''>"
														+ element.artTitle
														+ "</a></td>"
														+ "<td>"
														+ element.artCreTime
														+ "</td>"
														+ "<td>"
														+ "<a class='text-dark' href=''>"
														+ element.artUserId
														+ "</a></td>"
														+ "<td>"
														+ element.articleType.typeName
														+ "</td>"
														+ "<td><label class='switch switch-success switch-pill switch-text form-control-label'>"
														+ "<input type='checkbox' class='switch-input form-check-input' name='status' id='status' value='"
														+ element.artStatus
														+ "'"
														+ (currStatus == "enabled" ? "checked"
																: "")
														+ ">"
														+ "<span class='switch-label' data-on='啟用' data-off='禁用'></span>"
														+ "<span class='switch-handle'></span>"
														+ "</label></td>"
														+ "<td>"
														+ "<button class='edit_btn btn btn-warning mr-2' name='artId' value='" +
              element.artId +
              "'>"
														+ "<span class='mdi mdi-pencil-box-outline'></span>修改</button>"
														+ "<button class='delete_btn btn btn-danger' data-toggle='modal' data-target='#deleteModal' name='artId' value='" +
              element.artId +
              "'>"
														+ "<span class='mdi mdi-delete'></span>刪除</button>"
														+ "</td>" + "</tr>");
							});

			//table sorter
			$(function() {
				var resort = true;
				$("#articleTable").trigger("updateAll", [ resort ]);

				$("#articleTable").tablesorter({
					theme : "bootstrap",
					checkboxClss : "checked",
					sortReset : true,
					sortRestart : true,
					debug : true,
					headers : {
						1 : {
							sorter : false
						},
						6 : {
							sorter : false
						},
						5 : {
							sorter : "checkbox"
						},

					}
				})
				//分頁
				.tablesorterPager({
					container : $(".pager"),
					page : 0,
					size : 10,
					cssNext : ".next", // next page arrow
					cssPrev : ".prev", // previous page arrow
					cssFirst : ".first", // go to first page arrow
					cssLast : ".last", // go to last page arrow
					cssGoto : ".gotoPage", // select dropdown to allow choosing a page
					cssPageDisplay : ".pagedisplay", // location of where the "output" is displayed
					cssPageSize : ".pagesize", // page size selector - select dropdown that sets the "size" option});
					output : "{page}/{totalPages}",
					cssDisabled : "disabled", // Note there is no period "." in front of this class name

				});

			});
		}
	</script>
</body>
</html>
