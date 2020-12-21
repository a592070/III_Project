<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/11/30
  Time: 下午 08:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FUN x TAIWAN</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css" />
    <c:import url="/WEB-INF/admin/fragment/ref.jsp"/>
    <script src="https://unpkg.com/vue"></script>
    <script src="https://unpkg.com/vuex"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue-axios@3.2.0/dist/vue-axios.es5.js"></script>
    <script src="https://unpkg.com/http-vue-loader"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>
    <script>
        ELEMENT.locale(ELEMENT.lang.en);
    </script>

    <style>
        .infinite-list-wrapper .list-item+.list-item {
            margin-top: 10px;
        }
        .infinite-list-wrapper .list-item {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50px;
            background: #fff6f6;
            color: #ff8484;
        }
        .infinite-list-wrapper {
            height: 500px;
            text-align: center;
        }
    </style>

    <script type="text/javascript">
        const context = "${pageContext.servletContext.contextPath}";
    </script>
    <script type="module" src="${pageContext.servletContext.contextPath}/assets/a592070/js/travelSetInfo.js"></script>

</head>
<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">

<div class="wrapper">
    <%--import sidebar--%>
    <c:import url="/WEB-INF/admin/fragment/sidebar.jsp"/>
    <div class="page-wrapper">
        <%--import header--%>
        <c:import url="/WEB-INF/admin/fragment/header.jsp"/>

        <%--CONTENT--%>
        <div class="content-wrapper" id="app">
        <index></index>
        </div>
    </div>
</div>

</body>
</html>
