<template>
  <div class="card-body pt-0 pb-5">
    <div class="row justify-content-between">
      <span>當前搜尋: {{currentSearch}}</span>
      <div class="input-group">
        <el-button icon="el-icon-search" v-on:click="handleSearch">搜尋</el-button>
        <input type="text" name="query" class="form-control"
               autofocus="off"
               v-model="search"
               placeholder="keywords..."/>
      </div>
    </div>

    <el-table
        v-loading="selectItemLoading"
        element-loading-text="唉呦威..."
        element-loading-spinner="el-icon-loading"
        element-loading-background="rgba(0, 0, 0, 0.8)"
        :data="tableData"
        style="width: 100%">
      <el-table-column
          label="ID"
          prop="sn"
          width="75">
      </el-table-column>
      <el-table-column
          label="名稱"
          prop="name"
          width="200">
      </el-table-column>
      <el-table-column
          label="地址"
          prop="address">
      </el-table-column>
      <el-table-column
          label="啟用狀態"
          width="100"
          prop="status">
        <template slot-scope="scope">
          <label class="switch switch-text switch-success switch-pill form-control-label">
            <input type="checkbox" class="switch-input form-check-input" v-bind:checked="scope.row.status" disabled>
            <span class="switch-label" data-on="啟用" data-off="禁用"></span>
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
              type="primary" icon="el-icon-edit" class="btn btn-warning"
              @click="handleEdit(scope.$index, scope.row)">增加
          </el-button>
        </template>
      </el-table-column>
    </el-table>

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
</template>

<script>
module.exports = {
  data() {
    return {
      currentSearch: '',
      search: '',
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
    }
  },
  created: function () {
    this.initData();
  },
  computed: Vuex.mapState(['selectItemDialog', 'selectItemLoading', 'selectItemData', 'currentEditTravelSetDetail']),
  methods: {
    initData(){
      axios.get(context+'/admin/travelSet/'+this.selectItemData.type+'/1')
          .then(response => {
            this.tableData = response.data.tableData;
            this.pageData = response.data.pageData;
            this.$store.commit('toggleSelectItemLoading', false);
          });
    },
    handleSearch(){
      console.log(this.search);
      this.pageData.currentPage = 1;
      this.handleSelectedData();
    },
    handleSelectPage(value) {
      this.pageData.currentPage = value;
      this.handleSelectedData();
    },
    handleSelectedData(){
      this.$store.commit('toggleSelectItemLoading', true);
      console.log(this.search);
      let url;

      let keyword = this.search;
      url = context+'/admin/travelSet/'+this.selectItemData.type+'/'+this.pageData.currentPage+'/'+keyword;

      axios.get(url)
          .then(response => {
            this.tableData = response.data.tableData;
            this.pageData = response.data.pageData;
            this.currentSearch = this.search;
            // this.search = "";
            this.$store.commit('toggleSelectItemLoading', false);
          });
    },
    handleEdit(index, row){
      console.log(index, row);

      this.$store.commit('setTravelSetDetailSelectItem', row);
      this.$store.commit('initSelectItemData');
      this.$store.commit('toggleSelectItemDialog', false);
    }
  }
}
</script>