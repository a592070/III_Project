<template>
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
                              @focus="selectTravelSetItemID(item)"></el-input>
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
                      @click.prevent="removeTravelSetFormItem(travelSetDetail.travelEleHotels, item)">
                    删 除
                  </el-button>
                </el-col>
              </el-row>
              <el-button
                  @click="addTravelSetFormItem(travelSetDetail.travelEleHotels)">新
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
</template>
<script>
module.exports = {
  data() {
    return {
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
    }
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
    }
  }
}
</script>