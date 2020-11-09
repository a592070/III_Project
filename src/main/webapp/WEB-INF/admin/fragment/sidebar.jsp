<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<aside class="left-sidebar bg-sidebar">
        <div id="sidebar" class="sidebar sidebar-with-footer">
            <!-- Aplication Brand -->
            <div class="app-brand">
                <a href="/index.html">
                    <svg
                            class="brand-icon"
                            xmlns="http://www.w3.org/2000/svg"
                            preserveAspectRatio="xMidYMid"
                            width="30"
                            height="33"
                            viewBox="0 0 30 33"
                    >
                        <g fill="none" fill-rule="evenodd">
                            <path
                                    class="logo-fill-blue"
                                    fill="#7DBCFF"
                                    d="M0 4v25l8 4V0zM22 4v25l8 4V0z"
                            />
                            <path class="logo-fill-white" fill="#FFF" d="M11 4v25l8 4V0z"/>
                        </g>
                    </svg>
                    <span class="brand-name">HOME</span>
                </a>
            </div>
            <!-- begin sidebar scrollbar -->
            <div class="sidebar-scrollbar">

                <!-- sidebar menu -->
                <ul class="nav sidebar-inner" id="sidebar-menu">
                    <li class="has-sub active expand">
                        <a class="sidenav-item-link" href="${pageContext.servletContext.contextPath}/accountPage">
                            <i class="mdi mdi-view-dashboard-outline"></i>
                            <span class="nav-text">用戶列表</span>
                        </a>
                    </li>


                    <li class="has-sub">
                        <a class="sidenav-item-link" href="javascript:void(0)">
                            <i class="mdi mdi-atlassian"></i>
                            <span class="nav-text">景點</span>
                        </a>
                    </li>


                    <li class="has-sub">
                        <a class="sidenav-item-link" href="${pageContext.servletContext.contextPath}/Restaurant">
                            <i class="mdi mdi-silverware-variant"></i>
                            <span class="nav-text">餐廳</span>
                        </a>
                    </li>


                    <li class="has-sub">
                        <a class="sidenav-item-link" href="${pageContext.servletContext.contextPath}/hotelindex">
                            <i class="mdi mdi-hotel"></i>
                            <span class="nav-text">旅館</span>
                        </a>
                    </li>


                    <li class="has-sub">
                        <a class="sidenav-item-link" href="Tindex.controller">
                            <i class="mdi mdi-car"></i>
                            <span class="nav-text">租車</span>
                        </a>
                    </li>


                    <li class="has-sub">
                        <a class="sidenav-item-link" href="javascript:void(0)">
                            <i class="mdi mdi-reddit"></i>
                            <span class="nav-text">論壇管理</span>
                        </a>
                    </li>


                    <li class="has-sub">
                        <a class="sidenav-item-link" role="button" href="javascript:void(0)" data-toggle="collapse"
                           data-target="#order"
                           aria-expanded="false"
                            aria-controls="order">
                            <i class="mdi mdi-book-open-page-variant"></i>
                            <span class="nav-text">訂單管理</span> <b class="caret"></b>
                        </a>
                        <ul class="collapse" id="order"
                            data-parent="#sidebar-menu">
                            <div class="sub-menu">


                                <li class="active">
                                    <a class="sidenav-item-link" href="index.html">
                                        <span class="nav-text">餐廳訂單</span>
                                    </a>
                                </li>


                                <li>
                                    <a class="sidenav-item-link" href="analytics.html">
                                        <span class="nav-text">旅館訂單</span>
                                    </a>
                                </li>

                                <li>
                                    <a class="sidenav-item-link" href="analytics.html">
                                        <span class="nav-text">交通訂單</span>
                                    </a>
                                </li>

                            </div>
                        </ul>

                    </li>


                </ul>

            </div>

            <hr class="separator"/>

        </div>
    </aside>






