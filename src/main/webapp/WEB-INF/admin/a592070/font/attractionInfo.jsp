<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找景點</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">


    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />


<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vant@2.10/lib/index.css" />--%>
<%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>

<%--    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@5.x/css/materialdesignicons.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">--%>

<%--    <script src="https://unpkg.com/vue"></script>--%>
<%--    <script src="https://unpkg.com/vuex"></script>--%>
<%--    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>
<%--    <script src="https://unpkg.com/vue-axios@3.2.0/dist/vue-axios.es5.js"></script>--%>
<%--    <script src="https://unpkg.com/http-vue-loader"></script>--%>

<%--    <script src="${pageContext.servletContext.contextPath}/assets/a592070/web_modules/sass.js"></script>--%>
<%--    <script type="text/javascript">--%>
<%--        const sass = new Sass()--%>
<%--        httpVueLoader.langProcessor.scss = function (scssText) {--%>
<%--            return new Promise(function (resolve, reject) {--%>
<%--                // 不然這邊這個 sass 會報錯...--%>
<%--                sass.compile(scssText, function (result) {--%>
<%--                    if (result.status === 0)--%>
<%--                        resolve(result.text)--%>
<%--                    else--%>
<%--                        reject(result)--%>
<%--                });--%>
<%--            });--%>
<%--        }--%>
<%--    </script>--%>

<%--&lt;%&ndash;    <script src="https://cdn.jsdelivr.net/npm/vant@2.10/lib/vant.min.js"></script>&ndash;%&gt;--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>--%>
<%--    <script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>
<%--    <script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>--%>
<%--    <script src="//polyfill.io/v3/polyfill.min.js?features=es2015%2CIntersectionObserver" crossorigin="anonymous"></script>--%>

<%--    <script>--%>
<%--        ELEMENT.locale(ELEMENT.lang.en);--%>
<%--    </script>--%>
<%--    <c:import url="/WEB-INF/admin/fragment/vue_ref.jsp"/>--%>
    <c:import url="/WEB-INF/admin/fragment/vuetity_css.jsp" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <script type="module" src="${pageContext.servletContext.contextPath}/assets/a592070/front/attraction/js/attractionInfo.js"></script>



</head>
<body>
<c:import url="/WEB-INF/admin/fragment/nav.jsp" />

<div class="container-fluid" style="padding: 0; width: 100%;height: 100%;">
    <div class="hero-wrap " style="width: 100%;height: 100%; z-index: -1; background-size: cover; background-repeat: no-repeat; background-image: url('${pageContext.servletContext.contextPath}/assets/a592070/六十石山-鹿蔥亭的金針花海.jpg'); ">
        <div class="overlay"></div>
        <div class="container" style="padding: 0; width: 100%;height: 100%;">
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true" style="padding: 0; width: 100%;height: 100%;">
                <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }" style="padding: 0; width: 100%;height: 50%;">
                    <h1 class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>F U N</strong> x <strong>台 灣</strong></h1>
                    <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>找 尋 台 灣 之 美</strong></h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="app">

    <index></index>
</div>


<c:import url="/WEB-INF/admin/fragment/footer.jsp"/>

<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<c:import url="/WEB-INF/admin/fragment/azaz4498_ref/bottom_js.jsp" />

<script>
    $(document).ready(function(){
        let timer = setInterval(() => {
            $('body,html').animate({scrollTop: 900}, 900);
            clearInterval(timer);
        }, 1000);
    });
</script>
</body>
</html>
