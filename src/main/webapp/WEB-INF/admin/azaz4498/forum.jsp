<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ page
contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FUN x TAIWAN</title>
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
      .destination .icon {
    width: 60px;
    height: 60px;
    background: #fff;
    opacity: 0.6;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -webkit-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease; }
    .destination .icon span {
      color: #000000;
	    opacity:0.6;}
      .destination .icon span {
      color: #000000;
	    opacity:0.6;
      }
      .container {
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto; }
  @media (min-width: 576px) {
    .container {
      /* max-width: 540px; */
      } }
  @media (min-width: 768px) {
    .container {
      /* max-width: 720px; */
      } }
  @media (min-width: 992px) {
    .container {
      /* max-width: 960px; */
      } }
  @media (min-width: 1200px) {
    .container {
      max-width: 1140px;
      } }
    </style>
    <script src="https://kit.fontawesome.com/4c5dc04160.js" crossorigin="anonymous"></script>
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
              論壇
            </h1>
          </div>
        </div>
      </div>
    </div>
    
    

    <section class="ftco-section bg-light " id="section">
      <c:import url="/WEB-INF/admin/azaz4498/carousel.jsp"/>
      <div class="container" id="container">
        <div class="row d-flex" id="articleGrid">
          
          <c:forEach var="article" items="${list}" varStatus="status">
            
            <div class="col-md-3 d-flex ftco-animate">
              <div class="blog-entry align-self-stretch">
                <input type="hidden" class="artId" value="${article.artId}">
                <a
                  href="article/${article.artId}"
                  class="block-20 artCoverPic"
                  style="background-image: url('${picList[status.index]}')"
                >
                </a>
                <div class="text p-4 d-block">
                  <span class="tag">${article.articleType.typeName}</span>

                  <h3 class="heading mt-3">
                    <a href="article/${article.artId}">${article.artTitle}</a>
                  </h3>
                  <div class="meta mb-3">
                    <div><a href="#">${article.artCreTime}</a></div>
                    <div><a href="#">${article.artUserId}</a></div>
                    <div>
                      <a href="#" class="meta-chat"
                        ><span class="icon-chat"></span>
                        ${article.artCommNum}</a
                      >
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
          </c:forEach>
        </table>
        </div>
        <!--分頁-->
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li id ="prev" class="prev"><a href="">&lt;</a></li>
                <li id ="next" class="next"><a href="">&gt;</a></li>
              </ul>
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
    <!-- fixed btn-->
    <div class="fixed-btn">
      <a class="btn btn-primary" href="javascript: void(0)" role="button" onclick="checkLogin()"><i class="far fa-edit">撰寫文章</i></a>
    </div>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
      function checkLogin(){
        console.log('login check');
       var loginCheck = '${userBean.userName}';
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
    </script>
    <script>
          $(document).ready(function(){
    $('body,html').animate({scrollTop: 800}, 800); 
    });
        
        
        var len = eval(${totalPages});
        var currPage= eval(${currPage});
      for(var i=1; i<=len;i++) {
        var content = "<li class='page' id='page"+i+"'><a href=''>"+i+"</a></li>";
        $('#next').before(content);
        $('#page'+currPage).addClass('active');
        $('#page'+currPage).remove('a');
      };
      if(len==1){
        $('#next').remove();
        $('#prev').remove();
      }else if(currPage==len){
        $('#next').remove();
      }else if(currPage==1){
        $('#prev').remove();
      }
      </script>
      <script>
      $('#next').on('click',function(){
        event.preventDefault();
        var totalPage=eval(${totalPages});
        $.ajax({
          type:"GET",
          url:"Article.pagincontroller.json",
          data:{
            currPage: currPage+1,
          },
          success:function(response){
            $('#section').children().remove();
            $('#section').append(response);
            console.log('現在頁數'+currPage);
            window.scrollTo({ top: 600, behavior: 'smooth' });
          },
        })
      })

      $('#prev').on('click',function(){
        var totalPage=eval(${totalPages});
        $.ajax({
          type:"GET",
          url:"../Article.pagincontroller.json",
          data:{
            currPage: currPage-1,
          },
          success:function(response){
            $('#section').children().remove();
            $('#section').append(response);
            console.log('現在頁數'+currPage);
            window.scrollTo({ top: 600, behavior: 'smooth' });
          },
        })
      })

      $('.page').on('click',function(){
        console.log('page has been click');
        event.preventDefault();
        var page = $(this).text();
        var typeId = $('#articleType').val();
        $.ajax({
          type:"GET",
          url:"../Article.pagincontroller.json",
          data:{
            currPage: page,
          },
          success:function(response){
            $('#section').children().remove();
            $('#section').append(response);
            console.log('現在頁數'+currPage);
            window.scrollTo({ top: 600, behavior: 'smooth' });
          },
        })
      });

      $(window).scroll(function() {
        if($(document).scrollTop() > 600){
            $(".fixed-btn").show();
        } else {
            $(".fixed-btn").hide();
    }
  });
    </script>


    
  </body>
</html>
