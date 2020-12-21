<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

      <!DOCTYPE html>
      <html>

      <head>
        <title>Fun Taiwan - 個人頁面</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <c:import url="/WEB-INF/admin/fragment/user_ref.jsp" />
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <style>

        </style>
        
      </head>

      <body>
        <!-- Start nav -->
        <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
        <!-- END nav -->

        <div class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/direngine-master/images/user-2.jpg');">
          <div class="overlay"></div>
          <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
              data-scrollax-parent="true">
              <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
                <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span
                    class="mr-2">FUN
                    x 臺灣</span></p>
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
                  <form method="POST" id="Form" enctype="multipart/form-data">
                    <c:if test="${!empty userBean.picture}">
                      <img class="img-2 d-flex justify-content-center align-items-center" id="userPic"
                        style="height : 300px" src="<%=application.getContextPath()%>/user/ShowUserPic">
                    </c:if>
                    <c:if test="${empty userBean.picture}">
                      <img class="img-2 d-flex justify-content-center align-items-center" id="userPic"
                        style="height : 300px" src="<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png">
                    </c:if>
                    <input type="file" id="Apicture" name="Apicture" accept="image/*" style="display: none">
                    <button type="button" onclick="Apicture.click()" class="btn btn-light">上傳圖片</button>
                    <!-- <button type="button" class="btn btn-light" id="delApic">取消圖片</button> -->
                  </form>
                </div>
              </div>
              <div class="col-md-6 pr-md-5">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">帳號</h3>
                <p id="userName">${userBean.userName }</p>
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼</h3>
                <p id="password">••••••••••••••••</p>
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員身分</h3>
                <p id="identity">${userBean.identityBean.name}</p>
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Email</h3>
                <p id="email">${userBean.email}</p>
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">暱稱</h3>
                <p id="nickName">${userBean.nickName}</p>
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">註冊日期</h3>
                <p>${userBean.registerString}</p>
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">最後修改日期</h3>
                <p id="modDate">${userBean.modify_DateString}</p>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#changePwd">修改資料</button>
              </div>
            </div>
          </div>
        </section>
        <!-- 	ModalPwd  -->
        <div class="modal fade" id="changePwd" tabindex="-1" aria-labelledby="pwdModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="pwdModalLabel">修改會員資料</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" name="pClose">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <h3 class="mb-3 bread" style="display: inline;"
                    data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼</h3>
                  <img class="img" id="pimg" src=""><span id="psp"></span><br />
                  <input class="form-control" type="password" id="updatepassword" name="password" autocomplete="off"
                    placeholder="請輸入密碼" value="${userBean.password }" />
                </div>
                <div class="form-group">
                  <h3 class="mb-3 bread" style="display: inline;"
                    data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Email</h3>
                  <img class="img" id="eimg" src=""><span id="esp"></span><br />
                  <input class="form-control" type="text" id="updateemail" name="email" placeholder="請輸入email"
                    value="${userBean.email }" />
                </div>
                <div class="form-group">
                  <h3 class="mb-3 bread" style="display: inline;"
                    data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">暱稱</h3>
                  <img class="img" id="eimg" src=""><span id="esp"></span><br />
                  <input class="form-control" type="text" id="updatenickName" name="email" placeholder="請輸入暱稱"
                    value="${userBean.nickName }" />
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submit" data-dismiss="modal">儲存</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">退出</button>
                <input type="button" value="修改密碼" class="btn btn-light py-1 px-1" id="fastUpdate">
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
        <script>
          $(document).ready(function () {
            $('body,html').animate({ scrollTop: 700 }, 800);
          });



          $("#submit").click(function () {
            var password = $("#updatepassword").val()
            var email = $("#updateemail").val()
            var nickName = $("#updatenickName").val()
            var username = $("#userName").text();

            swal({
              title: "處理中",
              button: false,
              icon: '<%=application.getContextPath()%>/assets/img/rambo0021/giphy.gif'
            })
            $.ajax({

              type: "POST",
              url: "${pageContext.servletContext.contextPath}/user/updateUser",
              data: { "username": username, "password": password, "email": email, "nickName": nickName },
              dataType: "text",

              success: (response) => {
                console.log(response)
                swal({
                  title: "修改成功!",
                  icon: "success",
                });
                $("#modDate").text(formatDate())
                $("#email").text(email)
                $("#nickName").text(nickName)

              }

            })
          })
          $("#Apicture").change(function () {
            var pic = this
            var username = $("#userName").text();
            console.log(username)
            var form1 = $(this).parents('form');
            var formData = new FormData(form1[0]);
            formData.append('username', username)
            swal({
              title: "上傳中",
              button: false,
              icon: '<%=application.getContextPath()%>/assets/img/rambo0021/giphy.gif'
            })
            $.ajax({

              type: "POST",
              url: "${pageContext.servletContext.contextPath}/user/udUserImg",
              data: formData,
              processData: false,
              contentType: false,
              dataType: "text",

              success: (response) => {
                $("#modDate").text(formatDate());
                readURL(pic)
                swal({
                  title: "修改成功!",
                  icon: "success",
                });

              },

            })
          })

          //日期->字串
          function formatDate() {
            var d = new Date(),
              month = '' + (d.getMonth() + 1),
              day = '' + d.getDate(),
              year = d.getFullYear(),
              hours = '' + d.getHours(),
              minutes = '' + d.getMinutes(),
              seconds = '' + d.getSeconds();

            if (month.length < 2)
              month = '0' + month;
            if (day.length < 2)
              day = '0' + day;
            if (hours.length < 2)
              hours = '0' + hours;
            if (minutes.length < 2)
              minutes = '0' + minutes;
            if (seconds.length < 2)
              seconds = '0' + seconds;

            return [year, month, day].join('-') + " " + [hours, minutes, seconds].join(':');
          }

          //前端顯示圖片
          function readURL(input) {

            if (input.files && input.files[0]) {
              console.log("我會幫你換圖片")
              var reader = new FileReader();

              reader.onload = function (e) {
                $(input).siblings('img').attr('src', e.target.result);
                // $("#userPic").attr('src', e.target.result);
              }

              reader.readAsDataURL(input.files[0]);

            }

          }

          $("#fastUpdate").click(function(){
             $("#updatepassword").val("rambo3388")
          })

        </script>
      </body>

      </html>