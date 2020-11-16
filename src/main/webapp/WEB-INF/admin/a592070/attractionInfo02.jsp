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
<%--                                            <el-dropdown justify="start" >--%>
<%--                                                <el-button type="primary">--%>
<%--                                                    選擇地區<i class="el-icon-arrow-down el-icon--right"></i>--%>
<%--                                                </el-button>--%>
<%--                                                <el-dropdown-menu slot="dropdown" >--%>
<%--                                                    <el-dropdown-item disabled>--請選擇--</el-dropdown-item>--%>
<%--                                                    <el-dropdown-item v-for="ele in region" v-bind:key="ele" @click.native="handleSelectedRegion(ele)">{{ele}}</el-dropdown-item>--%>
<%--                                                </el-dropdown-menu>--%>
<%--                                            </el-dropdown>--%>
                                            <el-select v-model="currentRegion" placeholder="選擇地區" @change="handleSelectedRegion(currentRegion)">
                                                <el-option label="--請選擇--" disabled></el-option>
                                                <el-option v-for="ele in region" v-bind:key="ele" :value="ele" ></el-option>
                                            </el-select>
                                        </el-header>


                                    <%--搜尋框--%>
                                    <div class="search-form d-none d-lg-inline-block col-4">
                                        <span>當前搜尋: {{search}}</span>
                                        <div class="input-group">
                                            <el-button icon="el-icon-search" v-on:click="handleSearch">資料庫搜尋</el-button>
                                            <input type="text" name="query" id="search-input" class="form-control"
                                                   autofocus ="off"
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
                                        style="width: 100%"
                                        @sort-change='sortChange'>
                                    <el-table-column
                                            label="ID"
                                            prop="sn"
                                            sortable='custom'>
                                    </el-table-column>
                                    <el-table-column
                                            label="Name"
                                            prop="name"
                                            sortable='custom'>
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
                                            @current-change="handleSelectPage">
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
            currentRegion: null,
            region: [],
            pageData: {
                currentPage: null,
                pageSize: null,
                totalSize: null
            },
            tableData: [
                {
                    sn: '',
                    name: '',
                    address: '',
                    ticketInfo: ''
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
        created: function() {
            this.initData();
            this.getRegionData();
        },
        methods: {
            initData(){
                axios.get('${pageContext.servletContext.contextPath}/admin/attraction/list/1')
                    .then(response => {
                        this.tableData = response.data.tableData;
                        this.pageData = response.data.pageData;
                    });
            },
            getRegionData(){
                axios.get('${pageContext.servletContext.contextPath}/admin/list.Region')
                    .then(response => {
                        response.data
                        this.region = response.data;
                        this.region.unshift("全部");
                    });
            },
            handleEdit(index, row) {
                console.log(index, row);
                window.location.href = "${pageContext.servletContext.contextPath}/admin/attraction/detail/"+row.sn;
            },
            handleDelete(index, row) {
                console.log(index, row);
                if(confirm("是否刪除?")){
                    let url = '${pageContext.servletContext.contextPath}/admin/attraction/delete/'+row.sn;
                    axios.post(url)
                        .then(response => {
                            if(response.data == true){
                                alert("刪除成功")
                                window.location.reload();
                            }else{
                                alert("刪除失敗")
                            }
                        });
                }

            },
            handleSearch(){
                console.log(this.search);
                this.pageData.currentPage = 1;

                this.handleSelectedData();
            },
            handleSelectedRegion(region){
                console.log(region);
                this.currentRegion = region;
                this.pageData.currentPage = 1;

                this.handleSelectedData();
            },
            handleSelectedData(){
                console.log(this.search);
                let url;

                let region = this.currentRegion
                if(region == "全部"){
                    region = "";
                }
                let keyword = this.search;
                if(this.search == ''){
                    keyword = null;
                }

                if(region && keyword){
                    url = '${pageContext.servletContext.contextPath}/admin/attraction/list/'+this.pageData.currentPage+'/'+region+'/'+keyword;
                }else if(region){
                    url = '${pageContext.servletContext.contextPath}/admin/attraction/list/'+this.pageData.currentPage+'/'+region;
                }else if(keyword){

                }



                axios.get(url,{region:this.currentRegion, keywords:keyword, })
                    .then(response => {
                        this.tableData = response.data.tableData;
                        this.pageData = response.data.pageData;
                    });
            },
            handleSelectPage(value) {
                this.pageData.currentPage = value;
                this.handleSelectedData();
            },
            sortChange: function(column, prop, order) {
                console.log(column + '-' + column.prop + '-' + column.order)

            }
        }
    });
</script>


</body>
</html>
