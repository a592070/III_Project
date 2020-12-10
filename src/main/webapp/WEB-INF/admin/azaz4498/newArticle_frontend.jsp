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
              <span class="mr-2">探索台灣</span> <span></span>
            </p>
            <h1
              class="mb-3 bread"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
            >
              FUN x 台灣
            </h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h3>寫點甚麼吧 ...</h3>
          </div>
          <div class="w-100"></div>
        </div>
        <div class="row block-9 d-flex justify-content-center">
          <div class="col-md-6 pr-md-5">
            <form action="#">
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
                <label for="title"><h4>標題</h4></label>
                <input
                  id="title"
                  type="text"
                  class="form-control"
                  placeholder="請輸入標題"
                />
              </div>
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
              <div class="form-group">
                <input type="submit" value="發表文章"" class="btn btn-primary
                py-3 px-5" />
              </div>
            </form>
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
  </body>
</html>
