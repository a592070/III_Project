<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form"%> <%@ page
contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
  <head>
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
    </style>
  </head>

  <body>
      <div class="container" id="container">
        <div class="row d-flex" id="articleGrid">
          <c:forEach var="article" items="${list}" varStatus="status">
            <div class="col-md-3 d-flex ftco-animate">
              <div class="blog-entry align-self-stretch">
                <input type="hidden" class="artId" value="${article.artId}">
                <input type="hidden" class="typeId" value="${article.articleType.typeId}"
                <a
                  href=""
                  class="block-20 artCoverPic"
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
          </div>
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
        <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
      </body>
   

    
    <script>
      var len = eval(${totalPages});
      var currPage= eval(${currPage});
      for(var i=1; i<=len;i++) {
        var content = "<li class='page' id='page"+i+"'><a href=''>"+i+"</a></li>";
        $('#next').before(content);
        $('#page'+currPage).addClass('active');
        $('#page'+currPage).remove('a');
        
      };
      if(currPage==len){
        $('#next').remove();
      }
      if(currPage==1){
        $('#prev').remove();
      }

      
    </script>
    <script>
      $('#next').on('click',function(){
        event.preventDefault();
        var totalPage=eval(${totalPages});
        var typeId = $('#typeId');

        $.ajax({
          type:"GET",
          url:"Article.pagincontroller.json",
          data:{
            currPage: currPage+1,
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

      $('#prev').on('click',function(){
        //window.scrollTo({ top: 500, behavior: 'smooth' });
        //event.preventDefault();
        var totalPage=eval(${totalPages});
        var typeId = $('#typeId');
        event.preventDefault();
        $.ajax({
          type:"GET",
          url:"Article.pagincontroller.json",
          data:{
            currPage: currPage-1,
            typeId:typeId,
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
        var typeId = $('#typeId');
        var page = $(this).text();
        $.ajax({
          type:"GET",
          url:"Article.pagincontroller.json",
          data:{
            currPage: page,
            typeId:typeId,
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
