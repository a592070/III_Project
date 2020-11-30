<template>
  <div class="card card-table-border-none" id="recent-orders">

    <div class="card-header justify-content-between">
      <h2>Travel Set Table</h2>
      <el-button type="primary" icon="el-icon-circle-plus-outline" @click="handleInsert">新增資料</el-button>
    </div>

    <div class="card-body pt-0 pb-5">
      <div class="row justify-content-between">
        <!--系統推薦選擇-->
        <el-header style="text-align: left; font-size: 12px">
          <el-select v-model="currentUser" placeholder="選擇使用者" @change="handleSelectedUser(currentUser)">
            <el-option label="--請選擇--" disabled></el-option>
            <el-option v-for="ele in user" v-bind:key="ele" :value="ele" ></el-option>
          </el-select>
        </el-header>


        <!--搜尋框-->
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


      <!--表格內容-->
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
              <input type="checkbox" class="switch-input form-check-input" v-bind:checked="scope.row.status" v-on:click="handleSwitchStatus(scope.row)">
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

      <!--分頁-->
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
</template>
<script>
module.exports = {
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
      ]
    }
  },
  created: function () {
    // this.initData();
    this.testData();
    this.loading = false;
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
}
</script>