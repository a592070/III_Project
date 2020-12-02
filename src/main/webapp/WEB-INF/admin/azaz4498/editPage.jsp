<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28s
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script> -->




<title>論壇管理</title>

<c:import url="/WEB-INF/admin/fragment/ref.jsp" />
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/Forum_ref.jsp" />

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
.ck-editor__editable_inline {
    min-height: 350px;
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
									<br />
									<div>
										<a href="${pageContext.servletContext.contextPath}/admin/Forum">回列表</a>
									</div>
								</div>

								<div class="card-body">
									<form id=edit_form action=${pageContext.servletContext.contextPath}/admin/edit.controller method="POST">
										<input type="hidden" name="artId" id="artId" value="${artBean[0].artId }">
										<input type="hidden" name="userid" value="${artBean[0].artUserId }">

										<div class="form-group">
											<label for="fname"><h3>標題</h3></label>
											<input type="text" name="articleTitle" id="title" class="form-control"
												value="${artBean[0].artTitle }">
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

										<div class="form-footer pt-4 pt-5 mt-4 border-top">
											<button type="button" class="btn btn-primary edit_btn" data-toggle="modal" data-target="#editModal">送出修改</button>
											<button class="btn btn-primary" onclick="redo()">重置</button>
											<button id="preview_btn" class="btn-primary btn" onclick="preview()">文章預覽</button>
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

	<!--modal-->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">確認修改文章內容</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					是否確認修改?
				</div>
				<div class="modal-footer">
					<button id="modal_confirm" type="button" class="btn btn-primary">確認</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!--modal End-->
	<script type="text/javascript">
		
		window.onload = getDefaultType();
		let currId = $("#artId").val();
		

		function getDefaultType() {//判斷文章類型 修改下拉選單預設值
			
			var typeSelect = document.getElementById("typeSelect");
			var options = typeSelect.getElementsByTagName("option");
			var selectedType = '${artBean[0].articleType.typeId}';
			console.log(selectedType);
			if(selectedType==0){
				options[8].selected = true;
			}else{
				options[selectedType].selected = true;
			};
			
		}

		//modal 確認後送出表單
		$("#modal_confirm").on("click",function(){
			$("#edit_form").submit();
		})
</script>
	
	

<script>
<!--editor config-->
	function MyCustomUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        return new MyUploadAdapter( loader );
    };}


		ClassicEditor
    		.create( document.querySelector( '#editor' ),{
				extraPlugins: [  MyCustomUploadAdapterPlugin ],
				toolbar: {
					items: [
						'heading',
						'|',
						'bold',
						'italic',
						'horizontalLine',
						'link',
						'bulletedList',
						'numberedList',
						'|',
						'imageUpload',
						'blockQuote',
						'mediaEmbed',
						'undo',
						'redo',
						'insertTable'
					]
				},
				language: 'zh',
				image: {
					toolbar: [
						'imageTextAlternative',
						'imageStyle:full',
						'imageStyle:side',
						'|',
						'imageStyle:alignLeft',
						'imageStyle:alignCenter',
						'imageStyle:alignRight',
					],
					styles:['full','alignLeft','alignCenter','alignRight','side']
				},
				table: {
					contentToolbar: [
						'tableColumn',
						'tableRow',
						'mergeTableCells'
					]
				},
				licenseKey: '', 

				ckfinder:{uploadUrl: '${pageContext.servletContext.contextPath}/admin/imgUpload/'+currId},
				
			
        	})
    		.then( editor => {
						//myEditor=editor;
						console.log( editor );
						this.editor = editor;
    		})
    		.catch( error => {
        				console.error( error );
    		
			});
			<!--editor config end-->
			<!--redo btn function-->
			function redo(){
				document.getElementById("title").value = "${artBean[0].artTitle }";
				editor.setData( '${artBean[0].artContent }');
				getDefaultType();
				event.preventDefault();
			}
			<!--redo btn function end-->
			<!--preview btn function-->
			function preview(){
			event.preventDefault();
			var artTitle = $("#title").val();
			var artType = $("#typeSelect").find(":selected").text();
			var artContent=editor.getData();
			console.log(artTitle);
			console.log(artType);
			console.log(artContent);
		}
			<!--preview btn function end-->
</script>
<script>
	<!--imgUploadApdater-->
	class MyUploadAdapter {
	constructor(loader) {
		this.loader = loader;
		this.upload=this.upload.bind(this);
		this.abort= this.abort.bind(this)
	}
	upload() {
		return this.loader.file
		.then(file=>new Promise((resolve, reject) => {
			const data = new FormData();
			
			data.append('upload', file);
			data.append('allowSize', 10);//允许图片上传的大小/兆
			$.ajax({
			url: 'imgUpload',
			type: 'POST',
			data: data,
			dataType: 'json',
			enctype : 'multipart/form-data',
			processData: false,
			contentType: false,
			success: function (data) {
						if (data.res) {
							resolve({ 
								default: data.url
								});
							} else { 
								reject(data.msg)
								;}
			}
				});
		
		}))
	}

abort() {
}
}
<!--imgUploadApdater End-->
</script>

	

</body>

</html>
