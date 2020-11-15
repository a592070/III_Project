<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
<title>論壇管理</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
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

</head>


<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">


	<div class="mobile-sticky-body-overlay"></div>

	<div class="wrapper">
		<c:import url="/WEB-INF/admin/fragment/sidebar.jsp" />
		<div class="page-wrapper">
			<c:import url="/WEB-INF/admin/fragment/header.jsp" />
			<div class="content-wrapper">
				<div class="content">
					<div class="row">
						<div class="col-lg-6">
							<div class="card card-default">
								<div class="card-header card-header-border-bottom">
									<h1>文章修改</h1>
								</div>
								
								<div class="card-body">
									<form action=edit.controller method="POST">
										<input type="hidden" name="artId" value="${artBean[0].artId }"> <input type="hidden" name="userid"
											value="${artBean[0].artUserId }">

										<div class="form-group">
											<label for="fname"><h3>標題</h3></label> <input type="text" name="articleTitle" id="title" onblur="showEditTitle()"
												class="form-control" value="${artBean[0].artTitle }">
										</div>
										<div class="form-group">
											<label for="typeSelect"><h3>分類</h3></label> <select class="form-control" id="typeSelect" name="typeSelect">
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
										</div>
										<div class="form-group">
											<label for="content"><h3>內容</h3></label>
											<textarea class="form-control" id="editor" rows="15" name="articleContent">${artBean[0].artContent }</textarea>
										</div>

										<!-- <div class="form-group">
											<label for="exampleFormControlFile1">Example file
												input</label> <input type="file" class="form-control-file"
												id="exampleFormControlFile1">
										</div> -->
										<div class="form-footer pt-4 pt-5 mt-4 border-top">
											<button type="submit" class="btn btn-primary btn-default">送出修改</button>
											<!-- <button type="submit" class="btn btn-secondary btn-default">Cancel</button> -->
										</div>

									</form>
								</div>
							</div>




						</div>

					</div>
				</div>




			</div>


		</div>
	</div>
	<script type="text/javascript">
		window.onload = getDefaultType();

		function getDefaultType() {//判斷文章類型 修改下拉選單預設值
			var typeSelect = document.getElementById("typeSelect");
			var options = typeSelect.getElementsByTagName("option");
			var selectedType = ${artBean[0].articleType.typeId}-1;
			console.log(selectedType);
			options[selectedType].selected = true;
		}

		function showEditTitle() {
			var originTitle = document.getElementById("title").value;
			if (originTitle == "${artBean[0].artTitle }") {
			} else {
				var choice = confirm("確定要將標題修改為:\n"
						+ document.getElementById("title").value);
				if (choice) {

				} else
					document.getElementById("title").value = "${artBean[0].artTitle }";
			}
			

		}
		 
         
 	</script>
	<script>
		ClassicEditor
    		.create( document.querySelector( '#editor' ))
    		.then( editor => {
        				console.log( editor );
    		})
    		.catch( error => {
        				console.error( error );
    		} );
 	</script>


	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>



</body>

</html>
