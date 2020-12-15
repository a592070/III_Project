<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="/WEB-INF/admin/fragment/vue_ref.jsp"/>
<script type="module" src="${pageContext.servletContext.contextPath}/assets/a592070/notify/js/notify.js"></script>
<header class="main-header " id="header">
    <nav class="navbar navbar-static-top navbar-expand-lg">
        <!-- Sidebar toggle button -->
        <button id="sidebar-toggler" class="sidebar-toggle">
            <span class="sr-only">Toggle navigation</span>
        </button>
        <!-- search form -->
        <div class="search-form d-none d-lg-inline-block">
        </div>

        <div class="navbar-right ">
            <ul class="nav navbar-nav">
                <li class="dropdown notifications-menu">

                    <%-- 廣播通知 --%>
                    <button class="dropdown-toggle">
                        <a href="${pageContext.servletContext.contextPath}/admin/broadcastMessage">
                        <i class="mdi mdi-cast" ></i>
                        </a>
                    </button>

                </li>
                <!-- User Account -->
                <li class="dropdown user-menu">
                    <button href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
<!--                         <img src="" class="user-image" alt="User Image"/> -->
                        <span class="d-none d-lg-inline-block">${adminBean.userName}</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <!-- User image -->
                        <li class="dropdown-header">
<!--                             <img src="" class="img-circle" alt="User Image"/> -->
                            <div class="d-inline-block">
                                ${adminBean.userName}
<!--                                 <small class="pt-1">xxx@xxx.com</small> -->
                            </div>
                        </li>

                        <li>
                            <a href="<%=application.getContextPath()%>/admin/displayAccountPage?username=${adminBean.userName}">
                                <i class="mdi mdi-account"></i> 個人頁面
                            </a>
                        </li>
<!--                         <li> -->
<!--                             <a href="#"> -->
<!--                                 <i class="mdi mdi-email"></i> Message -->
<!--                             </a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#"> <i class="mdi mdi-settings"></i> Account Setting </a> -->
<!--                         </li> -->

                        <li class="dropdown-footer">
                            <a href="<%=application.getContextPath()%>/admin/logout"> <i class="mdi mdi-logout"></i> 登出 </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <div id="notify">
        <index></index>
    </div>
</header>

