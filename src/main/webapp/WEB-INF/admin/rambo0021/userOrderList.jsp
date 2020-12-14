<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
                    <th scope="col">大訂單號</th>
                    <th scope="col">餐廳名稱</th>
                    <th scope="col">住宿名稱</th>
                    <th scope="col">高鐵車次</th>
                    <th scope="col">總價格</th>
                    <th scope="col">訂單成立時間</th>
                  </tr>
                </thead>
                <tbody>
                 <c:forEach var="o" items="${oList}">
                     <tr>
                        <th scope="row">${o.order_id}</th>
                        <td>
                          <c:forEach var="r" items="${o.r_Order_Lists }">
                            ${r.restaurant.name}
                          </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="h" items="${o.hotelOrder }">
                            ${r.hotel.NAME}
                           </c:forEach>
                        </td>
                        <td>
                           <c:forEach var="t" items="${o.t_Order_Lists }">
                            ${t.highSpeedRail.idHSR}
                           </c:forEach>
                        </td>
                        <td>${o.totalPrice}</td>
                        <td><c:out value="${fn:substring(o.order_date, 0, 19)}" /></td>
                     </tr>
                 </c:forEach>
                  
                  
      
                </tbody>
              </table>
            </div>
          </div>
        </section>
        


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