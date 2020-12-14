<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

      <!DOCTYPE html>
      <html>

      <head>
        <title>Fun Taiwan - 我的訂單</title>

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

        <div class="hero-wrap js-fullheight" style="background-image: url('../direngine-master/images/user-2.jpg');">
          <div class="overlay"></div>
          <div class="container">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
              data-scrollax-parent="true">
              <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
                <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span
                    class="mr-2">FUN
                    x 臺灣</span></p>
                <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">我的訂單</h1>
              </div>
            </div>
          </div>
        </div>

        <section class="ftco-section contact-section ftco-degree-bg">
          <div class="container ftco-animate">
            <div class="row d-flex mb-5 contact-info" style="text-align : center">
              <div class="col-md-12 mb-4">
                <h1 class="h1">我的訂單</h1>
              </div>
            </div>
            <div class="row block-9">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
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

        </script>
      </body>

      </html>