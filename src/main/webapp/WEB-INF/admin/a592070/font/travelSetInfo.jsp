<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/12/16
  Time: 上午 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">

    <c:import url="/WEB-INF/admin/fragment/azaz4498_ref/preview_ref.jsp" />
    <c:import url="/WEB-INF/admin/fragment/vuetity_css.jsp" />
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <script type="module" src="${pageContext.servletContext.contextPath}/assets/a592070/front/travelSet/js/travelSetInfo.js"></script>

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

</body>
</html>
