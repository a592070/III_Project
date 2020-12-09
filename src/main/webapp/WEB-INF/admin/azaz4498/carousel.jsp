<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="ftco-section bg-light">
  <div class="container">
    <div class="row">
      <div class="col-md-12 h-25">
        <div class="destination-slider owl-carousel ftco-animate" style=" height: 100px;">
          <div class="item ">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/1" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/bg_2.jpg)">
                <div class= "icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">旅遊</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/2" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/room-5.jpg)">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">住宿</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/3" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/AsianFood.jpg);">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">美食</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/4" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/destination-5.jpg);">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">景點</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/5" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/image_8.jpg);">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">交通</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/6" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/destination-6.jpg);">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">行程</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/7" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/shopping_cart.jpg);">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">購物</span>
                </div>
              </a>
              
            </div>
          </div>
          <div class="item">
            <div class="destination">
              <a href="<%=application.getContextPath()%>/typeSearch/0" class="img d-flex justify-content-center align-items-center" style=" height: 100px; background-image: url(direngine-master/images/restaurant-4.jpg);">
                <div class="icon d-flex justify-content-center align-items-center">
                  <span class="icon-search2">其他</span>
                </div>
              </a>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>