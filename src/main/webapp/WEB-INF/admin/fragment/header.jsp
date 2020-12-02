<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<!--                     <button class="dropdown-toggle" data-toggle="dropdown"> -->
<!--                         <i class="mdi mdi-bell-outline"></i> -->
<!--                     </button> -->
<!--                     <ul class="dropdown-menu dropdown-menu-right"> -->
<!--                         <li class="dropdown-header"></li> -->
<!--                     </ul> -->
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
</header>

