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
    <link rel="stylesheet" href="//unpkg.com/view-design/dist/styles/iview.css">
    <script src="//unpkg.com/view-design/dist/iview.min.js"></script>
    <script src="//unpkg.com/view-design/dist/locale/en-US.js"></script>
    <script>
        iview.lang('en-US');
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
                                    <dropdown style="margin-left: 20px">
<%--                                        <i-button type="primary">--%>
<%--                                            選擇地區--%>
<%--                                            <i-con type="ios-arrow-down"></i-con>--%>
<%--                                        </i-button>--%>
<%--                                        <dropdown-menu slot="list" v-bind:region="region">--%>
<%--                                            <dropdown-item disabled>--請選擇--</dropdown-item>--%>
<%--                                            <dropdown-item v-for="ele in region" :key="ele">{{ele}}</dropdown-item>--%>
<%--                                        </dropdown-menu>--%>
                                        <el-select v-model="selectedRegion" placeholder="選擇地區" @change="getSelectedRegionData">
                                            <el-option label="--請選擇--" disabled></el-option>
                                            <el-option v-for="ele in region" :key="ele" :value="ele"></el-option>
                                        </el-select>
                                    </dropdown>


                                    <%--搜尋框--%>
                                    <div class="search-form d-none d-lg-inline-block col-4">
                                        <div class="input-group">
                                            <i-button shape="circle" icon="ios-search">資料庫搜尋</i-button>
                                            <input type="text" name="query" id="search-input" class="form-control"
                                                   autofocus autocomplete="off"
                                                   v-model="search"
                                                   placeholder="本頁搜尋..."/>
                                        </div>
                                    </div>
                                </div>


                                <%--表格內容--%>
                                <i-table height="550"
                                         :columns="tableColumns"
                                         :data="tableData.filter(ele => (
                                            !search ||
                                            ele.sn.toString().toLowerCase().includes(search.toLowerCase()) ||
                                            ele.name.toString().toLowerCase().includes(search.toLowerCase()) ||
                                            ele.address.toString().toLowerCase().includes(search.toLowerCase())
                                            ))"></i-table>
                            </div>


                            <%--分頁--%>
                            <div style="margin: 10px;overflow: hidden">
                                <div style="float: right;">
                                    <page :total="pageData.totalSize" :current.sync="pageData.currentPage"
                                          :page-size="pageData.pageSize" show-elevator show-total></page>
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
        data() {
            return {
                search: null,
                currentRegion: null,
                region: ["全部", "臺北市", "新北市", "桃園市", "臺中市", "高雄市"],
                pageData: {
                    currentPage: 1,
                    pageSize: 15,
                    totalSize: 1000
                },
                tableData: [
                    {
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
            }
        },
        create() {
            this.initData();
            this.getRegionData();
        },
        methods: {
            initData(){
                <%--let url = '${pageContext.servletContext.contextPath}/admin/list/'+page;--%>
                axios.get('${pageContext.servletContext.contextPath}/admin/list/')
                    .then(response => {
                        this.tableData = response.data.tableData;
                        this.pageData = response.data.pageData;
                    });
            },
            getRegionData(){
                axios.get('${pageContext.servletContext.contextPath}/admin/list.Region')
                    .then(response => {
                        this.region = response.data;
                    });
            },
            handleSelectRegion(){
                let url = '${pageContext.servletContext.contextPath}/admin/attraction/list/region/'+this.pageData.currentPage+'/'+this.currentRegion;
                axios.get(url)
                    .then(response => {
                        this.tableData = response.data.tableData;
                        this.pageData = response.data.pageData;
                    });
            },
            handleSelectPage(value){
                this.pageData.currentPage = value;
            },
            handleSelectKeywords(){
                let url = '${pageContext.servletContext.contextPath}/admin/attraction/list/region/'+this.pageData.currentPage+'/'+this.currentRegion;
                axios.get(url)
                    .then(response => {
                        this.tableData = response.data;
                    });
            }
        }

    });
</script>


</body>
</html>
