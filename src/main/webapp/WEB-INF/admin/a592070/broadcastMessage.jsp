<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020/12/14
  Time: 下午 05:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FUN x TAIWAN</title>

    <c:import url="/WEB-INF/admin/fragment/vuetity_css.jsp" />
    <c:import url="/WEB-INF/admin/fragment/ref.jsp"/>


    <script type="module" src="${pageContext.servletContext.contextPath}/assets/a592070/back/message/js/message.js"></script>
</head>
<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
<div class="mobile-sticky-body-overlay"></div>

<div class="wrapper">
    <%--import sidebar--%>
    <c:import url="/WEB-INF/admin/fragment/sidebar.jsp"/>
    <div class="page-wrapper">
        <%--import header--%>
        <c:import url="/WEB-INF/admin/fragment/header.jsp"/>

        <%--CONTENT--%>
        <div class="content-wrapper" id="app">
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <message></message>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
