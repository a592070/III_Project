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


    <%--    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.21/dist/vue.min.js"></script>--%>
    <script src="//vuejs.org/js/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<%--    <script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>
    <script src="//unpkg.com/element-ui"></script>
    <script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>

    <script>
        ELEMENT.locale(ELEMENT.lang.en)
    </script>
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
        <div class="content-wrapper" id="app">
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <!-- Recent Order Table -->
                        <div class="card card-table-border-none" id="recent-orders">


                            <div class="card-header justify-content-between">
                                <h2>Attraction Table</h2>
                            </div>


                            <div class="card-body pt-0 pb-5">
                                <div class="row justify-content-between">
                                    <%--地區選擇--%>
                                        <el-header style="text-align: left; font-size: 12px">
                                            <el-dropdown justify="start" >
                                                <el-button type="primary">
                                                    選擇地區<i class="el-icon-arrow-down el-icon--right"></i>
                                                </el-button>
                                                <el-dropdown-menu slot="dropdown" >
                                                    <el-dropdown-item disabled>--請選擇--</el-dropdown-item>
                                                    <el-dropdown-item v-for="ele in region" v-bind:key="ele" @click.native="handleSelectRegion(ele)">{{ele}}</el-dropdown-item>
                                                </el-dropdown-menu>
                                            </el-dropdown>
                                        </el-header>


                                    <%--搜尋框--%>
                                    <div class="search-form d-none d-lg-inline-block col-4">
                                        <div class="input-group">
                                            <el-button icon="el-icon-search" v-on:click="handleSearch()">資料庫搜尋</el-button>
                                            <input type="text" name="query" id="search-input" class="form-control"
                                                   autofocus autocomplete="off"
                                                   v-model="search"
                                                   placeholder="本頁搜尋..."/>
                                        </div>
                                    </div>
                                </div>


                                <%--表格內容--%>
                                <el-table
                                        :data="tableData.filter(ele => (
                                        !search ||
                                        ele.name.toString().toLowerCase().includes(search.toLowerCase()) ||
                                        ele.sn.toString().toLowerCase().includes(search.toLowerCase()) ||
                                        ele.address.toString().toLowerCase().includes(search.toLowerCase())
                                        ))"
                                        style="width: 100%">
                                    <el-table-column
                                            label="ID"
                                            prop="sn">
                                    </el-table-column>
                                    <el-table-column
                                            label="Name"
                                            prop="name">
                                    </el-table-column>
                                    <el-table-column
                                            label="Address"
                                            prop="address">
                                    </el-table-column>
                                    <el-table-column
                                            label="TicketInfo"
                                            prop="ticketInfo">
                                    </el-table-column>
                                    <el-table-column
                                            align="right">
                                        <template slot-scope="scope">
                                            <el-button
                                                    size="mini"
                                                    type="primary" round
                                                    @click="handleEdit(scope.$index, scope.row)">Edit
                                            </el-button>
                                            <el-button
                                                    size="mini"
                                                    type="danger" icon="el-icon-delete"
                                                    @click="handleDelete(scope.$index, scope.row)"></el-button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </div>


                            <%--分頁--%>
                            <div style="margin: 10px;overflow: hidden">
                                <div style="float: right;">
                                    <el-pagination
                                            background
                                            :current-page.sync="pageData.currentPage"
                                            :page-size="pageData.pageSize"
                                            :total="pageData.totalSize"
                                            layout="total, prev, pager, next, jumper"
                                            @size-change="handleSizeChange"
                                            @current-change="handleCurrentChange">
                                    </el-pagination>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>


<script type="text/javascript">
    var vm = new Vue({
        el: '#app',
        data: {
            search: '',
            selectRegion: 'null',
            region: ["全部", "臺北市", "新北市", "桃園市", "臺中市", "高雄市"],
            pageData: {
                currentPage: 2,
                pageSize: 15,
                totalSize: 1000
            },
            tableData: [{
                sn: 1,
                name: "石岡水壩",
                address: "臺中市422石岡區豐勢路1238號",
                ticketInfo: "暫時不提供資訊"
            },
                {
                    sn: 2,
                    name: "葫蘆墩文化中心",
                    address: "臺中市420豐原區圓環東路782 號",
                    ticketInfo: "暫時不提供資訊"
                },
                {
                    sn: 3,
                    name: "萬春宮",
                    address: "臺中市400中區成功路212號",
                    ticketInfo: "暫時不提供資訊"
                },
                {
                    sn: 4,
                    name: "萬春宮",
                    address: "臺中市400中區成功路212號",
                    ticketInfo: "暫時不提供資訊"
                },
                {
                    sn: 5,
                    name: "萬春宮",
                    address: "臺中市400中區成功路212號",
                    ticketInfo: "暫時不提供資訊"
                },
                {
                    sn: 6,
                    name: "萬春宮",
                    address: "臺中市400中區成功路212號",
                    ticketInfo: "暫時不提供資訊"
                },
                {
                    sn: 7,
                    name: "萬春宮",
                    address: "臺中市400中區成功路212號",
                    ticketInfo: "暫時不提供資訊"
                },
                {
                    sn: 8,
                    name: "萬春宮",
                    address: "臺中市400中區成功路212號",
                    ticketInfo: "暫時不提供資訊"
                }],
            tableColumns: [
                {
                    title: 'ID',
                    key: 'sn'
                },
                {
                    title: 'Name',
                    key: 'name',
                },
                {
                    title: 'Address',
                    key: 'address'
                },
                {
                    title: 'TicketInfo',
                    key: 'ticketInfo'
                },
                {
                    title: 'Action',
                    key: 'action',
                    align: 'center',
                    render: (h, params) => {
                        return h('div', [
                            h('Button', {
                                props: {
                                    type: 'primary',
                                    size: 'small'
                                },
                                style: {
                                    marginRight: '10px'
                                },
                                on: {
                                    click: () => {
                                        this.show(params.index)
                                    }
                                }
                            }, 'View'),
                            h('Button', {
                                props: {
                                    type: 'error',
                                    size: 'small'
                                },
                                on: {
                                    click: () => {
                                        this.remove(params.index)
                                    }
                                }
                            }, 'Delete')
                        ]);
                    }
                }
            ]
        },
        methods: {
            handleSizeChange(val) {
                console.log(`每頁 \${val} 條`);
            },
            handleCurrentChange(val) {
                console.log(`當前頁: \${val}`);
            },
            handleEdit(index, row) {
                console.log(index, row);
            },
            handleDelete(index, row) {
                console.log(index, row);
            },
            handleSearch(){
                console.log(vm.search);
            },
            handleSelectRegion(region){
                console.log(region);
            }
        }

    });
</script>


</body>
</html>
