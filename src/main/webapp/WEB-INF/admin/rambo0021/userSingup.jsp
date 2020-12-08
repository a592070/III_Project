<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Fun Taiwan - 註冊</title>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <c:import url="/WEB-INF/admin/fragment/user_ref.jsp" />
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
      <div class="container" style="text-align : center">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">首頁</a></span> <span>註冊</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">註冊會員</h1>
          </div>
        </div>
      </div>
    </div>

		<section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h4">會員註冊</h2>
          </div>
<!--           <div class="w-100"></div> -->
<!--           <div class="col-md-3"> -->
<!--             <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p> -->
<!--           </div> -->
<!--           <div class="col-md-3"> -->
<!--             <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p> -->
<!--           </div> -->
<!--           <div class="col-md-3"> -->
<!--             <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p> -->
<!--           </div> -->
<!--           <div class="col-md-3"> -->
<!--             <p><span>Website</span> <a href="#">yoursite.com</a></p> -->
<!--           </div> -->
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <form action="#">
              <div class="form-group">
                <h3 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員身分</h3>
                <select class="custom-select" name="identity" id="identity">
                    <option value="2" selected>一般會員</option>
                    <option value="3">餐廳業者</option>
                    <option value="4">住宿業者</option>
                    <option value="5">交通業者</option>
                </select>              
              </div>
              <div class="form-group">
                <h3 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">帳號</h3>
                <input class="form-control" type="text" id="username" name="username" placeholder="請輸入帳號" onblur="ajaxusr()" />
                <img class="img" id="idfimg" src=""><span id="idsp"></span><br />
              </div>
              <div class="form-group">
                <h3 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼</h3>
                <input class="form-control" type="password" id="password" name="password" autocomplete="off" placeholder="請輸入密碼" />
                <img class="img" id="idfimg2" src=""><span id="idsp2"></span><br />
              </div>
              <div class="form-group">
                <h3 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼確認</h3>                
                <input class="form-control" type="password" id="checkpassword" name="checkpassword" placeholder="請確認密碼"
                    onblur="checkpwd()" />
              </div>
              <div class="form-group">
                <input type="submit" value="註冊" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-6" id="map">業者表單</div>
        </div>
      </div>
    </section>


   <c:import url="/WEB-INF/admin/fragment/footer.jsp"/>
    
    
   
  

  <!-- loader -->
<%--   <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>   --%>
  </body>
</html>