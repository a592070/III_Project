<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      width: 18px;
    }
  </style>
</head>


<body>
  <!-- Start nav -->
  <c:import url="/WEB-INF/admin/fragment/nav.jsp" />
  <!-- END nav -->

  <div class="hero-wrap js-fullheight" style="background-image: url('../direngine-master/images/user-1.jpg');">
    <div class="overlay"></div>
    <div class="container" style="text-align : center">
      <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
        data-scrollax-parent="true">
        <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
          <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2">FUN x 臺灣</span> <span>註冊</span></p>
          <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員註冊</h1>
        </div>
      </div>
    </div>
  </div>

  <section class="ftco-section contact-section ftco-degree-bg">
    <div class="container ftco-animate">
      <div class="row d-flex mb-5 contact-info" style="text-align : center">
        <div class="col-md-12 mb-4">
          <h2 class="mb-1 bread">會員註冊</h2>
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
      <form method="POST" id="Form" enctype="multipart/form-data">
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <div class="form-group">
              <h2 class="mb-2 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">會員資料</h2>
              <select class="custom-select" name="identity" id="identity">
                <option value="2" selected>一般會員</option>
                <option value="3">餐廳業者</option>
                <option value="4">住宿業者</option>
              </select>
            </div>
            <div class="form-group">
              <h3 class="mb-3 bread" style="display: inline;"
                data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">帳號</h3>
              <img class="img" id="aimg" src=""><span id="asp"></span><br />
              <input class="form-control" type="text" id="username" name="username" placeholder="請輸入帳號" />
            </div>
            <div class="form-group">
              <h3 class="mb-3 bread" style="display: inline;"
                data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼</h3>
              <img class="img" id="pimg" src=""><span id="psp"></span><br />
              <input class="form-control" type="password" id="password" name="password" autocomplete="off"
                placeholder="請輸入密碼" />
            </div>
            <div class="form-group">
              <h3 class="mb-3 bread" style="display: inline;"
                data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">密碼確認</h3>
              <img class="img" id="cimg" src=""><span id="csp"></span><br />
              <input class="form-control" type="password" id="checkpassword" placeholder="請確認密碼" />
            </div>
            <div class="form-group">
              <h3 class="mb-3 bread" style="display: inline;"
                data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Email</h3>
              <img class="img" id="eimg" src=""><span id="esp"></span><br />
              <input class="form-control" type="text" id="email" name="email" placeholder="請輸入email" />
            </div>
            <div class="form-group">
             
              <input type="button" value="帶入資料" class="btn btn-light py-1 px-1" id="fastSignup">
          
            </div>
          </div>
          <!-- 會員or店家 -->
          <div class="col-md-6 pr-md-5">
            <!-- 會員基本資料 -->
            <div id="userInfo">
              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">暱稱</h3>
                <input class="form-control" type="text" id="nickname" name="nickname" placeholder="請輸入暱稱" />
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">個人照片</h3>
                <input type="file" id="Apicture" name="Apicture" accept="image/*" style="display: none">
                <button type="button" onclick="Apicture.click()" class="btn btn-light">上傳圖片</button>
                <button type="button" class="btn btn-light" id="delApic">取消圖片</button>
                <img class="img-2 d-flex justify-content-center align-items-center" id="userPic" style="height : 300px"
                  src="<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png" />
              </div>

            </div>
            <!-- 餐廳基本資料 -->
            <div id="resInfo" style="display: none;">
              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">餐廳名稱</h3>
                <input class="form-control" type="text" id="Rname" name="Rname" disabled></input>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">餐廳封面照</h3>
                <input type="file" id="Rpicture" name="Rpicture" accept="image/*" style="display: none" disabled>
                <button type="button" onclick="Rpicture.click()" class="btn btn-light">上傳圖片</button>
                <button type="button" class="btn btn-light" id="delRpic">取消圖片</button>
                <img class="img-2 d-flex justify-content-center align-items-center" id="resPic" style="height : 300px"
                  src="<%=application.getContextPath()%>/assets/img/iring29/Restaurant_img.png" />
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">餐廳地區</h3>
                <select class="custom-select" name="Rregion" id="Rregion" disabled>
                  <option value="" selected>請選擇地區</option>
                  <option value="基隆">基隆</option>
                  <option value="新北">新北</option>
                  <option value="台北">台北</option>
                  <option value="桃園">桃園</option>
                  <option value="新竹">新竹</option>
                  <option value="苗栗">苗栗</option>
                  <option value="台中">台中</option>
                  <option value="彰化">彰化</option>
                  <option value="南投">南投</option>
                  <option value="雲林">雲林</option>
                  <option value="嘉義">嘉義</option>
                  <option value="台南">台南</option>
                  <option value="高雄">高雄</option>
                  <option value="屏東">屏東</option>
                  <option value="宜蘭">宜蘭</option>
                  <option value="花蓮">花蓮</option>
                  <option value="台東">台東</option>
                  <option value="澎湖">澎湖</option>
                  <option value="金門">金門</option>
                  <option value="連江">連江</option>
                </select>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">餐廳完整地址</h3>
                <textarea class="form-control" type="text" id="Raddress" name="Raddress" disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">交通方式</h3>
                <textarea class="form-control" type="text" id="Rtrans" name="Rtrans" disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">適合聚餐類型</h3>
                <textarea class="form-control" type="text" id="Rservice" name="Rservice" placeholder="例如：朋友聚餐、家庭聚餐..."
                  disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">料理種類</h3>
                <textarea class="form-control" type="text" id="Rtype" name="Rtype" placeholder="例如：西式料理、中式料理..."
                  disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">營業時間</h3>
                <textarea class="form-control" type="text" id="Ropentime" name="Ropentime" disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">餐廳描述</h3>
                <textarea class="form-control" type="text" id="Rdescription" name="Rdescription" disabled></textarea>
              </div>

            </div>

            <!-- 住宿基本資料 -->
            <div id="hotelInfo" style="display: none;">
              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿名稱</h3>
                <input class="form-control" type="text" id="Hname" name="Hname" disabled></input>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿封面照</h3>
                <input type="file" id="Hpicture" name="Hpicture" accept="image/*" style="display: none" disabled>
                <button type="button" onclick="Hpicture.click()" class="btn btn-light">上傳圖片</button>
                <button type="button" class="btn btn-light" id="delHpic">取消圖片</button>
                <img class="img-2 d-flex justify-content-center align-items-center" id="hotPic" style="height : 300px"
                  src="https://i.imgur.com/D690ggE.jpg" />
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿地區</h3>
                <select class="custom-select" name="Hregion" id="Hregion" disabled>
                  <option value="" selected>請選擇地區</option>
                  <option value="">選擇地區...</option>
                  <option value="基隆市">基隆市</option>
                  <option value="新北市">新北市</option>
                  <option value="臺北市">臺北市</option>
                  <option value="桃園市">桃園市</option>
                  <option value="新竹市">新竹市</option>
                  <option value="新竹縣">新竹縣</option>
                  <option value="苗栗縣">苗栗縣</option>
                  <option value="宜蘭縣">宜蘭縣</option>
                  <option value="臺中市">臺中市</option>
                  <option value="彰化縣">彰化縣</option>
                  <option value="南投縣">南投縣</option>
                  <option value="雲林縣">雲林縣</option>
                  <option value="嘉義市">嘉義市</option>
                  <option value="嘉義縣">嘉義縣</option>
                  <option value="臺南市">臺南市</option>
                  <option value="高雄市">高雄市</option>
                  <option value="屏東縣">屏東縣</option>
                  <option value="花蓮縣">花蓮縣</option>
                  <option value="臺東縣">臺東縣</option>
                  <option value="澎湖縣">澎湖縣</option>
                  <option value="金門縣">金門縣</option>
                  <option value="連江縣">連江縣</option>
                </select>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿類型</h3>
                <select class="custom-select" name="Htype" id="Htype" disabled>
                  <option value="飯店">飯店</option>
                  <option value="民宿">民宿</option>
                  <option value="汽車旅館">汽車旅館</option>
                </select>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿地址</h3>
                <textarea class="form-control" type="text" id="Haddress" name="Haddress" disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿電話</h3>
                <input class="form-control" type="text" id="Htel" name="Htel" disabled></input>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">雙人房價格</h3>
                <input class="form-control" type="text" id="Hdroom" name="Hdroom" disabled></input>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">四人房價格</h3>
                <input class="form-control" type="text" id="Hqroom" name="Hqroom" disabled></input>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">住宿介紹</h3>
                <textarea class="form-control" type="text" id="Hdescription" name="Hdescription" disabled></textarea>
              </div>

              <div class="form-group">
                <h3 class="mb-3 bread" style="display: inline;"
                  data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">營業時間</h3>
                <textarea class="form-control" type="text" id="Hopentime" name="Hopentime" disabled></textarea>
              </div>

            </div>

          </div>
        </div>
        <div class="form-group" style="text-align : center">
          <input type="button" value="註冊" class="btn btn-primary py-3 px-5" id="submit" disabled>
          <p style="font-size: 18px">
            已經有帳號 ? <a class="text-info stretched-link"
              href="${pageContext.servletContext.contextPath}/user/signinPage">登入</a>
          </p>
        </div>
      </form>
    </div>
  </section>


  <c:import url="/WEB-INF/admin/fragment/footer.jsp" />





  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#F96D00" /></svg></div>
  <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  <script>
    $(document).ready(function(){
      $('body,html').animate({scrollTop: 700}, 800); 
      });


    //圖片預覽
    $("#Apicture,#Rpicture").change(function () {
      readURL(this);
    })

    function readURL(input) {

      if (input.files && input.files[0]) {
        console.log("我會幫你換圖片")
        var reader = new FileReader();

        reader.onload = function (e) {
          $(input).siblings('img').attr('src', e.target.result);
          // $("#userPic").attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);

      }

    }
    //取消帳號圖片
    $("#delApic").click(function () {
      $("#userPic").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/NoImage.png")
    })
    //取消餐廳圖片
    $("#delRpic").click(function () {
      $("#resPic").attr("src", "<%=application.getContextPath()%>/assets/img/iring29/Restaurant_img.png")
    })
    //取消住宿圖片
    $("#delHpic").click(function () {
      $("#hotPic").attr("src", "https://i.imgur.com/D690ggE.jpg")
    })


    $("#identity").change(function () {
      var identity = $(this).val()
      if (identity == 2) {
        $("#userInfo").show("duration")
        $("#userInfo").children().children().attr("disabled", false)

        $("#resInfo").hide("duration")
        $("#resInfo").children().children().attr("disabled", true)

        $("#hotelInfo").hide("duration")
        $("#hotelInfo").children().children().attr("disabled", true)

      } else if (identity == 3) {
        $("#userInfo").hide("duration")
        $("#userInfo").children().children().attr("disabled", true)

        $("#resInfo").show("duration")
        $("#resInfo").children().children().attr("disabled", false)

        $("#hotelInfo").hide("duration")
        $("#hotelInfo").children().children().attr("disabled", true)

      } else if (identity == 4) {
        $("#userInfo").hide("duration")
        $("#userInfo").children().children().attr("disabled", true)

        $("#resInfo").hide("duration")
        $("#resInfo").children().children().attr("disabled", true)

        $("#hotelInfo").show("duration")
        $("#hotelInfo").children().children().attr("disabled", false)

      } else if ((identity == 5)) {
        $("#userInfo").hide("duration")
        $("#userInfo").children().children().attr("disabled", true)

        $("#resInfo").hide("duration")
        $("#resInfo").children().children().attr("disabled", true)

        $("#hotelInfo").hide("duration")
        $("#hotelInfo").children().children().attr("disabled", true)
      }

    })


    //帳號check
    var f1 = false;
    var f2 = false;
    var f3 = false;
    var f4 = false;
    $("#email,#password,#username,#checkpassword").on("keyup change blur", function () {
      var status;
      $("#aimg").attr("src", "");
      $("#asp").text("");
      var username = $("#username").val();
      if (username == "") {
        $("#aimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#asp").text("帳號不能為空");
        $("#asp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
        $("#submit").attr("disabled", true)
        return;
      }
      $.ajax(
        {
          type: 'POST',
          data: { "userName": username },
          url: '${pageContext.servletContext.contextPath}/admin/checkUser',
          dataType: 'json',
          success: function (response) {
            checkusr(response);

          }
        }
      )
    })
    function checkusr(response) {
      if (response) {
        console.log(response);
        $("#aimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#asp").text("帳號重複");
        $("#asp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
        $("#submit").attr("disabled", true)
      } else {
        $("#aimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
        $("#asp").text("帳號可以使用");
        $("#asp").css({ "color": "black", "fontSize": "18px", "fontStyle": "italic" });
        // $("#submit").attr("disabled", false)
        f1 = true;
        if (f1 && f2 && f3 && f4) {
          $("#submit").attr("disabled", false);
        }
      }
    }
    $("#email,#password,#username,#checkpassword").on("keyup change blur", function () {
      var password = $("#password").val();
      if (password == "") {
        $("#pimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#psp").text("密碼不能為空");
        $("#psp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
        $("#submit").attr("disabled", true)
        return;
      }
      $("#pimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
      $("#psp").text("密碼可以使用");
      $("#psp").css({ "color": "black", "fontSize": "18px", "fontStyle": "italic" });
      // $("#submit").attr("disabled", false)
      f2 = true;
      if (f1 && f2 && f3 && f4) {
        $("#submit").attr("disabled", false);
      }
    })
    $("#email,#password,#username,#checkpassword").on("keyup change blur", function () {
      var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      var email = $('#email').val();
      if (email == "") {
        $("#eimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#esp").text("email不能為空");
        $("#esp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
        $("#submit").attr("disabled", true);
      } else if (!regex.test(email)) {
        $("#eimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#esp").text("email格式不正確");
        $("#esp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
        $("#submit").attr("disabled", true);
      } else {
        $("#eimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
        $("#esp").text("email格式正確");
        $("#esp").css({ "color": "black", "fontSize": "18px", "fontStyle": "italic" });
        f3 = true;
        if (f1 && f2 && f3 && f4) {
          $("#submit").attr("disabled", false);
        }
      }
    })
    $("#email,#password,#username,#checkpassword").on("keyup change blur", function () {
      var password = $("#password").val();
      var checkpassword = $("#checkpassword").val();
      if (checkpassword == "") {
        $("#cimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#csp").text("確認密碼不能為空");
        $("#csp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
      } else if (password != checkpassword) {
        $("#cimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/error.png");
        $("#csp").text("密碼與確認密碼不相同");
        $("#csp").css({ "color": "red", "fontSize": "18px", "fontStyle": "italic" });
      } else if (password == checkpassword) {
        $("#cimg").attr("src", "<%=application.getContextPath()%>/assets/img/rambo0021/check.png");
        $("#csp").text("正確");
        $("#csp").css({ "color": "black", "fontSize": "18px", "fontStyle": "italic" });
        f4 = true;
        if (f1 && f2 && f3 && f4) {
          $("#submit").attr("disabled", false);
        }
      }
    })
  
    $("#submit").click(function () {
      swal({
        title:"處理中",
        button: false,
        icon: '<%=application.getContextPath()%>/assets/img/rambo0021/giphy.gif'
      })
      var form1 = $(this).parents('form');
      var formData = new FormData(form1[0]);
    
      $.ajax({

        type: "POST",
        url: "${pageContext.servletContext.contextPath}/user/signup",
        data: formData,
        processData: false,
        contentType: false,
        dataType: "json",

        success: (response) => {
          console.log(response)
          swal({
            title: "註冊成功!",
            text: "即將轉入登入頁面!",
            icon: "success",
            button: false
          });
          setTimeout(function () { location.href = "<%=application.getContextPath()%>/user/signinPage"; }, 2000);

        },

        error: function (xhr, ajaxOptions, thrownError) {
          console.log("我壞了")
          console.log(xhr.status + "\n" + thrownError);
        }

      });

    })

    //一鍵輸入
    $("#fastSignup").click(function(){
      //個人資料
      $("#username").val("yourhomesteak");
      $("#password").val("yourhomesteak");
      $("#checkpassword").val("yourhomesteak");
      $("#email").val("iiiteam124@gmail.com");

      //餐廳資料
      $("#Rname").val("你家牛排");
      $("#Rregion").val("桃園");
      $("#Raddress").val("桃園市中壢區中大路888號");
      $("#Rtrans").val("停車資訊：路邊可停車");
      $("#Rservice").val("家庭聚餐, 朋友聚餐");
      $("#Rtype").val("西式料理, 創意料理, 牛排, 套餐");
      $("#Ropentime").val("[全天開放]週一 - 週五 09:30-17:30 週六 - 週日 09:30-18:00");
      $("#Rdescription").val("適合青少年, 受大學生歡迎, 適合肉食愛好者, 提供優質甜點, 提供優質啤酒選項,, 信用卡");
      $("#email,#password,#username,#checkpassword").blur();
     
    })

  </script>
</body>

</html>