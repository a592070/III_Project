<template>
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
              v-infinite-scroll="loadSelectTravelSetItem"
              infinite-scroll-disabled="DisabledSelectTravelSetItem">
            <li v-for="i in selectTravelSetItemData"
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
          <p v-if="selectTravelSetItemLoading">L o a d i n g...</p>
          <p v-else-if="noMoreSelectTravelSetItem">没有更多了</p>
        </div>
</template>

<script>
module.exports = {
  data() {
    return {
      selectTravelSetItemLoading: false,
      selectTravelSetItemData: {},
      currentSelectTravelSetItem: {}
    }
  },
  created: function () {

  },
  computed: {
    noMoreSelectTravelSetItem() {
      return this.selectTravelSetItemData.length >= 21
    },
    DisabledSelectTravelSetItem() {
      return this.selectTravelSetItemLoading || this.selectTravelSetItemNoMore
    }
  },
  methods: {
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
    loadSelectTravelSetItem() {
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
    }
  }
}
</script>