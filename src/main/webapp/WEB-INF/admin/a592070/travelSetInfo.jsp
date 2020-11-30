<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/11/29
  Time: 上午 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <c:import url="/WEB-INF/admin/fragment/ref.jsp"/>
    <script src="//vuejs.org/js/vue.min.js"></script>
    <script src="https://unpkg.com/http-vue-loader"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

    <%--    <script src="//unpkg.com/element-ui"></script>--%>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>
    <script>
        ELEMENT.locale(ELEMENT.lang.en);
    </script>

    <style>
        .infinite-list-wrapper .list-item + .list-item {
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
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-table-border-none" id="recent-orders">

                            <div class="card-header justify-content-between">
                                <h2>Travel Set Table</h2>
                                <el-button type="primary" icon="el-icon-circle-plus-outline" @click="handleInsert">
                                    新增資料
                                </el-button>
                            </div>


                            <div class="card-body pt-0 pb-5">
                                <div class="row justify-content-between">
                                    <%--系統推薦選擇--%>
                                    <el-header style="text-align: left; font-size: 12px">
                                        <el-select v-model="currentUser" placeholder="選擇使用者"
                                                   @change="handleSelectedUser(currentUser)">
                                            <el-option label="--請選擇--" disabled></el-option>
                                            <el-option v-for="ele in user" v-bind:key="ele" :value="ele"></el-option>
                                        </el-select>
                                    </el-header>


                                    <%--搜尋框--%>
                                    <div class="search-form d-none d-lg-inline-block col-4">
                                        <span>當前搜尋: {{currentSearch}}</span>
                                        <div class="input-group">
                                            <el-button icon="el-icon-search" v-on:click="handleSearch">資料庫搜尋</el-button>
                                            <input type="text" name="query" id="search-input" class="form-control"
                                                   autofocus="off"
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
                                            label="創建者"
                                            prop="createdUser"
                                            width="100"
                                            show-overflow-tooltip="true"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                    </el-table-column>
                                    <el-table-column
                                            label="名稱"
                                            prop="name"
                                            width="100"
                                            show-overflow-tooltip="true"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                    </el-table-column>
                                    <el-table-column
                                            label="描述"
                                            prop="description"
                                            width="150"
                                            show-overflow-tooltip="true">
                                    </el-table-column>
                                    <el-table-column
                                            label="創建時間"
                                            prop="createdTime"
                                            width="250"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                        <template slot-scope="scope">
                                            <el-date-picker
                                                    v-model="scope.row.createdTime"
                                                    type="datetime"
                                                    readonly
                                                    align="center">
                                            </el-date-picker>
                                        </template>
                                    </el-table-column>
                                    <el-table-column
                                            label="修改時間"
                                            prop="updateTime"
                                            width="250"
                                            sortable='custom'
                                            :sort-orders="['descending', 'ascending']">
                                        <template slot-scope="scope">
                                            <el-date-picker
                                                    v-model="scope.row.updateTime"
                                                    type="datetime"
                                                    readonly
                                                    align="center">
                                            </el-date-picker>
                                        </template>
                                    </el-table-column>
                                    <el-table-column
                                            label="推薦優先級"
                                            width="125"
                                            prop="priority"
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
                                                <input type="checkbox" class="switch-input form-check-input"
                                                       v-bind:checked="scope.row.status"
                                                       v-on:click="handleSwitchStatus(scope.row)">
                                                <span class="switch-label" data-on="On" data-off="Off"></span>
                                                <span class="switch-handle"></span>
                                            </label>
                                        </template>
                                    </el-table-column>
                                    <el-table-column
                                            width="200"
                                            align="right">
                                        <template slot-scope="scope">
                                            <el-button
                                                    size="medium"
                                                    type="primary" icon="el-icon-edit"
                                                    @click="handleEdit(scope.$index, scope.row)">Edit
                                            </el-button>
                                            <el-button
                                                    size="medium"
                                                    type="danger" icon="el-icon-delete"
                                                    @click="handleDelete(scope.$index, scope.row)"></el-button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </div>
                            <div>
                                <el-drawer
                                        title="Travel Set Detail"
                                        :before-close="handleCloseTravelSet"
                                        :visible.sync="travelSetDialog"
                                        custom-class="demo-drawer"
                                        ref="drawer"
                                        size="70%"
                                        :show-close="false">
                                    <div>
                                        <el-form :model="travelSetDetail" ref="travelSetDetail">
                                            <el-tabs type="border-card">
                                                <el-tab-pane label="基本設定">
                                                    <el-form-item label="編號" :label-width="formLabelWidth"
                                                                  prop="travelSetDetail.sn">
                                                        <el-input v-model="travelSetDetail.sn" disabled></el-input>
                                                    </el-form-item>
                                                    <el-form-item label="創建者" :label-width="formLabelWidth"
                                                                  prop="travelSetDetail.createdUser">
                                                        <el-input v-model="travelSetDetail.createdUser"
                                                                  disabled></el-input>
                                                    </el-form-item>
                                                    <el-form-item label="名稱" :label-width="formLabelWidth"
                                                                  prop="travelSetDetail.name">
                                                        <el-input v-model="travelSetDetail.name"></el-input>
                                                    </el-form-item>
                                                    <el-form-item label="詳細" :label-width="formLabelWidth"
                                                                  prop="travelSetDetail.description">
                                                        <el-input type="textarea"
                                                                  v-model="travelSetDetail.description"></el-input>
                                                    </el-form-item>
                                                    <el-form-item label="優先級" :label-width="formLabelWidth"
                                                                  prop="travelSetDetail.priority">
                                                        <el-slider v-model="travelSetDetail.priority" :step="10"
                                                                   style="width: 300px"></el-slider>
                                                    </el-form-item>
                                                    <el-form-item label="啟用" :label-width="formLabelWidth">
                                                        <label class="switch switch-text switch-success switch-pill form-control-label">
                                                            <input type="checkbox" class="switch-input form-check-input"
                                                                   v-bind:checked="travelSetDetail.status"
                                                                   v-on:click="handleSwitchStatus(travelSetDetail)">
                                                            <span class="switch-label" data-on="On"
                                                                  data-off="Off"></span>
                                                            <span class="switch-handle"></span>
                                                        </label>
                                                    </el-form-item>
                                                </el-tab-pane>
                                                <el-tab-pane label="景點規劃">
                                                    <el-row v-for="item in travelSetDetail.travelEleAttractions">
                                                        <el-col :span="4">
                                                            <el-form-item label="編號" :label-width="formLabelWidth"
                                                                          prop="item.sn">
                                                                <el-input v-model="item.sn" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="景點ID" :label-width="formLabelWidth"
                                                                          prop="item.id">
                                                                <el-input v-model="item.id"
                                                                          @focus="selectItemID(item)"></el-input>
                                                                <%--                                                                <el-button type="text" @click="selectItemID"></el-button>--%>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="名稱" :label-width="formLabelWidth"
                                                                          prop="item.name">
                                                                <el-input v-model="item.name" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2"></el-col>
                                                        <el-col :span="8">
                                                            <el-form-item label="預定時間" :label-width="formLabelWidth"
                                                                          prop="item.time">
                                                                <el-date-picker
                                                                        v-model="item.time"
                                                                        type="datetime"
                                                                        align="center">
                                                                </el-date-picker>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2">
                                                            <el-button
                                                                    @click.prevent="removeTravelSetFormItem(travelSetDetail.travelEleAttractions, item)">
                                                                删 除
                                                            </el-button>
                                                        </el-col>
                                                    </el-row>
                                                    <el-button
                                                            @click="addTravelSetFormItem(travelSetDetail.travelEleAttractions)">
                                                        新 增
                                                    </el-button>
                                                </el-tab-pane>
                                                <el-tab-pane label="餐廳規劃">
                                                    <el-row v-for="item in travelSetDetail.travelEleRestaurants">
                                                        <el-col :span="4">
                                                            <el-form-item label="編號" :label-width="formLabelWidth"
                                                                          prop="item.sn">
                                                                <el-input v-model="item.sn" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="餐廳ID" :label-width="formLabelWidth"
                                                                          prop="item.id">
                                                                <el-input v-model="item.id"
                                                                          autocomplete="off"></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="名稱" :label-width="formLabelWidth"
                                                                          prop="item.name">
                                                                <el-input v-model="item.name" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2"></el-col>
                                                        <el-col :span="8">
                                                            <el-form-item label="預定時間" :label-width="formLabelWidth"
                                                                          prop="item.time">
                                                                <el-date-picker
                                                                        v-model="item.time"
                                                                        type="datetime"
                                                                        align="center">
                                                                </el-date-picker>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2">
                                                            <el-button
                                                                    @click.prevent="removeTravelSetFormItem(travelSetDetail.travelEleRestaurants, item)">
                                                                删 除
                                                            </el-button>
                                                        </el-col>
                                                    </el-row>
                                                    <el-button
                                                            @click="addTravelSetFormItem(travelSetDetail.travelEleRestaurants)">
                                                        新 增
                                                    </el-button>
                                                </el-tab-pane>
                                                <el-tab-pane label="旅館規劃">
                                                    <el-row v-for="item in travelSetDetail.travelEleHotels">
                                                        <el-col :span="4">
                                                            <el-form-item label="編號" :label-width="formLabelWidth"
                                                                          prop="item.sn">
                                                                <el-input v-model="item.sn" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="旅館ID" :label-width="formLabelWidth"
                                                                          prop="item.id">
                                                                <el-input v-model="item.id"
                                                                          autocomplete="off"></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="名稱" :label-width="formLabelWidth"
                                                                          prop="item.name">
                                                                <el-input v-model="item.name" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2"></el-col>
                                                        <el-col :span="8">
                                                            <el-form-item label="預定時間" :label-width="formLabelWidth"
                                                                          prop="item.time">
                                                                <el-date-picker
                                                                        v-model="item.time"
                                                                        type="datetime"
                                                                        align="center">
                                                                </el-date-picker>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2">
                                                            <el-button
                                                                    @click.prevent="removeTravelSetItem(travelSetDetail.travelEleHotels, item)">
                                                                删 除
                                                            </el-button>
                                                        </el-col>
                                                    </el-row>
                                                    <el-button
                                                            @click="addTravelSetItem(travelSetDetail.travelEleHotels)">新
                                                        增
                                                    </el-button>
                                                </el-tab-pane>
                                                <el-tab-pane label="租車規劃">
                                                    <el-row v-for="item in travelSetDetail.travelEleCars">
                                                        <el-col :span="4">
                                                            <el-form-item label="ID" :label-width="formLabelWidth"
                                                                          prop="item.sn">
                                                                <el-input v-model="item.sn" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="旅館ID" :label-width="formLabelWidth"
                                                                          prop="item.id">
                                                                <el-input v-model="item.id"
                                                                          autocomplete="off"></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="4">
                                                            <el-form-item label="名稱" :label-width="formLabelWidth"
                                                                          prop="item.name">
                                                                <el-input v-model="item.name" disabled></el-input>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2"></el-col>
                                                        <el-col :span="8">
                                                            <el-form-item label="預定時間" :label-width="formLabelWidth"
                                                                          prop="item.time">
                                                                <el-date-picker
                                                                        v-model="item.time"
                                                                        type="datetime"
                                                                        align="center">
                                                                </el-date-picker>
                                                            </el-form-item>
                                                        </el-col>
                                                        <el-col :span="2">
                                                            <el-button
                                                                    @click.prevent="removeTravelSetFormItem(travelSetDetail.travelEleCars, item)">
                                                                删 除
                                                            </el-button>
                                                        </el-col>
                                                    </el-row>
                                                    <el-button
                                                            @click="addTravelSetFormItem(travelSetDetail.travelEleCars)">
                                                        新 增
                                                    </el-button>
                                                </el-tab-pane>
                                            </el-tabs>
                                        </el-form>
                                        <div>
                                            <el-button @click="cancelTravelSetForm">取 消 關 閉</el-button>
                                            <el-button type="primary" @click="$refs.drawer.closeTravelSetDrawer()"
                                                       :loading="travelSetFormLoading">{{ loading ? '提交中 ...' : '保 存' }}
                                            </el-button>
                                            <el-button v-on:click="resetTravelSetForm('travelSetDetail')">重 置
                                            </el-button>
                                        </div>
                                    </div>
                                </el-drawer>
                            </div>
                            <div>
                                <el-dialog
                                        title="選 擇 目 標 ID"
                                        :append-to-body="true"
                                        :visible.sync="isSelectTravelSetItem"
                                        :destroy-on-close="true">

                                    <%--                                    <el-table :data="selectItemData">--%>
                                    <%--                                        <el-table-column property="sn" label="ID" width="150"></el-table-column>--%>
                                    <%--                                        <el-table-column property="name" label="Name" width="200"></el-table-column>--%>
                                    <%--                                        <el-table-column property="address" label="Address" ></el-table-column>--%>
                                    <%--                                        <el-table-column--%>
                                    <%--                                                fixed="right"--%>
                                    <%--                                                label="Action"--%>
                                    <%--                                                width="120">--%>
                                    <%--                                            <template slot-scope="scope">--%>
                                    <%--                                                <el-button--%>
                                    <%--                                                        @click.native.prevent="addItemToTravelset(scope.$index, selectItemData)"--%>
                                    <%--                                                        type="text"--%>
                                    <%--                                                        size="small">--%>
                                    <%--                                                    添加--%>
                                    <%--                                                </el-button>--%>
                                    <%--                                            </template>--%>
                                    <%--                                        </el-table-column>--%>
                                    <%--                                    </el-table>--%>

                                    <div class="infinite-list-wrapper" style="overflow:auto">
                                        <div class="search-form d-none d-lg-inline-block col-4">
                                            <span>當前搜尋: {{}}</span>
                                            <div class="input-group">
                                                <el-button icon="el-icon-search" v-on:click="">搜尋</el-button>
                                                <input type="text" name="query" class="form-control"
                                                       autofocus="off"
                                                       placeholder="keywords..."/>
                                            </div>
                                        </div>
                                        <ul
                                                class="list"
                                                class="list-group"
                                                v-infinite-scroll="selectTravelSetItemLoad"
                                                infinite-scroll-disabled="selectTravelSetItemDisabled">
                                            <li v-for="i in selectTravelSetItemData"
                                            <%--                                                class="list-item">--%>
                                                class="list-group-item list-group-item-action list-group-item-light">
                                                <el-row>
                                                    <el-col :span="4">{{i.sn}}
                                                    </el-col>
                                                    <el-col :span="8">{{i.name}}
                                                    </el-col>
                                                    <el-col :span="8">{{i.address}}
                                                    </el-col>
                                                    <el-col :span="4">
                                                        <el-button
                                                                @click.native.prevent="addItemToTravelSet(i)"
                                                                type="text"
                                                                size="small">
                                                            添加
                                                        </el-button>
                                                    </el-col>
                                                </el-row>
                                            </li>
                                        </ul>
                                        <p v-if="selectTravelSetItemLoading">加载中...</p>
                                        <p v-if="selectTravelSetItemNoMore">没有更多了</p>
                                    </div>
                                </el-dialog>
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
                            <Mycomponent></Mycomponent>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    const Mycomponent = httpVueLoader('${pageContext.servletContext.contextPath}/assets/vueComponent/myComponent.vue')
    const vm = new Vue({
        el: '#app',
        data() {
            return {
                loading: true,
                search: '',
                sortParams: {},
                currentSearch: '',
                currentUser: null,
                user: ["全部", "系統", "一般使用者"],
                pageData: {
                    currentPage: null,
                    pageSize: null,
                    totalSize: null
                },
                tableData: [
                    {
                        sn: '',
                        createdUser: '',
                        name: '',
                        description: '',
                        createdTime: '',
                        updateTime: '',
                        priority: '',
                        status: ''
                    }],
                tableColumns: [
                    {
                        title: 'ID',
                        key: 'sn'
                    },
                    {
                        title: 'CreatedUser',
                        key: 'createdUser',
                    },
                    {
                        title: 'Name',
                        key: 'name'
                    },
                    {
                        title: 'CreatedTime',
                        key: 'createdTime'
                    },
                    {
                        title: 'UpdateTime',
                        key: 'updateTime'
                    },
                    {
                        title: 'Priority',
                        key: 'priority'
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
                ],

                travelSetDialog: false,
                travelSetFormLoading: false,
                formLabelWidth: '80px',
                timer: null,
                isSelectTravelSetItem: false,
                selectTravelSetItemLoading: false,
                selectTravelSetItemData: {},
                currentSelectTravelSetItem: {},
                travelSetDetail: {
                    sn: '',
                    createdUser: '',
                    name: '',
                    description: '',
                    createdTime: '',
                    updateTime: '',
                    priority: '',
                    status: '',
                    travelEleAttractions: [
                        {
                            sn: '',
                            id: '',
                            name: '',
                            time: ''
                        }
                    ],
                    travelEleRestaurants: [
                        {
                            sn: '',
                            id: '',
                            name: '',
                            time: ''
                        }
                    ],
                    travelEleHotels: [
                        {
                            sn: '',
                            id: '',
                            name: '',
                            time: ''
                        }
                    ],
                    travelEleCars: [
                        {
                            sn: '',
                            id: '',
                            name: '',
                            time: ''
                        }
                    ]
                }
            };
        },
        created: function () {
            // this.initData();
            this.testData();
            this.loading = false;
        },
        components: {
            Mycomponent
        },
        computed: {
            selectTravelSetItemNoMore() {
                return this.selectTravelSetItemData.length >= 21
            },
            selectTravelSetItemDisabled() {
                return this.selectTravelSetItemLoading || this.selectTravelSetItemNoMore
            }
        },
        methods: {
            initData() {
            },
            handleInsert() {
                this.travelSetDialog = true;
            },
            handleEdit(index, row) {
                console.log(index, row);
                this.travelSetDialog = true;
            },
            handleDelete(index, row) {
                console.log(index, row);
                this.$confirm('此操作將永久刪除資料, 是否繼續?', '提示', {
                    confirmButtonText: '去死吧',
                    cancelButtonText: '手滑了...',
                    type: 'warning',
                    center: true
                }).then(() => {
                    this.$message({
                        type: 'success',
                        message: '刪除成功!'
                    });

                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消刪除'
                    });
                });
            },
            handleSearch() {
                console.log(this.search);
                this.pageData.currentPage = 1;

                this.handleSelectedData();
            },
            handleSelectedUser(user) {
                console.log(user);
                this.currentUser = user;
                this.pageData.currentPage = 1;

                this.handleSelectedData();
            },
            handleSelectedData() {
                this.loading = true;
                let url;

                let user = this.currentUser
                if (!user || user == "全部") {
                    user = "all";
                }
                let keyword = this.search;
                if (!this.search || this.search == '') {
                } else {
                }

                let params = this.sortParams;
                console.log(params);
                this.loading = false;
            },
            handleSelectPage(value) {
                this.pageData.currentPage = value;
                this.handleSelectedData();
            },
            sortChange: function (column, prop, order) {
                console.log(column + '-' + column.prop + '-' + column.order);
                this.sortParams = {"sortColumn": column.prop, "order": column.order};
                this.handleSelectedData();
            },
            handleSwitchStatus(value) {
                console.log(value.status);
                value.status = !value.status;
                this.$message({
                    type: 'success',
                    message: '狀態更改成功!'
                });
            },
            testRemove1(index, row) {
                console.log(index, row);
            },
            handleCloseTravelSet(done) {
                if (this.travelSetFormLoading) {
                    return;
                }
                this.$confirm('確定要提交表單?')
                    .then(_ => {
                        this.travelSetFormLoading = true;
                        this.timer = setTimeout(() => {
                            done();
                            // 动画关闭需要一定的时间
                            setTimeout(() => {
                                this.travelSetFormLoading = false;
                            }, 400);
                        }, 2000);
                    })
                    .catch(_ => {
                    });
            },
            cancelTravelSetForm() {
                this.travelSetFormLoading = false;
                this.travelSetDialog = false;
                clearTimeout(this.timer);
            },
            removeTravelSetFormItem(items, item) {
                console.log(item);
                let index = items.indexOf(item)
                if (index !== -1) {
                    items.splice(index, 1)
                }
                console.log(items);
            },
            addTravelSetFormItem(items) {
                items.push({
                    id: 987,
                    name: 'new',
                    time: Date.now()
                });
                console.log(items);
                this.selectTravelSetItemID(items[items.length - 1]);
            },
            handleCloseTravelSetItem() {
                this.isSelectTravelSetItem = false;
            },
            selectTravelSetItemID(item) {
                this.isSelectTravelSetItem = true;
                this.currentSelectTravelSetItem = item;
                this.selectTravelSetItemData = [
                    {
                        sn: 1987,
                        name: '景點99號',
                        address: '臺中市421后里區三豐路五段333號'
                    },
                    {
                        sn: 19898,
                        name: '景點999號',
                        address: '臺中市426新社區協成村協中街263號'
                    },
                    {
                        sn: 19899,
                        name: '景點999號',
                        address: '臺中市426新社區協成村協中街263號'
                    },
                    {
                        sn: 19900,
                        name: '景點999號',
                        address: '臺中市426新社區協成村協中街263號'
                    },
                    {
                        sn: 19901,
                        name: '景點999號',
                        address: '臺中市426新社區協成村協中街263號'
                    },
                    {
                        sn: 19902,
                        name: '景點999號',
                        address: '臺中市426新社區協成村協中街263號'
                    }
                ];
            },
            selectTravelSetItemLoad() {
                this.selectTravelSetItemLoading = true

                setTimeout(() => {
                    let addItem = [
                        {
                            sn: 200001,
                            name: '景點999號',
                            address: '臺中市426新社區協成村協中街263號'
                        },
                        {
                            sn: 200002,
                            name: '景點999號',
                            address: '臺中市426新社區協成村協中街263號'
                        },
                        {
                            sn: 200003,
                            name: '景點999號',
                            address: '臺中市426新社區協成村協中街263號'
                        }
                    ];
                    for (let i = 0; i < addItem.length; i++) {
                        this.selectTravelSetItemData.push(addItem[i]);
                    }
                    this.selectTravelSetItemLoading = false
                }, 500)
            },
            addItemToTravelSet(index, rows) {
                console.log(rows[index]);
                let selected = rows[index];
                this.currentSelectTravelSetItem.id = selected.sn;
                this.currentSelectTravelSetItem.name = selected.name;
                this.handleCloseTravelSetItem();
            },
            addItemToTravelSet(i) {
                console.log(i);
                let selected = i;
                this.currentSelectTravelSetItem.id = selected.sn;
                this.currentSelectTravelSetItem.name = selected.name;
                this.handleCloseTravelSetItem();
            },
            testData() {
                this.tableData = [
                    {
                        sn: 1,
                        createdUser: 'system',
                        name: '桃園一日遊',
                        description: '桃園一日遊，好好玩!!!..!!!!!!!!!!!!!.!!!!!!!!!!!!',
                        createdTime: '2020-10-12 10:31:33.000000',
                        updateTime: '2020-10-12 10:42:14.892000',
                        priority: 50,
                        status: true
                    }];
                this.travelSetDetail = {
                    sn: 1,
                    createdUser: 'system',
                    name: '桃園一日遊',
                    description: '桃園一日遊，好好玩!!!..!!!!!!!!!!!!!.!!!!!!!!!!!!',
                    createdTime: '2020-10-12 10:31:33.000000',
                    updateTime: '2020-10-12 10:42:14.892000',
                    priority: 50,
                    status: true,
                    travelEleAttractions: [
                        {
                            sn: 99,
                            id: 123,
                            name: '景點1號',
                            time: '2020-11-26 19:20:51.000000'
                        },
                        {
                            sn: 199,
                            id: 1234,
                            name: '景點2號',
                            time: '2020-11-26 19:20:51.000000'
                        }
                    ],
                    travelEleRestaurants: [
                        {
                            sn: 299,
                            id: 234,
                            name: '餐廳1號',
                            time: '2020-11-26 19:20:51.000000'
                        }
                    ],
                    travelEleHotels: [
                        {
                            sn: 399,
                            id: 345,
                            name: '旅館1號',
                            time: '2020-11-26 19:20:51.000000'
                        },
                        {
                            sn: 499,
                            id: 3456,
                            name: '旅館2號',
                            time: '2020-11-26 19:20:51.000000'
                        }
                    ],
                    travelEleCars: [
                        {
                            sn: 599,
                            id: 456,
                            name: '租車1號',
                            time: '2020-11-26 19:20:51.000000'
                        }
                    ]
                };
            }
        }
    });
</script>


</body>
</html>
