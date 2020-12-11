<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>

<head>
  <title>Fun Taiwan - 登入</title>

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
                href="index.html">首頁</a></span> <span>登入</span></p>
          <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員登入</h1>
        </div>
      </div>
    </div>
  </div>

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container ftco-animate">
      <div class="row d-flex mb-5 contact-info" style="text-align : center">
        <div class="col-md-12 mb-4">
          <h1 class="h1">會員登入</h1>
        </div>
      </div>
      <div class="row block-9">
        <div class="col-md-50 pr-md-5" style="padding-left: 450px">
          <form>
            <div class="form-group">
              <h3 class="mb-3 bread" style="display: inline;"
                data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">帳號</h3>
              <img class="img" id="idfimg" src=""><span id="idsp"></span><br />
              <input class="form-control" type="text" id="username" name="username" placeholder="請輸入帳號" />
            </div>
            <div class="form-group">
              <h3 class="mb-3 bread" style="display: inline;"
                data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼</h3>
              <img class="img" id="idfimg2" src=""><span id="idsp2"></span><br />
              <input class="form-control" type="password" id="password" name="password" autocomplete="off"
                placeholder="請輸入密碼" />
            </div>
            <div class="form-group">
              <div class="g-recaptcha" id="g-recaptcha" data-sitekey="6LdOeNYZAAAAAPAEKRkJYgqKjU79n5B90Jnw2Q06"></div>
            </div>
            <div class="form-group">
              <input type="button" value="登入" id="submit" class="btn btn-primary py-3 px-5" style="margin-left:85px">
              <p style="font-size: 18px">
                還沒有帳號 ? <a class="text-info stretched-link"
                  href="${pageContext.servletContext.contextPath}/user/registrationPage">註冊</a>
              </p>
            </div>
          </form>
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
<script>
  $("#submit").click(function () {
    console.log("登入")
    var form1 = $(this).parents('form');
    var formData = new FormData(form1[0]);
    
    $.ajax({

      type: "POST",
      url: "${pageContext.servletContext.contextPath}/user/signin",
      data: formData,
      processData: false,
      contentType: false,
      dataType: "json",

      success: (response) => {
         console.log(response)
         checkLogin(response)

      }

    })

  })
  function checkLogin(response){
    if(response.LoginError){
      grecaptcha.reset();
      swal({
            title: "登入失敗!",
            text: response.LoginError,
            icon: "warning",
          });
    }else{
      swal({
            title: "登入成功!",
            icon: "success",
            button: false
          });
          setTimeout(function () { location.href = response.reqURL; }, 2000);
    }

  }
</script>

</html>