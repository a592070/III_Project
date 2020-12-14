<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/admin/fragment/vue_ref.jsp"/>
<script type="module" src="${pageContext.servletContext.contextPath}/assets/a592070/notify/js/notify.js"></script>


<link
  href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
  rel="stylesheet"
/>
<style>
  .icon-shopping-cart {
    width: 50px;
    font-size: 2em;
    color: white;
  }
  .nav-shop__circle {
    font-size: 9px;
    background: #384aeb;
    color: #fff;
    padding: 0px 6px;
    border-radius: 50%;
    position: absolute;
    top: -0.5px;
  }
  .ftco-navbar-light.scrolled .nav-link .icon-shopping-cart {
    padding-top: 0.9rem !important;
    padding-bottom: 0.9rem !important;
    color: #000000 !important;
  }
 .navbar-brand {
    font-size: 27px;
}
.ftco-navbar-light .navbar-nav > .nav-item > .nav-link {
    font-size: 18px;
}
</style>
<nav
  class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
  id="ftco-navbar"
>
  <div class="container">
    <a class="navbar-brand" href="<%=application.getContextPath()%>/FunTaiwan"
      >FUN TAIWAN</a
    >
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#ftco-nav"
      aria-controls="ftco-nav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="oi oi-menu"></span> Menu
    </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
<!--           <li class="nav-item"> -->
<!--             <a href="index.html" class="nav-link">首頁</a> -->
<!--           </li> -->
          <li class="nav-item">
            <a href="about.html" class="nav-link">關於我</a>
          </li>
          <li class="nav-item">
            <a href="${pageContext.servletContext.contextPath}/attraction/index" class="nav-link">找景點</a>
          </li>
          <li class="nav-item">
            <a
              href="<%=application.getContextPath()%>/Hotel_index"
              class="nav-link"
              >找住宿</a
            >
          </li>
          <li class="nav-item">
            <a
              href="<%=application.getContextPath()%>/Restaurant_index"
              class="nav-link"
              >找餐廳</a
            >
          </li>
          <li class="nav-item"><a href="<%=application.getContextPath()%>/highspeedrail.controller" class="nav-link">找交通</a></li>
          <li class="nav-item">
            <a href="<%=application.getContextPath()%>/forum_index" class="nav-link">論壇</a>
          </li>
          <c:if test="${empty userBean}">
            <li class="nav-item">
              <a
                href="<%=application.getContextPath()%>/user/signinPage"
                class="nav-link"
                >登入</a
              >
            </li>
            <li class="nav-item">
              <a
                href="<%=application.getContextPath()%>/user/registrationPage"
                class="nav-link"
                >註冊</a
              >
            </li>
          </c:if>
          <c:if test="${!empty userBean}">
            <li class="nav-item">
              <a
                href="<%=application.getContextPath()%>/user/signout"
                class="nav-link"
                >登出</a
              >
            </li>
            <li class="nav-item">
              <a
                href="<%=application.getContextPath()%>/user/userProfilePage"
                class="nav-link"
                >個人頁面</a
              >
            </li>
            <li class="nav-item">
              <a
                href="<%=application.getContextPath()%>/user/userOrderListPage"
                class="nav-link"
                >我的訂單</a
              >
            </li>
          </c:if>
          <li class="nav-item">
            <FORM
              id="shoppingcart"
              action="<%=application.getContextPath()%>/ShoppingCart"
              method="POST"
            >
              <a
                href="javascript:document.getElementById('shoppingcart').submit();"
                class="nav-link"
              >
                <i class="icon-shopping-cart"></i
                ><span class="nav-shop__circle"></span> </a
            ></FORM>
          </li>
        </ul>
      </div>
    </div>
    <div id="notify">
      <index></index>
    </div>
  </div>
</nav>
