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
    </style>
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
              <span class="mr-2">探索台灣</span> <span></span>
            </p>
            <h1
              class="mb-3 bread"
              data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
            >
              FUN x 台灣
            </h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row d-flex" id="articleGrid">
          <!-- <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20"
                style="
                  background-image: url('direngine-master/images/image_1.jpg');
                "
              >
              </a>
              <div class="text p-4 d-block">
                <span class="tag">文章分類</span>

                <h3 class="heading mt-3">
                  <a href="#">文章標題</a>
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">文章建立時間</a></div>
                  <div><a href="#">文章作者</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 評論數3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div> -->
          <c:forEach var="article" items="${list}" varStatus="status">
            
            <div class="col-md-3 d-flex ftco-animate">
              <div class="blog-entry align-self-stretch">
                <a
                  href="blog-single.html"
                  class="block-20"
                  style="background-image: url('${picList[status.index]}')"
                >
                </a>
                <div class="text p-4 d-block">
                  <span class="tag">${article.articleType.typeName}</span>

                  <h3 class="heading mt-3">
                    <a href="#">${article.artTitle}</a>
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
                <li id ="prev" class="prev"><a href="#">&lt;</a></li>
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
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
    <script>
      var len = eval(${totalPages});
      for(var i=1; i<=len;i++) {
        var content = '<li><a href="#">'+i+'</a></li>'
        $('#next').before(content);
      };
    </script>
    <script>
      $('#next').on('click',function(){
        console.log('next has been click');
        var currPage=eval(${currPage});
        var totalPage=eval(${totalPages});
        

        $.ajax({
          type:"GET",
          url:"Article.controller.json",
          dataType:'html',
          data:{
            currPage: currPage+1,
          },
          success:function(response){
            
            console.log('currpage= '+currPage);
            $('#articleGrid').children.remove();
            $('#articleGrid').append(response);
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
    <!-- <script>
      function showList(response) {
        
        $.each(response.list, function (index, element) {
          var currArtId = element.artId;
          var imgPath = response.coverPic[currArtId];
          console.log(imgPath);
          var content = "<div class='col-md-3 d-flex ftco-animate'>" +
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
              $(content).appendTo("#articleGrid");
        });
      }
    </script> -->
  </body>
</html>
