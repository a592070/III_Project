<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>

<head>
  <title>Fun Taiwan - 個人頁面</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <c:import url="/WEB-INF/admin/fragment/user_ref.jsp" />
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <style>
    .img {
      width: 13px;
    }
  </style>
</head>

<body>
  <!-- Start nav -->
  <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
  <!-- END nav -->

  <div class="hero-wrap js-fullheight" style="background-image: url('../direngine-master/images/bg_2.jpg');">
    <div class="overlay"></div>
    <div class="container">
      <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
        data-scrollax-parent="true">
        <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a
                href="index.html">首頁</a></span> <span>個人頁面</span></p>
          <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">個人頁面</h1>
        </div>
      </div>
    </div>
  </div>

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container ftco-animate">
      <div class="row d-flex mb-5 contact-info" style="text-align : center">
        <div class="col-md-12 mb-4">
          <h1 class="h1">個人頁面</h1>
        </div>
      </div>
      <div class="row block-9">
        <div class="col-md-6 pr-md-5">
          <div class="form-group">
            <h3 class="mb-3 bread" style="display: inline;"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">個人照片</h3>
            <img class="img-2 d-flex justify-content-center align-items-center" id="userPic" style="height : 300px" src="<%=application.getContextPath()%>/user/ShowUserPic">
            <input type="file" id="Apicture" name="Apicture" accept="image/*" style="display: none">
            <button type="button" onclick="Apicture.click()" class="btn btn-light">上傳圖片</button>
            <button type="button" class="btn btn-light" id="delApic">取消圖片</button>
          </div>
        </div>
        <div class="col-md-6 pr-md-5">
          <h3 class="mb-3 bread" style="display: inline;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">帳號</h3>
          <p>${aBean.userName }</p>
          <h3 class="mb-3 bread" style="display: inline;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼</h3>
          <p>${aBean. }</p>
          <h3 class="mb-3 bread" style="display: inline;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員身分</h3>
          <p>${aBean. }</p>
          <h3 class="mb-3 bread" style="display: inline;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">暱稱</h3>
          <p>${aBean. }</p>
          <h3 class="mb-3 bread" style="display: inline;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">註冊日期</h3>
          <p>${aBean. }</p>
          <h3 class="mb-3 bread" style="display: inline;" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">最後修改日期</h3>
          <p>${aBean. }</p>
        </div>
      </div>
    </div>
  </section>


  <c:import url="/WEB-INF/admin/fragment/footer.jsp" />




  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#F96D00" /></svg></div>
  <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>

</html>