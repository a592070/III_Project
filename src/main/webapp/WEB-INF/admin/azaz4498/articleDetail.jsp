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
    <title>FUN x TAIWAN</title>
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
            <h2 class="mb-3">${artBean.artTitle}</h2>
            <input type="button" value ="修改文章"class="btn btn-primary"id="edit_btn" onclick="location.href='<%=application.getContextPath()%>/edit/article/${artBean.artId}'"/>
            
            
              
            
             <div class="tag-widget post-tag-container mb-5 mt-5">
               <div class="tagcloud">
                 <a href="<%=application.getContextPath()%>/typeSearch/${artBean.articleType.typeId}" class="tag-cloud-link">${artBean.articleType.typeName}</a>
               </div>
             </div>
             <div class="ck-content">
            ${artBean.artContent}
          </div>

            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
                <img
                  src="../f_showUserPic/${artBean.artUserId}"
                  alt="image not available"
                  class="img-fluid mb-4"
                  width="100" height="100"
                />
              </div>
              <div class="desc align-self-md-center">
                <h3 style="font-family:'Noto Sans TC', sans-serif ;">${artBean.artUserId}</h3>
                <p>
                    
                </p>
              </div>
            </div>

            <div class="pt-5 mt-5">
              <h3 class="mb-5" style="font-family:'Noto Sans TC', sans-serif ;"><span id="commNum">${artBean.artCommNum}</span>則評論</h3>
              <ul class="comment-list">

                <c:forEach var="comment" items="${commentList}" varStatus="status">
                <li class="comment" >
                  <div class="vcard bio">
                    <img
                      src="../f_showUserPic/${comment.comUserId}"
                      alt="Image placeholder"
                    />
                  </div>
                  <div class="comment-body">
                    <h3 class="main_username">${comment.comUserId} 
                    <a data-toggle="collapse" href="#collapse${comment.comId}">
                      <i class="fas fa-angle-down float-right"></i>
                    </a>
                  </h3>
                  
                    <div class="meta">${comment.comDate}</div>
                    <p>
                      ${comment.comContent}
                    </p>
                   
                    <a href="javascript: void(0)" style="color:rgb(16, 141, 163);" class="com_edit" id="com_edit${comment.comId}">
                      <i class="fas fa-pencil-alt float-left mr-2">
                        <span>編輯</span>
                      </i>
                    </a>
                    <a href="javascript: void(0)" class="com_del" id="com_del${comment.comId}">
                      
                      <i class="fas fa-trash-alt float-left ">
                        <span>刪除</span>
                      </i>
                    </a>
                  
                  </div>
                  <div class="collapse" id="collapse${comment.comId}">
                  <ul class="children" id="children${comment.comId}">
                  <c:forEach var="m_comment" items="${comment.m_Comments}">
                    <li class="comment">
                      <div class="comment-body" >
                        <h6 class="sub_username">${m_comment.m_UserId}</h6>
                        <div class="meta">${m_comment.m_Date}</div>
                        <p>${m_comment.m_Content}</p>
                        <a href="javascript: void(0)" style="color:rgb(16, 141, 163);" class="mtc_edit" id="sub_edit${m_comment.m_Id}">
                      
                          <i class="fas fa-pencil-alt float-left mr-2">
                            <span>編輯</span>
                          </i>
                        </a>
                        <a href="javascript: void(0)" class="mtc_delete" id="sub_del${m_comment.m_Id}">
                          
                          <i class="fas fa-trash-alt float-left">
                            <span>刪除</span>
                          </i>
                        </a>
                      </div>
                      </li>
                    </c:forEach>
                      <li class="comment" id="m_com${comment.comId}">
                      <div class="d-flex flex-row comment-body">
                        <textarea id="tx${comment.comId}"class="ml-1 mr-1" style="border: solid 0.5px; border-radius: 8px; height: 30px; width: 540px; resize: none; box-shadow: 5px;"></textarea>
                        <p>
                          <a href="javascript:void(0);" class="reply" id="reply${comment.comId}">回覆</a>
                        </p>
                      </div>
                        
                    </li>
                      </ul>
                    </div>
                </li>
                </c:forEach>
              </ul>
              <!-- END comment-list -->

              <div class="comment-form-wrap pt-5" style="height: auto; width: auto;">
                <h3 class="mb-5" style="font-family:'Noto Sans TC', sans-serif ;">寫個評論吧...</h3>
                <!--評論表單-->
                <form class="p-5 bg-light" method="POST">
                  <input name="artId" type="hidden" id="c_artId" value="${artBean.artId}">
                  <div class="form-group">
                    <label for="name" style="font-family:'Noto Sans TC', sans-serif ;">使用者名稱 *</label>
                    <input type="text" placeholder="請先登入以評論" class="form-control" name="c_userId" id="c_userId" value="${userBean.userName}" readonly />
                  </div>
                  

                  <div class="form-group">
                    <label for="message" style="font-family:'Noto Sans TC', sans-serif ;">評論內容</label>
                    <textarea
                      name="c_content"
                      id="message"
                      cols="5"
                      rows="5"
                      class="form-control"
                      style="resize: none;"
                      
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
                <a href="javascript: void(0);" onclick="magic()">一鍵輸入</a>
              </div>
            </div>
          </div>
          <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3 style="font-family:'Noto Sans TC', sans-serif ;">文章分類</h3>
                <li>
                  <a href="<%=application.getContextPath()%>/typeSearch/1" style="font-family:'Noto Sans TC', sans-serif ;">旅遊 <span>${typeCount.travel}</span></a>
                </li>
                <li>
                  <a href="<%=application.getContextPath()%>/typeSearch/2" style="font-family:'Noto Sans TC', sans-serif ;">住宿 <span>${typeCount.accommodation}</span></a>
                </li>
                <li>
                  <a href="<%=application.getContextPath()%>/typeSearch/3" style="font-family:'Noto Sans TC', sans-serif ;">美食 <span>${typeCount.food}</span></a>
                </li>
                <li>
                  <a href="<%=application.getContextPath()%>/typeSearch/4" style="font-family:'Noto Sans TC', sans-serif ;">景點 <span>${typeCount.scenery}</span></a>
                </li>
                <li>
                  <a href="<%=application.getContextPath()%>/typeSearch/5" style="font-family:'Noto Sans TC', sans-serif ;">交通 <span>${typeCount.traffic}</span></a>
                </li>
                <li>
                  <a href="<%=application.getContextPath()%>/typeSearch/6" style="font-family:'Noto Sans TC', sans-serif ;">行程 <span>${typeCount.itinerary}</span></a>
                </li>
                <li>
                    <a href="<%=application.getContextPath()%>/typeSearch/7" style="font-family:'Noto Sans TC', sans-serif ;">購物 <span>${typeCount.shopping}</span></a>
                  </li>
                <li>
                    <a href="<%=application.getContextPath()%>/typeSearch/0" style="font-family:'Noto Sans TC', sans-serif ;">其他 <span>${typeCount.others}</span></a>
                  </li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 style="font-family:'Noto Sans TC', sans-serif ;">近期文章</h3>
              
              <c:forEach var='recent' items='${recentArt}' varStatus='status'>
                <div class="block-21 mb-4 d-flex">
                  <a
                    href="<%=application.getContextPath()%>/article/${recent.artId}"
                    class="blog-img mr-4"
                    style="
                      background-image: url('${recentArtPic[status.index]}');
                    ">
                    
                    
                  </a>
                  <div class="text">
                    <h3 class="heading">
                      <a href="<%=application.getContextPath()%>/article/${recent.artId}">
                        ${recent.artTitle}
                        </a
                      >
                    </h3>
                    <div class="meta">
                      <div>
                        <a href=""
                          ><span class="icon-calendar"></span>${recent.artCreTime}</a
                        >
                      </div>
                      <div>
                        <a href=""><span class="icon-person"></span>${recent.artUserId}</a>
                      </div>
                      <div>
                        <a href=""><span class="icon-chat"></span>${recent.artCommNum}</a>
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
    <!-- fixed btn-->
    <div class="fixed-btn">
      <a onclick="checkLogin()" class="btn btn-primary" href="javascript: void(0)" role="button"><i class="far fa-edit">撰寫文章</i></a>
    </div>

    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
      // 滑動+編輯文章按鈕隱藏
$(document).ready(function () {
  var userid = $("#c_userId").val();
  var op = "${artBean.artUserId}";
  var currUser ="${userBean.userName}"

  $('.main_username').each(function(index){
    var username=$(this).text().trim();
    if(currUser!=username || currUser==null){
      $(this).siblings('.com_del').hide();
      $(this).siblings('.com_edit').hide();
    }
  })

  $('.sub_username').each(function(index){
    var sub_username = $(this).text().trim();
    if(currUser!=sub_username||currUser==null){
      $(this).siblings('.mtc_delete').hide();
      $(this).siblings('.mtc_edit').hide();
    }
  })
  
  
  $("body,html").animate({ scrollTop: 750 }, 950);
  if (userid == op) {
    $("#edit_btn").show();
  } else {
    $("#edit_btn").hide();
  }
  
  var loginCheck= "${userBean.userName}";
  if (loginCheck == null || loginCheck == ""){
    $('.com_del').hide();
    $('.com_edit').hide();
    $('.mtc_del').hide();
    $('.mte_edit').hide();
  }


});

// 箭頭動畫

$('.comment-list').on('click','.fa-angle-down',function(){
  if ($(this).hasClass("fa-flip-vertical")) {
     $(this).removeClass("fa-flip-vertical");
  } else {
    $(this).addClass("fa-flip-vertical");
  }
})


$(window).scroll(function () {
  if ($(document).scrollTop() > 600) {
    $(".fixed-btn").show();
  } else {
    $(".fixed-btn").hide();
  }

});

$(".comment-list").on("click", ".reply", function () {
  console.log("reply has benn clicked");
  event.preventDefault();
  var id = $(this).attr("id");
  var str = id.replace("reply", "m_com");
  var textarea = id.replace("reply", "tx");
  var comId = id.replace("reply", "");
  var mc_content = $("#" + textarea).val();
  var loginCheck = "${userBean.userName}";

  if (loginCheck == null || loginCheck == "") {
    Swal.fire({
      title: "請先登入",
      text: "登入以回覆他人評論",
      html:
        "<a href='<%=application.getContextPath()%>/user/signinPage'><u>登入</u></a>以回覆他人評論",
      icon: "warning",
      confirmButtonText: "好",
    });
  } else if (mc_content == null || mc_content == "") {
    Swal.fire({
      title: "請輸入內容再進行留言",
      icon: "warning",
    });
    $("#" + textarea).focus();
  } else {
    $.ajax({
      type: "POST",
      url: "../newMultiComment.controller",
      data: {
        comId: comId,
        mc_content: mc_content,
      },
      success: function (response) {
        $("#" + textarea).val("");
        $("#" + str).before(
          '<li class="comment">' +
            '<div class="comment-body">' +
            '<h6 class="sub_username">' +
            response.m_UserId +
            "</h6>" +
            '<div class="meta">' +
            response.m_Date +
            "</div>" +
            "<p>" +
            response.m_Content +
            "</p>" +
            '<a href="javascript: void(0)" class="mtc_edit" id="sub_edit'+response.m_Id+'"style="color:rgb(16, 141, 163);">' +
            '<i class="fas fa-pencil-alt float-left mr-2">' +
            "<span>編輯</span></i></a>" +
            '<a href="javascript: void(0)" id="sub_del'+response.m_Id+'"class="mtc_delete">' +
            '<i class="fas fa-trash-alt float-left">' +
            "<span>刪除</span></i></a>" +
            "</div>" +
            "</li>" +
            "</ul>" +
            "</li>"
        );
      },
    });
  }
});

$('.comment-list').on('click','.com_edit',function(){
  var orgContent = $(this).prev('p').text().trim();
  var $t = $(this).prev('p');
  Swal.fire({
    input:"textarea",
    inputLabel:"編輯留言",
    inputPlaceholder:"在此輸入內容...",
    inputValue:orgContent,
    showCancelButton:"true",
    cancelButtonText:"取消",
    confirmButtonText:"確認修改",
    inputValidator:(value)=>{
      if(!value){
        return '請輸入內容!'
      }
    }
    
}).then((result)=>{
  if(result.isConfirmed){
    var str = $(this).attr('id');
        var id = str.replace('com_edit','').trim();
        var user = "${userBean.userName}".trim();
        var newContent = result.value;
        $.ajax({
          type:'POST',
          url:'../editComment',
          data:{
            content:newContent,
            user:user,
            id:id,
          },
          success:function(response){
            $t.text(response.comContent);
          }
          })
          Swal.fire('留言修改完成','','success')
  }
})
})
//多層留言編輯
$('.comment-list').on('click','.mtc_edit',function(){
  var orgContent = $(this).prev('p').text().trim();
  var $t = $(this).prev('p');
  Swal.fire({
    input:"textarea",
    inputLabel:"編輯留言",
    inputPlaceholder:"在此輸入內容...",
    inputValue:orgContent,
    showCancelButton:"true",
    cancelButtonText:"取消",
    confirmButtonText:"確認修改",
    inputValidator:(value)=>{
      if(!value){
        return '請輸入內容!'
      }
    }
    
}).then((result)=>{
  if(result.isConfirmed){
    var str = $(this).attr('id');
        var id = str.replace('sub_edit','').trim();
        var user = "${userBean.userName}".trim();
        var newContent = result.value;
        $.ajax({
          type:'POST',
          url:'../editMultiComment',
          data:{
            content:newContent,
            user:user,
            id:id,
          },
          success:function(response){
            $t.text(response.m_Content);
          }
          })
          Swal.fire('留言修改完成','','success')
  }
})

})


//大留言刪除
$('.comment-list').on('click','.com_del',function(){

  Swal.fire({
      title: "確認刪除留言?",
      text: "留言刪除後無法回復",
      icon: "warning",
      confirmButtonText: "確認",
      showCancelButton: true,
      cancelButtonText:"取消",
    }).then((result)=>{
      if(result.isConfirmed){
        var user = "${userBean.userName}".trim();
        var str = $(this).attr('id');
        var com_Id = str.replace('com_del','').trim();
        var $t = $(this).closest('li');
        var commNum = eval($("#commNum").text());
        $("#commNum").text(eval(commNum - 1));
        $.ajax({
          type:'POST',
          url:'../deleteComment/'+com_Id,
          data:{user: user},
          success:function(response){
            if(response){
              $t.remove();
            }else{
              alert('刪除失敗');
            }
          }
        })
        Swal.fire('留言已刪除','','success')
      }
    })
})
//多層留言刪除
$('.comment-list').on('click','.mtc_delete',function(){


  Swal.fire({
      title: "確認刪除留言?",
      text: "留言刪除後無法回復",
      icon: "warning",
      confirmButtonText: "確認",
      showCancelButton: true,
      cancelButtonText:"取消",
    }).then((result)=>{
      if(result.isConfirmed){
        var user = "${userBean.userName}".trim();
        var str = $(this).attr('id');
        var mtc_Id = str.replace('sub_del','').trim();
        console.log(mtc_Id);
        var $t = $(this).closest('li');
        $.ajax({
          type:'POST',
          url:'../deleteMultiComment/'+mtc_Id,
          data:{user: user},
          success:function(response){
            if(response){
              $t.remove();
            }else{
              alert('刪除失敗');
            }
          }
        })
        Swal.fire('留言已刪除','','success')
      }
    })
})

$("#post_btn").on("click", function (event) {
  event.preventDefault();
  var c_content = $("#message").val();
  var c_artId = $("#c_artId").val();
  var loginCheck = "${userBean.userName}";
  console.log(loginCheck);
  if (loginCheck == null || loginCheck == "") {
    Swal.fire({
      title: "請先登入",
      html:
        "<a href='<%=application.getContextPath()%>/user/signinPage'><u>登入</u></a>以發表評論",
      icon: "warning",
    });
  } else if (c_content == null || c_content == "") {
    Swal.fire({
      title: "請輸入內容再進行留言",
      icon: "warning",
    });

    $("#message").focus();
  } else {
    Swal.fire({
          title:'確認發佈留言?',
          icon:'warning',
          confirmButtonText:'確認',
          showCancelButton:true,
          cancelButtonText:'取消',
        }).then((result)=>{
          if(result.isConfirmed){
            var c_content = $("#message").val();
            var c_artId = $("#c_artId").val();
            $.ajax({
      type: "POST",
      url: "../newComment.controller",
      data: {
        c_content: c_content,
        artId: c_artId,
      },
      success: function (response) {
        $(".comment-list").append(
          "<li class='comment'>" +
            "<div class='vcard bio'>" +
            "<img src='" +
            "../f_showUserPic/" +
            response.comUserId +
            "'" +
            "/>" +
            "</div>" +
            "<div class='comment-body'>" +
            "<h3 class='main_username'>" +
            response.comUserId +
            "<a data-toggle='collapse' href='#collapse" +
            response.comId +
            "'>" +
            "<i class='fas fa-angle-down float-right'></i></a></h3>" +
            "<div class='meta'>" +
            response.comDate +
            "</div>" +
            "<p>" +
            response.comContent +
            "</p>" +
            '<a href="javascript: void(0)" id="com_edit'+response.comId+'"class="com_edit" style="color:rgb(16, 141, 163);">' +
            '<i class="fas fa-pencil-alt float-left mr-2"><span>編輯</span></i></a>' +
            '<a href="javascript: void(0)" class="com_del" id="com_del'+response.comId+'">' +
            '<i class="fas fa-trash-alt float-left "> <span>刪除</span></i></a>' +
            "</div>" +
            "<div class='collapse' id='collapse" +
            response.comId +
            "'>" +
            "<ul class='children' id='children" +
            response.comId +
            "'>" +
            "<li class='comment' id='m_com" +
            response.comId +
            "'>" +
            "<div class='d-flex flex-row comment-body'>" +
            "<textarea class='ml-1 form-control'" +
            "id='tx" +
            response.comId +
            "'" +
            " style='border-radius: 10px; height: 105px; width: 1045px; resize: none; box-shadow: 5px;'></textarea>" +
            "</div>" +
            "<div class='d-inline-flex flex-row-reverse comment-body mt-2'>" +
            "<p><a href='javascript:void(0);' class='reply' id='reply" +
            response.comId +
            "'>回覆</a>" +
            "</p></div></li></ul></div></li>"
        );
        var commNum = eval($("#commNum").text());
        console.log(commNum);

        $("#message").val("");
        $("#commNum").text(eval(commNum + 1));
      },
    });
          }
        })
  }
});

  </script>
    
    <script>
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
