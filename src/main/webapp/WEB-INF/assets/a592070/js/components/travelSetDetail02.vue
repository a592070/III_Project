<template>
  <div>
      <el-tabs type="border-card">
        <el-tab-pane label="基本設定">
          <el-form :model="travelSetDetail.info" ref="travelSetDetailInfo">
          <el-form-item label="編號" :label-width="formLabelWidth"
                        prop="sn">
            <el-input v-model="travelSetDetail.info.sn" disabled></el-input>
          </el-form-item>
          <el-form-item label="創建者" :label-width="formLabelWidth"
                        prop="createdUser">
            <el-input v-model="travelSetDetail.info.createdUser"
                      disabled></el-input>
          </el-form-item>
          <el-form-item label="名稱" :label-width="formLabelWidth"
                        prop="name">
            <el-input v-model="travelSetDetail.info.name"></el-input>
          </el-form-item>
          <el-form-item label="詳細" :label-width="formLabelWidth"
                        prop="description">
            <el-input type="textarea"
                      v-model="travelSetDetail.info.description"></el-input>
          </el-form-item>
          <el-form-item label="優先級" :label-width="formLabelWidth"
                        prop="priority">
            <el-slider v-model="travelSetDetail.info.priority" :step="10"
                       style="width: 300px"></el-slider>
          </el-form-item>
          <el-form-item label="啟用" :label-width="formLabelWidth">
            <label class="switch switch-text switch-success switch-pill form-control-label">
              <input type="checkbox" class="switch-input form-check-input"
                     v-bind:checked="travelSetDetail.info.status"
                     v-on:click="handleSwitchStatus(travelSetDetail)">
              <span class="switch-label" data-on="On"
                    data-off="Off"></span>
              <span class="switch-handle"></span>
            </label>
          </el-form-item>
            <el-form-item>
              <el-button v-on:click="resetTravelSetForm('travelSetDetailInfo')">重 置
              </el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>


        <el-tab-pane label="景點規劃">
          <el-form :model="travelSetDetail.travelEleAttractions" ref="travelSetDetailAttractions">
            <template v-for="(item, index) in travelSetDetail.travelEleAttractions">
              <el-row>
                <el-col :span="4">
              <el-form-item label="編號:" :prop="'.'+index+'sn'" :label-width="formLabelWidth">
                <el-input v-model="item.sn" disabled></el-input>
              </el-form-item>
                </el-col>
                <el-col :span="4">
              <el-form-item label="ID:" :prop="'.'+index+'.id'" :label-width="formLabelWidth">
                <el-input v-model="item.id" @focus="selectTravelSetItemID(item)"></el-input>
              </el-form-item>
                </el-col>
                <el-col :span="4">
              <el-form-item label="名稱:" :prop="'.'+index+'.name'" :label-width="formLabelWidth">
                <el-input v-model="item.name" disabled></el-input>
              </el-form-item>
                </el-col>
                <el-col :span="2" ></el-col>
                <el-col :span="8">
              <el-form-item label="預定時間:" :prop="'.'+index+'.time'" :label-width="formLabelWidth">
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
            </template>
            <el-form-item :label-width="formLabelWidth">
              <el-button
                  @click="addTravelSetFormItem(travelSetDetail.travelEleAttractions)">
                新 增
              </el-button>
              <el-button v-on:click="resetTravelSetForm('travelSetDetailAttractions')">重 置
              </el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>


        <el-tab-pane label="餐廳規劃">
          <el-form :model="travelSetDetail.travelEleRestaurants" ref="travelSetDetailRestaurants" inline>
            <div v-for="item in travelSetDetail.travelEleRestaurants">
              <el-form-item label="編號" :label-width="formLabelWidth" prop="item.sn">
                <el-input v-model="item.sn" disabled ></el-input>
              </el-form-item>
              <el-form-item label="ID" :label-width="formLabelWidth"
                            prop="item.id">
                <el-input v-model="item.id"
                          @focus="selectTravelSetItemID(item)"></el-input>
              </el-form-item>
              <el-form-item label="名稱" :label-width="formLabelWidth"
                            prop="item.name">
                <el-input v-model="item.name" disabled></el-input>
              </el-form-item>
              <el-form-item label="預定時間" :label-width="formLabelWidth"
                            prop="item.time">
                <el-date-picker
                    v-model="item.time"
                    type="datetime"
                    align="center">
                </el-date-picker>
              </el-form-item>
            </div>
            <el-form-item>
              <el-button
                  @click="addTravelSetFormItem(travelSetDetail.travelEleRestaurants)">
                新 增
              </el-button>
              <el-button v-on:click="resetTravelSetForm('travelEleRestaurants')">重 置
              </el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>


        <el-tab-pane label="旅館規劃">
          <el-form :model="travelSetDetail.travelEleHotels" ref="travelSetDetailHotels">
            <template v-for="(item, index) in travelSetDetail.travelEleHotels">
              <el-row>
                <el-col :span="4">
                  <el-form-item label="編號:" :prop="'.'+index+'sn'" :label-width="formLabelWidth">
                    <el-input v-model="item.sn" disabled></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="4">
                  <el-form-item label="ID:" :prop="'.'+index+'.id'" :label-width="formLabelWidth">
                    <el-input v-model="item.id" @focus="selectTravelSetItemID(item)"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="4">
                  <el-form-item label="名稱:" :prop="'.'+index+'.name'" :label-width="formLabelWidth">
                    <el-input v-model="item.name" disabled></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="2" ></el-col>
                <el-col :span="8">
                  <el-form-item label="預定時間:" :prop="'.'+index+'.time'" :label-width="formLabelWidth">
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
            </template>
            <el-form-item :label-width="formLabelWidth">
              <el-button
                  @click="addTravelSetFormItem(travelSetDetail.travelEleHotels)">
                新 增
              </el-button>
              <el-button v-on:click="resetTravelSetForm('travelSetDetailHotels')">重 置
              </el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>


        <el-tab-pane label="租車規劃">
          <el-form :model="travelSetDetail.travelEleCars" ref="travelSetDetailCars">
            <template v-for="(item, index) in travelSetDetail.travelEleCars">
              <el-row>
                <el-col :span="4">
                  <el-form-item label="編號:" :prop="'.'+index+'sn'" :label-width="formLabelWidth">
                    <el-input v-model="item.sn" disabled></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="4">
                  <el-form-item label="ID:" :prop="'.'+index+'.id'" :label-width="formLabelWidth">
                    <el-input v-model="item.id" @focus="selectTravelSetItemID(item)"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="4">
                  <el-form-item label="名稱:" :prop="'.'+index+'.name'" :label-width="formLabelWidth">
                    <el-input v-model="item.name" disabled></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="2" ></el-col>
                <el-col :span="8">
                  <el-form-item label="預定時間:" :prop="'.'+index+'.time'" :label-width="formLabelWidth">
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
            </template>
            <el-form-item :label-width="formLabelWidth">
              <el-button
                  @click="addTravelSetFormItem(travelSetDetail.travelEleCars)">
                新 增
              </el-button>
              <el-button v-on:click="resetTravelSetForm('travelSetDetailCars')">重 置
              </el-button>
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>

    <el-dialog
        title="選 擇 目 標 ID"
        :append-to-body="true"
        :visible.sync="getTravelSetSelectDialog"
        :destroy-on-close="true">
      <travel-set-select-item></travel-set-select-item>
    </el-dialog>
  </div>
</template>

<script>
module.exports = {
  name: 'TravelSetDetail',
  components: {
    "travel-set-select-item": httpVueLoader(context + '/assets/a592070/js/components/travelSetSelectItem.vue')
  },
  data() {
    return {
      formLabelWidth: '80px',
      timer: null,
      isSelectTravelSetItem: false,
      selectTravelSetItemLoading: false,
      selectTravelSetItemData: {},
      currentSelectTravelSetItem: {},
      travelSetDetail: {
        info: {
          sn: 0,
          createdUser: '',
          name: '',
          description: '',
          createdTime: '',
          updateTime: '',
          priority: 0,
          status: false,
        },
        travelEleAttractions: [
          {
            sn: 0,
            id: 0,
            name: '',
            time: ''
          }
        ],
        travelEleRestaurants: [
          {
            sn: 0,
            id: 0,
            name: '',
            time: ''
          }
        ],
        travelEleHotels: [
          {
            sn: 0,
            id: 0,
            name: '',
            time: ''
          }
        ],
        travelEleCars: [
          {
            sn: 0,
            id: 0,
            name: '',
            time: ''
          }
        ]
      }
    }
  },
  mounted: function () {
    this.testData();
  },
  computed: {
    selectTravelSetItemNoMore() {
      return this.selectTravelSetItemData.length >= 21
    },
    selectTravelSetItemDisabled() {
      return this.selectTravelSetItemLoading || this.selectTravelSetItemNoMore
    }
    ,
    getTravelSetSelectDialog(){
      return this.$store.getters.getTravelSetSelectDialog;
    }
  },
  methods: {
    resetTravelSetForm(formName){
      console.log(this.$refs[formName]);
      this.$refs[formName].resetFields();
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
    removeTravelSetFormItem(items, item) {
      console.log(item);
      let index = items.indexOf(item)
      if (index !== -1) {
        items.splice(index, 1)
      }
      console.log(items);
    },
    selectTravelSetItemID(item) {
      console.log(item);
    },
    testData(){
      let data = {
        info: {
          sn: 1,
          createdUser: 'system',
          name: '桃園一日遊',
          description: '桃園一日遊，好好玩!!!..!!!!!!!!!!!!!.!!!!!!!!!!!!',
          createdTime: '2020-10-12 10:31:33.000000',
          updateTime: '2020-10-12 10:42:14.892000',
          priority: 50,
          status: true,
        },
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
        ]
        ,
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
      this.$store.commit("setTravelSetDetail", data);
      this.travelSetDetail = this.getTravelSetDetail();
    },
    getTravelSetDetail(){
      return this.$store.getters.getTravelSetDetail;
    }
  }
}
</script>