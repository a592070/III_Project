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
    <title>文章預覽</title>
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
            <h2 class="mb-3">文章標題</h2>
            <p>
              我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
              我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <p>
              <img
                src="direngine-master/images/image_7.jpg"
                alt=""
                class="img-fluid"
              />
            </p>
            <p>
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <h2 class="mb-3 mt-5">#2. Creative WordPress Themes</h2>
            <p>
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <p>
              <img
                src="direngine-master/images/image_8.jpg"
                alt=""
                class="img-fluid"
              />
            </p>
            <p>
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <p>
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <p>
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <p>
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
                我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 我是內文 
            </p>
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">Life</a>
                <a href="#" class="tag-cloud-link">Sport</a>
                <a href="#" class="tag-cloud-link">Tech</a>
                <a href="#" class="tag-cloud-link">Travel</a>
              </div>
            </div>

            <div class="about-author d-flex p-5 bg-light">
              <div class="bio align-self-md-center mr-5">
                <img
                  src="direngine-master/images/person_1.jpg"
                  alt="Image placeholder"
                  class="img-fluid mb-4"
                  width="200" height="200"
                />
              </div>
              <div class="desc align-self-md-center">
                <h3 style="font-family:'Noto Sans TC', sans-serif ;">作者名稱</h3>
                <p>
                    我是作者啦:D 我是作者啦:D我是作者啦:D我是作者啦:D我是作者啦:D我是作者啦:D我是作者啦:D我是作者啦:D我是作者啦:D我是作者啦:D
                </p>
              </div>
            </div>

            <div class="pt-5 mt-5">
              <h3 class="mb-5" style="font-family:'Noto Sans TC', sans-serif ;">6則評論</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="vcard bio">
                    <img
                      src="direngine-master/images/person_1.jpg"
                      alt="Image placeholder"
                    />
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>
                      我是評論 我是評論 我是評論 
                    </p>
                    <p><a href="#" class="reply">回覆</a></p>
                  </div>
                </li>

                <li class="comment">
                  <div class="vcard bio">
                    <img
                      src="direngine-master/images/person_1.jpg"
                      alt="Image placeholder"
                    />
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>
                        我是評論 我是評論 我是評論 
                    </p>
                    <p><a href="#" class="reply">回覆</a></p>
                  </div>

                  <ul class="children">
                    <li class="comment">
                      <div class="vcard bio">
                        <img
                          src="direngine-master/images/person_1.jpg"
                          alt="Image placeholder"
                        />
                      </div>
                      <div class="comment-body">
                        <h3>John Doe</h3>
                        <div class="meta">June 27, 2018 at 2:21pm</div>
                        <p>
                            我是評論 我是評論 我是評論 
                        </p>
                        <p><a href="#" class="reply">回覆</a></p>
                      </div>

                      <ul class="children">
                        <li class="comment">
                          <div class="vcard bio">
                            <img
                              src="direngine-master/images/person_1.jpg"
                              alt="Image placeholder"
                            />
                          </div>
                          <div class="comment-body">
                            <h3>John Doe</h3>
                            <div class="meta">June 27, 2018 at 2:21pm</div>
                            <p>
                                我是評論 我是評論 我是評論 
                            </p>
                            <p><a href="#" class="reply">回覆</a></p>
                          </div>

                          <ul class="children">
                            <li class="comment">
                              <div class="vcard bio">
                                <img
                                  src="direngine-master/images/person_1.jpg"
                                  alt="Image placeholder"
                                />
                              </div>
                              <div class="comment-body">
                                <h3>John Doe</h3>
                                <div class="meta">June 27, 2018 at 2:21pm</div>
                                <p>
                                    我是評論 我是評論 我是評論 
                                </p>
                                <p><a href="#" class="reply">回覆</a></p>
                              </div>
                            </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li class="comment">
                  <div class="vcard bio">
                    <img
                      src="direngine-master/images/person_1.jpg"
                      alt="Image placeholder"
                    />
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">June 27, 2018 at 2:21pm</div>
                    <p>
                        我是評論 我是評論 我是評論 
                    </p>
                    <p><a href="#" class="reply">回覆</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->

              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5" style="font-family:'Noto Sans TC', sans-serif ;">寫個評論吧..</h3>
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                    <label for="name" style="font-family:'Noto Sans TC', sans-serif ;">使用者名稱 *</label>
                    <input type="text" class="form-control" id="name" />
                  </div>
                  

                  <div class="form-group">
                    <label for="message" style="font-family:'Noto Sans TC', sans-serif ;">評論內容</label>
                    <textarea
                      name=""
                      id="message"
                      cols="30"
                      rows="10"
                      class="form-control"
                    ></textarea>
                  </div>
                  <div class="form-group">
                    <input
                      type="submit"
                      value="Post Comment"
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
                  <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">旅遊 <span>(12)</span></a>
                </li>
                <li>
                  <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">住宿 <span>(22)</span></a>
                </li>
                <li>
                  <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">美食 <span>(37)</span></a>
                </li>
                <li>
                  <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">景點 <span>(42)</span></a>
                </li>
                <li>
                  <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">交通 <span>(14)</span></a>
                </li>
                <li>
                  <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">行程 <span>(140)</span></a>
                </li>
                <li>
                    <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">購物 <span>(140)</span></a>
                  </li>
                <li>
                    <a href="#" style="font-family:'Noto Sans TC', sans-serif ;">其他 <span>(10)</span></a>
                  </li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3 style="font-family:'Noto Sans TC', sans-serif ;">近期文章</h3>
              <div class="block-21 mb-4 d-flex">
                <a
                  class="blog-img mr-4"
                  style="
                    background-image: url(direngine-master/images/image_1.jpg);
                  "
                ></a>
                <div class="text">
                  <h3 class="heading">
                    <a href="#"
                      >Even the all-powerful Pointing has no control about the
                      blind texts</a
                    >
                  </h3>
                  <div class="meta">
                    <div>
                      <a href="#"
                        ><span class="icon-calendar"></span> July 12, 2018</a
                      >
                    </div>
                    <div>
                      <a href="#"><span class="icon-person"></span> Admin</a>
                    </div>
                    <div>
                      <a href="#"><span class="icon-chat"></span> 19</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a
                  class="blog-img mr-4"
                  style="
                    background-image: url(direngine-master/images/image_2.jpg);
                  "
                ></a>
                <div class="text">
                  <h3 class="heading">
                    <a href="#"
                      >Even the all-powerful Pointing has no control about the
                      blind texts</a
                    >
                  </h3>
                  <div class="meta">
                    <div>
                      <a href="#"
                        ><span class="icon-calendar"></span> July 12, 2018</a
                      >
                    </div>
                    <div>
                      <a href="#"><span class="icon-person"></span> Admin</a>
                    </div>
                    <div>
                      <a href="#"><span class="icon-chat"></span> 19</a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a
                  class="blog-img mr-4"
                  style="
                    background-image: url(direngine-master/images/image_3.jpg);
                  "
                ></a>
                <div class="text">
                  <h3 class="heading">
                    <a href="#"
                      >Even the all-powerful Pointing has no control about the
                      blind texts</a
                    >
                  </h3>
                  <div class="meta">
                    <div>
                      <a href="#"
                        ><span class="icon-calendar"></span> July 12, 2018</a
                      >
                    </div>
                    <div>
                      <a href="#"><span class="icon-person"></span> Admin</a>
                    </div>
                    <div>
                      <a href="#"><span class="icon-chat"></span> 19</a>
                    </div>
                  </div>
                </div>
              </div>
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
  </body>
</html>
