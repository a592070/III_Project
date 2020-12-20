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
                                <h2>景 點 列 表</h2>
                                <el-button type="primary" icon="el-icon-circle-plus-outline" @click="handleInsert">新增資料</el-button>
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
                                        <span>當前搜尋: {{currentSearch}}</span>
                                        <div class="input-group">
                                            <el-button icon="el-icon-search" v-on:click="handleSearch">資料庫搜尋</el-button>
                                            <input type="text" name="query" id="search-input" class="form-control"
                                                   autofocus ="off"
                                                   v-model="search"
                                                   placeholder="keywords..."/>
                                        </div>
                                    </div>
                                </div>



                            <%--表格內容--%>
                                <el-table
                                        v-loading="loading"
                                        element-loading-text="唉呦威..."
                                        element-loading-spinner="el-icon-loading"
                                        element-loading-background="rgba(0, 0, 0, 0.8)"
                                        :data="tableData"
<%--                                        :data="tableData.filter(ele => (--%>
<%--                                        !search ||--%>
<%--                                        ele.name.toString().toLowerCase().includes(search.toLowerCase()) ||--%>
<%--                                        ele.sn.toString().toLowerCase().includes(search.toLowerCase()) ||--%>
<%--                                        ele.address.toString().toLowerCase().includes(search.toLowerCase())--%>
<%--                                        ))"--%>
                                        style="width: 100%"
                                        @sort-change='sortChange'
                                        >
                                    <el-table-column
                                            label="ID"
                                            prop="sn"
                                            width="75"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                    </el-table-column>
                                    <el-table-column
                                            label="名稱"
                                            prop="name"
                                            width="200"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                    </el-table-column>
                                    <el-table-column
                                            label="地址"
                                            prop="address"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                    </el-table-column>
                                    <el-table-column
                                            label="啟用狀態"
                                            width="150"
                                            prop="status"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                        <template slot-scope="scope">
                                        <label class="switch switch-text switch-success switch-pill form-control-label">
                                            <input type="checkbox" class="switch-input form-check-input" v-bind:checked="scope.row.status" v-on:click="handleSwitchStatus(scope.row)">
                                            <span class="switch-label" data-on="啟用" data-off="禁用"></span>
                                            <span class="switch-handle"></span>
                                        </label>
                                        </template>
                                    </el-table-column>
                                    <el-table-column
                                            width="250"
                                            align="right">
                                        <template slot-scope="scope">
                                            <el-button
                                                    size="medium"
                                                    type="warning" icon="el-icon-edit" class="btn btn-warning"
                                                    @click="handleEdit(scope.$index, scope.row)">修改
                                            </el-button>
                                            <el-button
                                                    size="medium"
                                                    type="danger" icon="el-icon-delete" class="btn btn-danger"
                                                    @click="handleDelete(scope.$index, scope.row)">刪除</el-button>
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
            loading: true,
            search: '',
            sortParams: {},
            currentSearch: '',
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
                    status: false
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
                    title: 'Status',
                    key: 'status'
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
                        this.loading = false;
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
            handleInsert(){
                window.location.href = "${pageContext.servletContext.contextPath}/admin/attraction/detail";
            },
            handleEdit(index, row) {
                console.log(index, row);
                window.location.href = "${pageContext.servletContext.contextPath}/admin/attraction/detail/"+row.sn;
            },
            handleDelete(index, row) {
                console.log(index, row);
                this.$confirm('此操作將永久刪除資料, 是否繼續?', '提示', {
                    confirmButtonText: '去死吧',
                    cancelButtonText: '手滑了...',
                    type: 'warning',
                    center: true
                }).then(() => {
                    let url = '${pageContext.servletContext.contextPath}/admin/attraction/delete/'+row.sn;
                    axios.delete(url)
                        .then(response => {
                            if(response.data == true){
                                this.$message({
                                    type: 'success',
                                    message: '刪除成功!'
                                });
                                this.handleSelectedData();
                                // window.location.reload();
                            }else{
                                this.$message({
                                    type: 'info',
                                    message: '刪除失敗!!'
                                });
                            }
                        });

                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消刪除'
                    });
                });
                <%--if(confirm("是否刪除?")){--%>
                <%--    let url = '${pageContext.servletContext.contextPath}/admin/attraction/delete/'+row.sn;--%>
                <%--    axios.post(url)--%>
                <%--        .then(response => {--%>
                <%--            if(response.data == true){--%>
                <%--                alert("刪除成功")--%>
                <%--                window.location.reload();--%>
                <%--            }else{--%>
                <%--                alert("刪除失敗")--%>
                <%--            }--%>
                <%--        });--%>
                <%--}--%>

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
                this.loading = true;
                console.log(this.search);
                let url;

                let region = this.currentRegion
                if(!region || region == "全部"){
                    region = "all";
                }
                let keyword = this.search;
                if(!this.search || this.search== ''){
                    url = '${pageContext.servletContext.contextPath}/admin/attraction/list/'+this.pageData.currentPage+'/'+region;
                }else{
                    url = '${pageContext.servletContext.contextPath}/admin/attraction/list/'+this.pageData.currentPage+'/'+region+'/'+keyword;
                }

                let params = this.sortParams;
                axios.get(url, {params})
                    .then(response => {
                        this.tableData = response.data.tableData;
                        this.pageData = response.data.pageData;
                        this.currentSearch = this.search;
                        // this.search = "";
                        this.loading = false;
                    });
            },
            handleSelectPage(value) {
                this.pageData.currentPage = value;
                this.handleSelectedData();
            },
            sortChange: function(column, prop, order) {
                console.log(column + '-' + column.prop + '-' + column.order);
                this.sortParams = {"sortColumn":column.prop, "order":column.order};
                this.handleSelectedData();
            },
            handleSwitchStatus(value){
                console.log(value.status);
                value.status = !value.status;

                let url = '${pageContext.servletContext.contextPath}/admin/attraction/status/'+value.sn;
                axios.put(url)
                    .then(response => {
                        if(response.data){
                            const h = this.$createElement;
                            this.$message({
                                message: h('p', null, [
                                    h('i', { style: 'color: teal' }, value.name),
                                    h('span', null, '狀態更改成功 ')
                                ])
                            });
                        }else{
                            this.$message.error(value.name+': 狀態更改失敗');
                        }
                        // this.search = "";
                    });
            },
            testRemove1(index, row){
                console.log(index, row);
            }

        }
    });
</script>


</body>
</html>
