<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

      <!DOCTYPE html>
      <html>

      <head>
        <title>Fun Taiwan - 登入</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <c:import url="/WEB-INF/admin/fragment/user_ref.jsp" />
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id"
          content='47855159151-j7jtqr6klmovjprvas550detl1oh3tu7.apps.googleusercontent.com'>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
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

        <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/direngine-master/images/bg_2.jpg');">
          <div class="overlay"></div>
          <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
              data-scrollax-parent="true">
              <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
                <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span
                    class="mr-2">FUN
                    x 臺灣</span>
                <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員登入</h1>
              </div>
            </div>
          </div>
        </div>

        <section class="ftco-section contact-section ftco-degree-bg">
          <div class="container ftco-animate">
            <div class="row d-flex contact-info" style="text-align : center;margin-bottom: 0px;padding-bottom: 0px">
              <div class="col-md-12">
                <h1 class="h1">會員登入</h1>
                <div class="form-group">
                  <!-- google login -->
                                    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" style="padding-left: 430px"></div>
                </div>
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
                    <div class="g-recaptcha" id="g-recaptcha" data-sitekey="6LdOeNYZAAAAAPAEKRkJYgqKjU79n5B90Jnw2Q06">
                    </div>
                  </div>

                  <div class="form-group">
                    <input type="button" value="登入" id="submit" class="btn btn-primary py-3 px-5"
                      style="margin-left:85px">
                    <p style="font-size: 18px">
                      還沒有帳號 ? <a class="text-info stretched-link"
                        href="${pageContext.servletContext.contextPath}/user/registrationPage">註冊 </a>

                      <a role="button" class="text-info stretched-link" id="forgetLink">忘記密碼?</a>
                      <button type="button" class="btn btn-warning" data-toggle="modal" style="display: none"
                        data-target="#forgetPwd" id="foget" name="forget"></button>
                    </p>
                  </div>

                  <input type="button" value="帶入資料" class="btn btn-light py-1 px-1" id="fastSignin1">


                </form>
              </div>
            </div>
          </div>
        </section>

        <!-- 	ModalPwd  -->
        <div class="modal fade" id="forgetPwd" tabindex="-1" aria-labelledby="pwdModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="pwdModalLabel">忘記密碼</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" name="pClose">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <h3 class="mb-3 bread" style="display: inline;"
                    data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">帳號</h3>
                  <img class="img" id="pimg" src=""><span id="psp"></span><br />
                  <input class="form-control" type="text" id="fogetUsername" name="password" autocomplete="off"
                    placeholder="請輸入帳號" />
                </div>
                <div class="form-group">
                  <h3 class="mb-3 bread" style="display: inline;"
                    data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Email</h3>
                  <img class="img" id="eimg" src=""><span id="esp"></span><br />
                  <input class="form-control" type="text" id="fogetEmail" name="email" placeholder="請輸入email" />
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="fsubmit" data-dismiss="modal">發送</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <input type="button" value="帶入資料" class="btn btn-light py-1 px-1" id="fastSignin2">
              </div>
            </div>
          </div>
        </div>


        <c:import url="/WEB-INF/admin/fragment/footer.jsp" />




        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
              stroke="#F96D00" />
          </svg></div>
        <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      </body>
      <script>
        $(document).ready(function () {
          $('body,html').animate({ scrollTop: 700 }, 800);



          var auth2 = gapi.auth2.getAuthInstance();
          auth2.signOut().then(function () {
            console.log('User signed out.');
          });


        });

        $("#forgetLink").click(function () {
          $("#foget").click()
        })

        $("#submit").click(function () {
          console.log("登入")
          var form1 = $(this).parents('form');
          var formData = new FormData(form1[0]);

          swal({
            title: "處理中",
            button: false,
            icon: '<%=application.getContextPath()%>/assets/img/rambo0021/giphy.gif'
          })

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
        function checkLogin(response) {
          if (response.LoginError) {
            grecaptcha.reset();
            swal({
              title: "登入失敗!",
              text: response.LoginError,
              icon: "warning",
            });
          } else {
            swal({
              title: "登入成功!",
              icon: "success",
              button: false
            });
            setTimeout(function () { location.href = response.reqURL; }, 2000);
          }

        }
        $("#fsubmit").click(function () {
          var username = $('#fogetUsername').val()
          var email = $("#fogetEmail").val()
          swal({
            title: "處理中",
            button: false,
            icon: '<%=application.getContextPath()%>/assets/img/rambo0021/giphy.gif'
          })
          $.ajax({

            type: "POST",
            url: "${pageContext.servletContext.contextPath}/user/forgetPwd",
            data: { "username": username, "email": email },
            dataType: "text",

            success: (response) => {
              console.log(response)
              swal({
                title: "新密碼已發送至您的信箱!",
                icon: "success",
              });
            }

          })
        })
        //google API login
        function onSignIn(googleUser) {
          var profile = googleUser.getBasicProfile();
          var nickname = profile.getName();
          var imgUrl = profile.getImageUrl();
          var email = profile.getEmail();
          console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
          console.log('Name: ' + profile.getName());
          console.log('Image URL: ' + profile.getImageUrl());
          console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
          $.ajax({
            type: "POST",
            url: "${pageContext.servletContext.contextPath}/user/googleLogin",
            data: { "nickname": nickname, "imgUrl": imgUrl, "email": email },
            success: (response) => {
              swal({
                title: "登入成功!",
                icon: "success",
                button: false
              });
              setTimeout(function () { location.href = response.reqURL; }, 2000);
            }
          })

        }
        $("#fastSignin1").click(function () {
          $("#username").val("yourhomesteak");
          $("#password").val("yourhomesteak");

        })
        $("#fastSignin2").click(function () {
          $("#fogetUsername").val("aaaaaa");
          $("#fogetEmail").val("iiiteam124@gmail.com");
        })
      </script>

      </html>