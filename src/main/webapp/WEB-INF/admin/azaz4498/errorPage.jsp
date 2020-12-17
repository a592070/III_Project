<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>錯誤</title>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap');
        p{
            font-family: 'Noto Sans TC', sans-serif;
        }
        h2 {
            font-family: 'Noto Sans TC', sans-serif;
        }
        
        .fixed-btn {
          position: fixed;
          bottom: 20px;
          right: 80px;
          height: 100px;
          z-index: 999;
          
      }
    </style>
    <link rel="stylesheet" href="../assets/azaz4498/content-style.css" type="text/css">
    <script src="https://kit.fontawesome.com/4c5dc04160.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <!-- Start nav -->
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
    <!-- END nav -->
    
    <div
      class="hero-wrap js-fullheight"
      style="background-image: url(<c:url value='/direngine-master/images/bg_6.jpg'/>)"
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
              <span class="mr-2">FUN x 台灣</span>
             
              
            </p>
            <h1
              class="mb-3 bread"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
            >
              論壇
            </h1>
          </div>
        </div>
      </div>
    </div>
    



    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
            <h2 class="mb-3"><i class="far fa-frown"></i> 很抱歉，此文章已被隱藏或是不存在 <i class="far fa-frown"></i></h2>
            </div>
          </div>
          <!-- .col-md-8 -->
          
        </div>
      </div>
    </section>
    <!-- .section -->

    <c:import url="/WEB-INF/admin/fragment/footer.jsp"/>

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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <script>
      // 滑動+編輯文章按鈕隱藏
$(document).ready(function () {
  
  $("body,html").animate({ scrollTop: 480 }, 950);
})







function checkLogin(){
     var loginCheck ='${userBean.userName}'
       if(loginCheck==null||loginCheck==""){
         Swal.fire({
           title:'請先登入',
           text:'登入以撰寫文章',
           html:"<a href='<%=application.getContextPath()%>/user/signinPage'><u>登入</u></a>以發表評論",
           icon:'warning',
           confirmButtonText:'好'
         })
     }else{
       window.location.href="<%=application.getContextPath()%>/newArticle";
     }
   }
   function magic(){
        $('#message').val('謝謝你的分享，假日有空也想去!');
      }






</script>
    
    
</body>
</html>