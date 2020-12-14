<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ page
contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Fun台灣 論壇</title>
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
    transition: all 0.3s ease; 
    }
    .destination .icon span {
      color: #000000;
      opacity:0.6;
    }

    .destination .icon span {
      color: #000000;
	    opacity:0.6;
      }
    </style>
  <script src="https://kit.fontawesome.com/4c5dc04160.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <!-- Start nav -->
    <c:import url="/WEB-INF/admin/fragment/nav.jsp" />

    <!-- END nav -->

    <div
      class="hero-wrap js-fullheight"
      style="background-image: url('../direngine-master/images/bg_6.jpg')"
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
    <input type="hidden" id="articleType" value="${list[0].articleType.typeId}">
    <div class="row d-flex justify-content-center  bg-light align-items-end" style="height: 75px;"><i class="fas fa-search fa-2x">${list[0].articleType.typeName}</i></div>
    <section class="ftco-section bg-light" id="section">
      <div class="container" id="container">
        <div class="row d-flex" id="articleGrid">
          
          <c:forEach var="article" items="${list}" varStatus="status">
            
            <div class="col-md-3 d-flex ftco-animate">
              <div class="blog-entry align-self-stretch">
                <input type="hidden" class="artId" value="${article.artId}">
                <a
                  href="<%=application.getContextPath()%>/article/${article.artId}"
                  class="block-20 artCoverPic"
                  style="background-image: url('../${picList[status.index]}')"
                >
                </a>
                <div class="text p-4 d-block">
                  <span class="tag">${article.articleType.typeName}</span>

                  <h3 class="heading mt-3">
                    <a href="<%=application.getContextPath()%>/article/${article.artId}">${article.artTitle}</a>
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
                <!-- <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li> -->
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
      <a class="btn btn-primary" href="<%=application.getContextPath()%>/newArticle" role="button"><i class="far fa-edit">撰寫文章</i></a>
    </div>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
    <script>
      $(document).ready(function(){
      $('body,html').animate({scrollTop: 750}, 800); 
      });

    </script>
    <script>
      $(window).scroll(function() {
    if($(document).scrollTop() > 600){
        $(".fixed-btn").show();
    } else {
        $(".fixed-btn").hide();
}
});

  </script>
    <script>
      
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
        var typeId = $('#articleType').val();
        console.log(typeId);
        

        $.ajax({
          type:"GET",
          url:"../Article.pagincontroller.json",
          data:{
            currPage: currPage+1,
            typeId:typeId
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
        // window.scrollTo({ top: 500, behavior: 'smooth' });
        //event.preventDefault();
        var totalPage=eval(${totalPages});
        var typeId = $('#articleType').val();
        $.ajax({
          type:"GET",
          url:"../Article.pagincontroller.json",
          data:{
            currPage: currPage-1,
            typeId :typeId
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
        var typeId = $('#articleType').val();
        event.preventDefault();
        var page = $(this).text();
        $.ajax({
          type:"GET",
          url:"../Article.pagincontroller.json",
          data:{
            currPage: page,
            typeId: typeId
          },
          success:function(response){
            $('#section').children().remove();
            $('#section').append(response);
            console.log('現在頁數'+currPage);
            window.scrollTo({ top: 600, behavior: 'smooth' });
          },
        })

      })

      

    </script>
    

    <!-- <script>
      $(window).on("load",function () {
        $.ajax({
          type: "GET",
          url: "Article.controller.json",
          async:false,
          success: function (response) {
            showList(response);
            
          },
        });
      });
      </script> -->
     <!--<script>
      function showList(response) {
        var rowStart ="<div class='row d-flex'>";
        var rowEnd = "</div>";
        $(rowStart).appendTo('#container');
        
        $.each(response.artlist, function (index, element) {
          var currArtId = element.artId;
          var imgPath = response.piclist[index];
          console.log(imgPath);
          var content =
              "<div class='col-md-3 d-flex ftco-animate'>" +
              "<div class='blog-entry align-self-stretch'>" +
              "<a href='#' class='block-20' style='background-image: " +
              'url(' +
              imgPath +
              ");'>"+
              "</a>" +
              "<div class='text p-4 d-block'>" +
              "<span class='tag'>" +
              element.articleType.typeName +
              "</span>" +
              "<h3 class='heading mt-3>'" +
              "<a href='#'>" +
              element.artTitle +
              "</a></h3>" +
              "<div class='meta mb-3'>"+
              "<div><a href='#'>" +
              element.artCreTime +
              "</a></div>" +
              "<div><a href='#'>" +
              element.artUserId +
              "</a></div>" +
              "</div>" +
              "<a href='#'' class='meta-chat'>" +
              "<span class='icon-chat'></span>" +
              element.artCommNum +
              "</a>" +
              "</div></div></div></div></div>"
              $(content).appendTo("#container");
        });
        $(rowEnd).appendTo('#container');
      }
    </script -->
  </body>
</html>
