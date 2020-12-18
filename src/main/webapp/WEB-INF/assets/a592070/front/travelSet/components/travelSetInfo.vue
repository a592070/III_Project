<template>
<!--  <v-app>-->
    <v-container>
      <el-drawer
          title="title!"
          :visible.sync="travelSetInfoDialog"
          :before-close="beforeTravelSetInfoClose"
          direction="rtl"
          :with-header="false"
          wrapperClosable
          size="70%">
        <div class="card card-table-border-none" id="recent-orders">

          <div class="card-header justify-content-between">
            <h2>Travel Set Table</h2>
            <el-button type="primary" icon="el-icon-circle-plus-outline" @click="handleInsert">新增資料</el-button>
          </div>

          <div class="card-body pt-0 pb-5">
            <div class="row justify-content-between">
              <!--搜尋框-->
              <div class=" d-lg-inline-block col-4">
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
                stripe
                :data="tableData"
                style="width: 100%"
                @sort-change='sortChange'
                height
                v-loading='travelSetInfoLoading'
                element-loading-text="唉呦威..."
                element-loading-spinner="el-icon-loading"
                element-loading-background="rgba(0, 0, 0, 0.8)"
            >
              <el-table-column
                  label="ID"
                  prop="sn"
                  width="75"
                  sortable='custom'
                  fixed
                  :sort-orders="['descending', 'ascending']">
              </el-table-column>
              <el-table-column
                  label="名稱"
                  prop="name"
                  width="100"
                  show-overflow-tooltip
                  sortable='custom'
                  :sort-orders="['descending', 'ascending']">
              </el-table-column>
              <el-table-column
                  label="描述"
                  prop="description"
                  show-overflow-tooltip>
              </el-table-column>
              <el-table-column
                  label="創建時間"
                  prop="createdTime"
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
                  width="150"
                  align="right"
                  fixed="right">
                <template slot-scope="scope">
                  <el-button
                      size="small"
                      type="primary" icon="el-icon-edit"
                      @click="handleEdit(scope.$index, scope.row)">Edit
                  </el-button>
                  <el-button
                      size="small"
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
      </el-drawer>
    </v-container>
<!--  </v-app>-->
</template>

<script>
module.exports = {
  data(){
    return{
      // travelSetInfoDialog: false,
      search: '',
      sortParams: {},
      currentSearch: '',
      pageData: {
        currentPage: null,
        pageSize: null,
        totalSize: null
      },
      tableData: [
        {
          sn: '',
          name: '',
          description: '',
          createdTime: '',
          updateTime: '',
        }],
      tableColumns: [
        {
          title: 'ID',
          key: 'sn'
        },
        {
          title: 'Name',
          key: 'name'
        },
        {
          title: 'Description',
          key: 'description'
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
    }
  },
  created: function () {
    // this.initData();
  },
  computed: Vuex.mapState(['travelSetInfoLoading', 'travelSetInfo', 'travelSetInfoDialog']),
  methods: {
    beforeTravelSetInfoClose(){
      this.$store.commit("setTravelSetInfoDialog", false);
    },
    handleOpenTravelSetInfo(){
      this.travelSetInfoDialog = true;
      this.$store.commit("setTravelSetInfoDialog", true);
    },
    initData() {
      axios.get(context+'/admin/travelSet/list/1')
          .then(response => {
            this.$store.commit('setTravelSetInfo', response.data.tableData);

            this.tableData = this.travelSetInfo;
            this.pageData = response.data.pageData;
          })
          .then(()=>this.$store.commit('toggleTravelSetInfoLoading', false));

    },
    handleSearch() {
      this.pageData.currentPage = 1;

      this.handleSelectedData();
    },
    handleSelectedUser(user) {
      console.log(user);
      this.currentUser = user;
      this.pageData.currentPage = 1;

      this.handleSelectedData();
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
    handleSelectedData() {
      this.$store.commit('toggleTravelSetInfoLoading', true);
      let url;

      let user = this.currentUser
      if (!user) {
        user = 0;
      }
      let keyword = this.search;
      if (!this.search || this.search == '') {
        url = context + '/admin/travelSet/list/'+this.pageData.currentPage+'/'+user;
      } else {
        url = context + '/admin/travelSet/list/'+this.pageData.currentPage+'/'+user+'/'+keyword;
      }

      let params = this.sortParams;
      console.log(params);
      axios.get(url, {params})
          .then(response => {
            this.$store.commit('setTravelSetInfo', response.data.tableData);

            this.tableData = this.travelSetInfo;
            // this.tableData = response.data.tableData;
            this.pageData = response.data.pageData;
            this.currentSearch = this.search;
          })
          .then(()=>this.$store.commit('toggleTravelSetInfoLoading', false));

    },
    handleSwitchStatus(value) {
      this.$store.commit('toggleTravelSetInfoLoading', true)

      let url = context+'/admin/travelSet/status/'+value.sn;
      axios.put(url)
          .then(response => {
            if(response.data){
              value.status = !value.status;
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
          })
          .then(()=>this.$store.commit('toggleTravelSetInfoLoading', false));

    },




    handleInsert() {
      this.$store.commit('initTravelSteDetail');
      this.$store.commit("toggleTravelSetDialog", true);
      this.$store.commit('toggleTravelSetDetailLoading', false);
    },
    handleEdit(index, row) {
      this.$store.commit("setCurrentTravelSetInfo", row);
      this.$store.dispatch('selectedTravelSetDetailData', row.sn)
          .then(()=>{
            this.$store.commit("toggleTravelSetDialog", true);
            this.$store.commit('toggleTravelSetDetailLoading', false);
          });
    },
    handleDelete(index, row) {
      this.$confirm('此操作將永久刪除資料, 是否繼續?', '提示', {
        confirmButtonText: '去死吧',
        cancelButtonText: '手滑了...',
        type: 'warning',
        center: true
      }).then(() => {
        this.$store.commit('toggleTravelSetInfoLoading', true);

        let url = context+'/admin/travelSet/delete/'+row.sn;
        axios.delete(url)
            .then(response => {
              this.$store.commit('toggleTravelSetInfoLoading', false);

              if(response.data == true){
                this.$message({
                  type: 'success',
                  message: '刪除成功!'
                });

                // 更新清單頁面
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
    },

  }
}
</script>
<style>
* {
  font-family: 'Noto Sans TC', sans-serif;
}

</style>