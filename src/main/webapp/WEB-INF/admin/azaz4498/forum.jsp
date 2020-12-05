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

      p {
        font-family: "Noto Sans TC", sans-serif;
      }

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
          <div class="col-md-3 d-flex ftco-animate">
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
          </div>

          <div class="col-md-3 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a
                href="blog-single.html"
                class="block-20"
                style="
                  background-image: url('direngine-master/images/image_8.jpg');
                "
              >
              </a>
              <div class="text p-4">
                <span class="tag">Tips, Travel</span>
                <h3 class="heading mt-3">
                  <a href="#"
                    >Even the all-powerful Pointing has no control about the
                    blind texts</a
                  >
                </h3>
                <div class="meta mb-3">
                  <div><a href="#">August 12, 2018</a></div>
                  <div><a href="#">Admin</a></div>
                  <div>
                    <a href="#" class="meta-chat"
                      ><span class="icon-chat"></span> 3</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--分頁-->
        <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
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

    <script>
      $(document).ready(function () {
        $.ajax({
          type: "GET",
          url: "Article.controller.json",
          success: function (response) {
            showList(response);
          },
        });
      });
      function showList(response) {
        $("#articleGrid").empty();
        $.each(response.list, function (index, element) {
          var currArtId = element.artId;
          var imgPath = response.coverPic[currArtId];
          $("#articleGrid").append(
            "<div class='col-md-3 d-flex ftco-animate'>" +
              "<div class='blog-entry align-self-stretch'>" +
              "<a href='#' class='block-20' style='background-image: " +
              "url('" +
              imgPath +
              "')" +
              ':">' +
              "</a>" +
              "<div class='text p-4 d-block'>" +
              "<span class='tag'>" +
              element.articleType.typeName +
              "</span>" +
              "<h3 class='heading mt-3>'" +
              "<a href='#'>" +
              element.artTitle +
              "</a></h3>" +
              "<div><a href='#'>" +
              element.artCreTime +
              "</a></div>" +
              "<div><a href='#'>" +
              element.artId +
              "</a></div>" +
              "</div>" +
              "<a href='#'' class='meta-chat'>" +
              "<span class='icon-chat'></span>" +
              element.artCommNum +
              "</a>" +
              "</div></div></div></div></div>"
          );
        });
      }
    </script>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
  </body>
</html>
