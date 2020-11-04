<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/10/29
  Time: 上午 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <c:import url="/WEB-INF/admin/fragment/ref.jsp"/>



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
        <div class="content-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <!-- Recent Order Table -->
                        <div class="card card-table-border-none" id="recent-orders">


                            <div class="card-header justify-content-between">
                                <h2>Attraction Table</h2>
                                <div class="date-range-report ">
                                    <span></span>
                                </div>
                            </div>


                            <div class="card-body pt-0 pb-5">
                                <div class="row justify-content-between">
                                <%--地區選擇--%>
                                <div class="btn-group col-4" role="group" aria-label="Button group with nested dropdown">
                                    <button type="button" class="btn btn-primary">全部</button>
                                    <button type="button" class="btn btn-primary">臺北市</button>
                                    <button type="button" class="btn btn-primary">新北市</button>
                                    <button type="button" class="btn btn-primary">桃園市</button>
                                    <button type="button" class="btn btn-primary">臺中市</button>
                                    <button type="button" class="btn btn-primary">高雄市</button>

                                    <div class="btn-group" role="group">
                                        <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle"
                                                data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false">
                                            看更多
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                            <button class="dropdown-item" disabled>--請選擇--</button>
                                        </div>
                                    </div>
                                </div>

                                <%--搜尋框--%>
                                <div class="search-form d-none d-lg-inline-block col-4">
                                    <div class="input-group">
                                        <button type="button" name="search" id="search-btn" class="btn btn-flat">
                                            <i class="mdi mdi-magnify"></i>
                                        </button>
                                        <input type="text" name="query" id="search-input" class="form-control"
                                               placeholder="keywords..."
                                               autofocus autocomplete="off"/>
                                    </div>
                                </div>
                                </div>


                                <%--TABLE--%>
                                <table class="table card-table table-responsive table-responsive-large"
                                       style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th class="d-none d-md-table-cell">Address</th>
                                        <th>has picture</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>24541</td>
                                        <td>
                                            <a class="text-dark" href=""> Coach Swagger</a>
                                        </td>
                                        <td class="d-none d-md-table-cell">桃園市中壢區中大路300號</td>
                                        <td>
                                            <span class="badge badge-success">true</span>
                                        </td>
                                        <td class="text-right">
                                            <div class="dropdown show d-inline-block widget-dropdown">
                                                <a class="dropdown-toggle icon-burger-mini" href="" role="button"
                                                   id="dropdown-recent-order1" data-toggle="dropdown"
                                                   aria-haspopup="true" aria-expanded="false" data-display="static"></a>
                                                <ul class="dropdown-menu dropdown-menu-right"
                                                    aria-labelledby="dropdown-recent-order1">
                                                    <li class="dropdown-item">
                                                        <a href="#">Modify</a>
                                                    </li>
                                                    <li class="dropdown-item">
                                                        <a href="#">Remove</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <%--分業選擇--%>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-flat pagination-flat-rounded">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true" class="mdi mdi-chevron-left"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active">
                                        <a class="page-link" href="#">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true" class="mdi mdi-chevron-right"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>


</body>
</html>
