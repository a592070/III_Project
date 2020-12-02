
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.icon-shopping-cart{
	width:50px;
	padding-right:10px;
	font-size: 2em;
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">FUN TAIWAN</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index.html" class="nav-link">首頁</a></li>
          <li class="nav-item"><a href="about.html" class="nav-link">關於我</a></li>
          <li class="nav-item"><a href="tour.html" class="nav-link">景點</a></li>
          <li class="nav-item"><a href="" class="nav-link">找住宿</a></li>
          <li class="nav-item"><a href="<%=application.getContextPath()%>/Restaurant_index" class="nav-link">找餐廳</a></li>
          <li class="nav-item"><a href="" class="nav-link">找交通</a></li>
          <li class="nav-item"><a href="blog.html" class="nav-link">論壇</a></li>
          <li class="nav-item"><a href="contact.html" class="nav-link">聯絡我</a></li>
          <li class="nav-item">
          <FORM id="shoppingcart" action="<%=application.getContextPath()%>/ShoppingCart" method="POST">
          <a href="javascript:document.getElementById('shoppingcart').submit();" class="nav-link">
          	<i class="icon-shopping-cart"></i>
          		<span class="nav-shop__circle"></span>
          	</a></FORM></li>
        </ul>
      </div>
    </div>
  </nav>

