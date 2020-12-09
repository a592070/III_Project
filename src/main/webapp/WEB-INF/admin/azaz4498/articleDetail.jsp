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
    <title>文章頁面</title>
    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap');
        p{
            font-family: 'Noto Sans TC', sans-serif;
        }
        h2 {
            font-family: 'Noto Sans TC', sans-serif;
        }
        h3 {
            font-family: 'Noto Sans TC', sans-serif;
        }
    </style>
    
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
              <span class="mr-2">探索台灣</span>
             
              
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

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-md-8 ftco-animate">
             <h2 class="mb-3">${artList[0].artTitle}</h2>
             <div class="tag-widget post-tag-container mb-5 mt-5">
               <div class="tagcloud">
                 <a href="#" class="tag-cloud-link">${artList[0].articleType.typeName}</a>
               </div>
             </div>
            ${artList[0].artContent}


            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
                <img
                  src="<c:url value='/direngine-master/images/person_1.jpg'/>"
                  alt="Image placeholder"
                  class="img-fluid mb-4"
                  width="100" height="100"
                />
              </div>
              <div class="desc align-self-md-center">
                <h3 style="font-family:'Noto Sans TC', sans-serif ;">${artList[0].artUserId}</h3>
                <p>
                    
                </p>
              </div>
            </div>

            <div class="pt-5 mt-5">
              <h3 class="mb-5" style="font-family:'Noto Sans TC', sans-serif ;"><span id="commNum">${artList[0].artCommNum}</span>則評論</h3>
              <ul class="comment-list">

                <c:forEach var="comment" items="${commentList}" varStatus="status">
                <li class="comment">
                  <div class="vcard bio">
                    <img
                      src="<c:url value='/direngine-master/images/person_1.jpg'/>"
                      alt="Image placeholder"
                    />
                  </div>
                  <div class="comment-body">
                    <h3>${comment.comUserId}</h3>
                    <div class="meta">${comment.comDate}</div>
                    <p>
                      ${comment.comContent}
                    </p>
                    <p><a href="#" class="reply">回覆</a></p>
                  </div>
                </li>
                </c:forEach>
              </ul>
              <!-- END comment-list -->

              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5" style="font-family:'Noto Sans TC', sans-serif ;">寫個評論吧...</h3>
                <!--評論表單-->
                <form action="../newComment.controller" class="p-5 bg-light" method="POST">
                  <input type="hidden" id="c_artId" value="${artList[0].artId}">
                  <div class="form-group">
                    <label for="name" style="font-family:'Noto Sans TC', sans-serif ;">使用者名稱 *</label>
                    <input type="text" class="form-control" name="c_userId" id="c_userId" />
                  </div>
                  

                  <div class="form-group">
                    <label for="message" style="font-family:'Noto Sans TC', sans-serif ;">評論內容</label>
                    <textarea
                      name="c_content"
                      id="message"
                      cols="30"
                      rows="10"
                      class="form-control"
                    ></textarea>
                  </div>
                  <div class="form-group">
                    <input
                      id="post_btn"
                      type="submit"
                      value="發表評論"
                      class="btn py-3 px-4 btn-primary"
                    />
                  </div>
                </form>
              </div>
            </div>
          </div>
          <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3 style="font-family:'Noto Sans TC', sans-serif ;">文章分類</h3>
                <li>
                  <a href="../typeSearch/1" style="font-family:'Noto Sans TC', sans-serif ;">旅遊 <span>${typeCount.travel}</span></a>
                </li>
                <li>
                  <a href="../typeSearch/2" style="font-family:'Noto Sans TC', sans-serif ;">住宿 <span>${typeCount.accommodation}</span></a>
                </li>
                <li>
                  <a href="../typeSearch/3" style="font-family:'Noto Sans TC', sans-serif ;">美食 <span>${typeCount.food}</span></a>
                </li>
                <li>
                  <a href="../typeSearch/4" style="font-family:'Noto Sans TC', sans-serif ;">景點 <span>${typeCount.scenery}</span></a>
                </li>
                <li>
                  <a href="../typeSearch/5" style="font-family:'Noto Sans TC', sans-serif ;">交通 <span>${typeCount.traffic}</span></a>
                </li>
                <li>
                  <a href="../typeSearch/6" style="font-family:'Noto Sans TC', sans-serif ;">行程 <span>${typeCount.itinerary}</span></a>
                </li>
                <li>
                    <a href="../typeSearch/7" style="font-family:'Noto Sans TC', sans-serif ;">購物 <span>${typeCount.shopping}</span></a>
                  </li>
                <li>
                    <a href="../typeSearch/0" style="font-family:'Noto Sans TC', sans-serif ;">其他 <span>${typeCount.others}</span></a>
                  </li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 style="font-family:'Noto Sans TC', sans-serif ;">近期文章</h3>
              
              <c:forEach var='recent' items='${recentArt}' varStatus='status'>
                <div class="block-21 mb-4 d-flex">
                  <a
                    class="blog-img mr-4"
                    style="
                      background-image: url(<c:url value='/${recentArtPic[status.index]}'/>);
                    "
                    <
                    
                  ></a>
                  <div class="text">
                    <h3 class="heading">
                      <a href="#">
                        ${recent.artTitle}
                        </a
                      >
                    </h3>
                    <div class="meta">
                      <div>
                        <a href="#"
                          ><span class="icon-calendar"></span>${recent.artCreTime}</a
                        >
                      </div>
                      <div>
                        <a href="#"><span class="icon-person"></span>${recent.artUserId}</a>
                      </div>
                      <div>
                        <a href="#"><span class="icon-chat"></span>${recent.artCommNum}</a>
                      </div>
                    </div>
                  </div>
                </div>

              </c:forEach>
              
            </div>
          </div>
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

    <script>
      $('#post_btn').on('click',function(){
        event.preventDefault();
        var c_content = $('#message').val();
        var c_userId=$('#c_userId').val();
        var c_artId=$('#c_artId').val();
        console.log('content='+c_content);
        console.log('userid='+c_userId);
        console.log('artid='+c_artId);

        $.ajax({
          type:"POST",
          url:"../newComment.controller",
          data:{
            c_content:c_content,
            c_userId:c_userId,
            artId: c_artId
          },
          success:function(response){
            console.log(response);
            $('.comment-list').append(
              "<li class='comment'>"+
              "<div class='vcard bio'>"+
              "<img src='"+
              "<c:url value='/direngine-master/images/person_1.jpg'/>'"+
              ' alt="Image placeholder"/>'+
              "</div>"+                 
              "<div class='comment-body'>"+
              "<h3>"+response.comUserId+"</h3>"+
              "<div class='meta'>"+response.comDate+"</div>"+
              "<p>"+response.comContent+"</p>"+
              "<p><a href='' class='reply'>回覆</a></p>"+
             " </div></li>"
            )
            var commNum = eval($('#commNum').text());
            console.log(commNum);
            
            $('#message').val('');
            $('#commNum').text(eval(commNum+1));
            
          }
        })

      })

    </script>
  </body>
</html>
