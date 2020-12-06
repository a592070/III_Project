<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>





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
	min-width: 600px;
}
.ck-editor__top {
        min-width: 600px;
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
							<div class="card card-default" style="width: 1000px;">
								<div class="card-header card-header-border-bottom">
									<h1>文章新增</h1>
									<br />
									<div>
										<a href="${pageContext.servletContext.contextPath}/admin/Forum">回列表</a>
									</div>
								</div>

								<div class="card-body">
									<form id=edit_form action=${pageContext.servletContext.contextPath}/admin/newArticle.controller method="POST">
										

										<div class="form-group">
											<label for="fname"><h3>標題</h3></label>
											<input type="text" name="articleTitle" id="title" class="form-control"
												value="">
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
											<textarea class="form-control" id="editor" rows="15" name="articleContent"></textarea>
										</div>

										<div class="form-footer pt-4 pt-5 mt-4 border-top">
											<button type="button" class="btn btn-primary edit_btn" data-toggle="modal" data-target="#editModal">送出</button>
											<!-- <button id="preview_btn" class="btn-primary btn" onclick="preview()">文章預覽</button> -->
											<button class="btn btn-danger btn-default" onclick="redo()">清空</button>
											<button class="btn btn-sm btn btn-outline-success" onclick="autoInput()">Magic Button</button> 
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
					<h5 class="modal-title" id="editModalLabel">確認新增文章</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					是否確認新增?
				</div>
				<div class="modal-footer">
					<button id="modal_confirm" type="button" class="btn btn-primary">確認</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!--modal end-->
	<script type="text/javascript">
		<!--modal confirm button-->
		$("#modal_confirm").on("click",function(){
			$("#edit_form").submit();
			
		})
		<!--modal confirm button end-->	
</script>
	
	
	<script>
	<!--editor confing-->
	function MyCustomUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        return new MyUploadAdapter( loader );
    };
}
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
				mediaEmbed: {
					previewsInData: true
					// 設定影片為可見的格式
				},
				licenseKey: '', 

				ckfinder:{uploadUrl: '${pageContext.servletContext.contextPath}/admin/imgUpload'},
				
			
        	})
    		.then( editor => {
						//myEditor=editor;
						console.log( editor );
						this.editor = editor;
    		})
    		.catch( error => {
        				console.error( error );
    		
			});
			<!--editor confing end-->
			
			<!--redo btn function-->
			function redo(){
			document.getElementById("title").value = "";
			editor.setData( '');
			var options = typeSelect.getElementsByTagName("option");
			options[0].selected=true;
			event.preventDefault();
		}
			<!--redo btn function end-->
			<!--preview btn function-->
			function preview(){
			event.preventDefault();
			var previewForm = document.createElement("form");
			$(document.body).append(previewForm);
			previewForm.method="POST";
			previewForm.action="preview.controller"
			var artTitle = $("#title").val();
			var artType = $("#typeSelect").find(":selected").text();
			var artUserid = $("#userid").val();
			var artContent=editor.getData();
			var obj={"artTitle":artTitle,"artType":artType,"artUserid":artUserid,"artContent":artContent};
			console.log(obj);
			$.each(obj,function(key,value){
				$('<input>', {
				type: 'hidden',
				name: key,
				value: value
			}).appendTo(previewForm);

			});
			previewForm.submit();
            };
			<!--preview btn function end-->
			<!-- AutoInput Start-->
			function autoInput(){
				var autoContent = `<p>一年一度的新北耶誕城又到了<br>今年的新北耶誕城是以迪士尼為主提<br>可是卻被抱怨來參加 Party的公主年紀都太大<br><br>可能是迪士尼的授權費太貴了<br>今年的官網地圖也被抱怨做的很陽村<br>熱門的IG景點都不知道在哪裡<br><br>也因此<br>要來逛新北耶誕城的你就需要看本篇<br>免得在12萬平方公尺的燈區裡面亂走<br>走到斷腿都還逛不到IG名點</p><p>本次燈會共分 3區<br>分別為 板橋車站與市政府 間 的主燈區<br>板橋車站西北邊的 站前廣場: 站前夢幻莊園<br>板橋車站西南邊的 萬坪公園: 迪士尼公主的童話森林<br><br>首先穿過 充滿燈海的 市民廣場B1連通道<br>這裡已經可以看到滿滿的燈海</p><hr><p>本次熱門的IG景點還有<br>市政府旁邊<br>紫色奇幻光廊後面<br>的 愛麗絲妙妙貓<br>大大的黃色雙眼<br>吸引了大小朋友的相機<br>相當討喜<br><br>其他官網地圖上的<br>恐龍 我的起源<br>製作的還算逼真<br>喜歡電玩的朋友可以來看看<br><br>另外也是官網地圖上的小飛象<br>是一個大地雷<br>看到會讓您流下眼淚<br>想必迪士尼的授權費真的很貴<br>千萬不要刻意走過來喔<br><br>環球中心旁的聖誕樹也很不錯<br>水藍色的光影<br>如流冰般的流動<br>很有冬天的味道</p>`;
				event.preventDefault();
				document.getElementById("title").value = "【景點】 新北耶誕城  燈點介紹";
				editor.setData( autoContent);

			}
			<!-- AutoInput End-->
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
