<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ page
contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>撰寫文章</title>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap");
      h2 {
        font-family: "Noto Sans TC", sans-serif;
      }

      h3 {
        font-family: "Noto Sans TC", sans-serif;
      }
      html {
        scroll-behavior: smooth;
      }
      .fixed-btn {
        position: fixed;
        bottom: 20px;
        right: 80px;
        height: 100px;
        z-index: 999;
      }
      .ck-editor__editable_inline {
        min-height: 350px;
        min-width: 600px;
      }
      .ck-editor__top {
              min-width: 600px;
          }
    </style>
    <script
      src="https://kit.fontawesome.com/4c5dc04160.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <!-- Start nav -->
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <!-- END nav -->

    <div
      class="hero-wrap js-fullheight"
      style="background-image: url('direngine-master/images/bg_6.jpg')"
    >
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
          data-scrollax-parent="true"
        >
          <div
            class="col-md-9 ftco-animate text-center"
            data-scrollax=" properties: { translateY: '70%' }"
          >
            <p
              class="breadcrumbs"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
            >
              <span class="mr-2">FUN x 台灣</span> <span></span>
            </p>
            <h1
              class="mb-3 bread"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
            >
              撰寫文章
            </h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
        <div class="row d-flex contact-info">
          <div class="col-md-12 mb-4">
            <h3>寫點甚麼吧 ...</h3>
            <hr>
          </div>
          <div class="w-100"></div>
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <form action="#">
              
              <div class="form-group">
                <label for="title"><h4>標題</h4></label>
                <input
                id="title"
                type="text"
                class="form-control"
                  placeholder="請輸入標題"
                  />
                </div>
                
              <div class="form-group">
                <label for="typeSelect"><h4>分類</h4></label>
                <select class="form-control" id="typeSelect" name="typeSelect">
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
                <label for="userId"><h4>使用者名稱</h4></label>
                <input
                  type="text"
                  class="form-control"
                  placeholder=""
                  id="userId"
                />
              </div>
              
              <div class="form-group">
                <input type="submit" value="發表文章" class="btn btn-primary
                py-3 px-5" />
                <input type="button" value="清空"" class="btn btn-warning
                py-3 px-5" />
              </div>
            </form>
          </div>
          <div class="col-md-6 pr-md-5">
            <div class="form-group">
              <label for="content"><h4>分享你的故事</h4></label>
              <textarea
                name="content"
                id="editor"
                cols="30"
                rows="7"
                class="form-control"
              ></textarea>
            </div>
            
          </div>
        </div>
      </div>
    </section>

    <c:import url="/WEB-INF/admin/fragment/footer.jsp" />
    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen">
      <svg class="circular" width="48px" height="48px">
        <circle
          class="path-bg"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke="#eeeeee"
        />
        <circle
          class="path"
          cx="24"
          cy="24"
          r="22"
          fill="none"
          stroke-width="4"
          stroke-miterlimit="10"
          stroke="#F96D00"
        />
      </svg>
    </div>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/Forum_ref.jsp" />

    <script>
      $(document).ready(function(){
     $('body,html').animate({scrollTop: 750}, 800); 
});

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
						'ImageInsert',
						'blockQuote',
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
