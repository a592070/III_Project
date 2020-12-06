<template>
  <div style="height: 600px">
    <el-tabs type="border-card" style="height:100%; overflow-y:auto;overflow-x:hidden;">
      <el-tab-pane label="基本設定" style="max-height:90%">
        <el-form :model="currentEditTravelSetDetail.travelSetInfo" ref="travelSetDetailInfo">
          <el-form-item label="編號" :label-width="formLabelWidth"
                        prop="sn">
            <el-input v-model="currentEditTravelSetDetail.travelSetInfo.sn" disabled></el-input>
          </el-form-item>
          <el-form-item label="創建者" :label-width="formLabelWidth"
                        prop="createdUser">
            <el-input v-model="currentEditTravelSetDetail.travelSetInfo.createdUser"></el-input>
          </el-form-item>
          <el-form-item label="名稱" :label-width="formLabelWidth"
                        prop="name">
            <el-input v-model="currentEditTravelSetDetail.travelSetInfo.name"></el-input>
          </el-form-item>
          <el-form-item label="詳細" :label-width="formLabelWidth"
                        prop="description">
            <el-input type="textarea"
                      v-model="currentEditTravelSetDetail.travelSetInfo.description"></el-input>
          </el-form-item>
          <el-form-item label="優先級" :label-width="formLabelWidth"
                        prop="priority">
            <el-slider v-model="currentEditTravelSetDetail.travelSetInfo.priority" :step="10" :max="99"
                       style="width: 300px"></el-slider>
          </el-form-item>
          <el-form-item label="啟用" :label-width="formLabelWidth">
            <label class="switch switch-text switch-success switch-pill form-control-label">
              <input type="checkbox" class="switch-input form-check-input"
                     v-bind:checked="currentEditTravelSetDetail.travelSetInfo.status"
                     v-on:click="handleSwitchStatus(currentEditTravelSetDetail.travelSetInfo)">
              <span class="switch-label" data-on="On"
                    data-off="Off"></span>
              <span class="switch-handle"></span>
            </label>
          </el-form-item>
          <el-form-item>
            <el-button type="warning" icon="el-icon-refresh-left"
                       v-on:click="resetTravelSetForm('travelSetDetailInfo')">重 置
            </el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>


      <el-tab-pane label="景點規劃">
        <el-form :model="currentEditTravelSetDetail.travelSetAttractions" ref="travelSetDetailAttractions">
          <template v-for="(item, index) in currentEditTravelSetDetail.travelSetAttractions.data">
            <el-row>
              <el-col :span="4">
                <el-form-item label="編號:" :prop="'.data['+index+'].sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.sn" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="ID:" :prop="'.data['+index+'].attraction.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.attraction.sn" @focus="selectTravelSetItemID(item, index, 0)"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="名稱:" :prop="'.data['+index+'].attraction.name'" :label-width="formLabelWidth">
                  <el-input v-model="item.attraction.name" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="2" ></el-col>
              <el-col :span="8">
                <el-form-item label="預定時間:" :prop="'.data['+index+'].time'" :label-width="formLabelWidth">
                  <el-date-picker
                      v-model="item.time"
                      type="datetime"
                      align="center">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="2">
                <el-button type="danger" icon="el-icon-minus"
                    @click.prevent="removeTravelSetFormItem(currentEditTravelSetDetail.travelSetAttractions.data, item)">
                  删 除
                </el-button>
              </el-col>
            </el-row>
          </template>
          <el-form-item :label-width="formLabelWidth">
            <el-button type="primary" icon="el-icon-plus"
                @click="addTravelSetFormItem(currentEditTravelSetDetail.travelSetAttractions.data, 0)">
              新 增
            </el-button>
            <el-button type="warning" icon="el-icon-refresh-left"
                       v-on:click="resetTravelSetForm('travelSetDetailAttractions')">重 置
            </el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>


      <el-tab-pane label="餐廳規劃" >
        <el-form :model="currentEditTravelSetDetail.travelSetRestaurants" ref="travelSetDetailRestaurants">
          <template v-for="(item, index) in currentEditTravelSetDetail.travelSetRestaurants.data">
            <el-row>
              <el-col :span="4">
                <el-form-item label="編號:" :prop="'.data.'+index+'.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.sn" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="ID:" :prop="'.data.'+index+'.restaurant.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.restaurant.sn" @focus="selectTravelSetItemID(item, index, 1)"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="名稱:" :prop="'.data.'+index+'.restaurant.name'" :label-width="formLabelWidth">
                  <el-input v-model="item.restaurant.name" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="2" ></el-col>
              <el-col :span="8">
                <el-form-item label="預定時間:" :prop="'.data.'+index+'.time'" :label-width="formLabelWidth">
                  <el-date-picker
                      v-model="item.time"
                      type="datetime"
                      align="center">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="2">
                <el-button type="danger" icon="el-icon-minus"
                    @click.prevent="removeTravelSetFormItem(currentEditTravelSetDetail.travelSetRestaurants.data, item)">
                  删 除
                </el-button>
              </el-col>
            </el-row>
          </template>
          <el-form-item :label-width="formLabelWidth">
            <el-button type="primary" icon="el-icon-plus"
                @click="addTravelSetFormItem(currentEditTravelSetDetail.travelSetRestaurants.data, 1)">
              新 增
            </el-button>
            <el-button type="warning" icon="el-icon-refresh-left"
                       v-on:click="resetTravelSetForm('travelSetDetailRestaurants')">重 置
            </el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>


      <el-tab-pane label="旅館規劃" >
        <el-form :model="currentEditTravelSetDetail.travelSetHotels" ref="travelSetDetailHotels">
          <template v-for="(item, index) in currentEditTravelSetDetail.travelSetHotels.data">
            <el-row>
              <el-col :span="4">
                <el-form-item label="編號:" :prop="'.data.'+index+'.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.sn" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="ID:" :prop="'.data.'+index+'hotel.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.hotel.sn" @focus="selectTravelSetItemID(item, index, 2)"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="名稱:" :prop="'.data.'+index+'.hotel.name'" :label-width="formLabelWidth">
                  <el-input v-model="item.hotel.name" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="2" ></el-col>
              <el-col :span="8">
                <el-form-item label="預定時間:" :prop="'.data.'+index+'.time'" :label-width="formLabelWidth">
                  <el-date-picker
                      v-model="item.time"
                      type="datetime"
                      align="center">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="2">
                <el-button type="danger" icon="el-icon-minus"
                    @click.prevent="removeTravelSetFormItem(currentEditTravelSetDetail.travelSetHotels.data, item)">
                  删 除
                </el-button>
              </el-col>
            </el-row>
          </template>
          <el-form-item :label-width="formLabelWidth">
            <el-button type="primary" icon="el-icon-plus"
                @click="addTravelSetFormItem(currentEditTravelSetDetail.travelSetHotels.data, 2)">
              新 增
            </el-button>
            <el-button type="warning" icon="el-icon-refresh-left"
                       v-on:click="resetTravelSetForm('travelSetDetailHotels')">重 置
            </el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>


      <el-tab-pane label="租車規劃" >
        <el-form :model="currentEditTravelSetDetail.travelSetCars" ref="travelSetDetailCars">
          <template v-for="(item, index) in currentEditTravelSetDetail.travelSetCars.data">
            <el-row>
              <el-col :span="4">
                <el-form-item label="編號:" :prop="'.data.'+index+'.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.sn" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="ID:" :prop="'.data.'+index+'.car.sn'" :label-width="formLabelWidth">
                  <el-input v-model="item.car.sn" @focus="selectTravelSetItemID(item, index, 3)"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4">
                <el-form-item label="名稱:" :prop="'.data.'+index+'.car.name'" :label-width="formLabelWidth">
                  <el-input v-model="item.car.name" disabled></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="2" ></el-col>
              <el-col :span="8">
                <el-form-item label="預定時間:" :prop="'.data.'+index+'.time'" :label-width="formLabelWidth">
                  <el-date-picker
                      v-model="item.time"
                      type="datetime"
                      align="center">
                  </el-date-picker>
                </el-form-item>
              </el-col>
              <el-col :span="2">
                <el-button type="danger" icon="el-icon-minus"
                    @click.prevent="removeTravelSetFormItem(currentEditTravelSetDetail.travelSetCars.data, item)">
                  删 除
                </el-button>
              </el-col>
            </el-row>
          </template>
          <el-form-item :label-width="formLabelWidth">
            <el-button type="primary" icon="el-icon-plus"
                @click="addTravelSetFormItem(currentEditTravelSetDetail.travelSetCars.data, 3)">
              新 增
            </el-button>
            <el-button type="warning" icon="el-icon-refresh-left"
                       v-on:click="resetTravelSetForm('travelSetDetailCars')">重 置
            </el-button>
          </el-form-item>
        </el-form>
      </el-tab-pane>
    </el-tabs>

    <div>
      <el-button type="info" icon="el-icon-close" v-on:click="cancelTravelSetForm">取 消 關 閉</el-button>
      <el-button type="success" icon="el-icon-edit" @click="saveTravelSetDetail">保 存</el-button>
    </div>
  </div>
</template>

<script>
module.exports = {
  data() {
    return {
      loading: true,
      formLabelWidth: '80px',
      travelSetDetail: null
    }
  },
  created: function () {
    this.travelSetDetail = this.currentEditTravelSetDetail
    console.log("init")
  },
  computed: Vuex.mapState(['currentEditTravelSetDetail', 'travelSetDetailLoading', 'travelSetSaved', 'travelSetDialog', 'selectItemDialog']),
  methods: {
    resetTravelSetForm(formName){
      this.$store.commit('toggleTravelSetDetailLoading', true);
      this.$refs[formName].resetFields();

      this.$store.commit('toggleTravelSetDetailLoading', false);
    },
    addTravelSetFormItem(items, type) {
      if(type == 0){
        this.currentEditTravelSetDetail.travelSetAttractions.data.push({
          sn: 0,
          time: Date.now(),
          attraction: {
            sn: 0,
            name: ''
          }
        });
      }else if(type == 1){
        this.currentEditTravelSetDetail.travelSetRestaurants.data.push({
          sn: 0,
          time: Date.now(),
          restaurant: {
            sn: 0,
            name: ''
          }
        });
      }else if(type == 2){
        this.currentEditTravelSetDetail.travelSetHotels.data.push({
          sn: 0,
          time: Date.now(),
          hotel: {
            sn: 0,
            name: ''
          }
        });
      }else if(type == 3){
        this.currentEditTravelSetDetail.travelSetCars.data.push({
          sn: 0,
          time: Date.now(),
          car: {
            sn: 0,
            name: ''
          }
        });
      }
      let last = items.length-1;
      this.$store.commit('setCurrentTravelSetDetail', this.currentEditTravelSetDetail);
      this.selectTravelSetItemID(items[last], last, type);
    },
    removeTravelSetFormItem(items, item) {
      let index = items.indexOf(item)
      if (index !== -1) {
        items.splice(index, 1)
      }
    },
    selectTravelSetItemID(item, index, type) {
      console.log(item, index, type);
      this.$store.commit('toggleSelectItemDialog', true);
      this.$store.commit('setSelectItemData', {index:index, type:type});
    },
    saveTravelSetDetail(){
      if (this.travelSetDetailLoading) {
        return;
      }
      this.$confirm('確定要提交表單?')
          .then(_ => {
            this.$store.commit('toggleTravelSetDetailLoading', true);
            this.$store.dispatch('saveTravelSteDetailData', this.travelSetDetail)
              .then(rs=> {
                if(rs){
                  // this.travelSetDetail = this.currentEditTravelSetDetail;
                  this.$message({
                    type: 'success',
                    message: '保存成功!'
                  });
                }else{
                  this.$message({
                    type: 'info',
                    message: '保存失敗!!'
                  });
                }
                this.$store.commit('toggleTravelSetDetailLoading', false);
              });
          })
          .catch(_ => {
            this.$store.commit('toggleTravelSetDetailLoading', false);
            this.$message({
              type: 'error',
              message: '發生異常!保存失敗!!'
            });
          });
    },

    cancelTravelSetForm() {
      this.$store.commit('toggleTravelSetDialog', false);
      this.$store.commit('toggleTravelSetDetailLoading', false);
      if(!this.travelSetDialog && this.travelSetSaved){
        location.reload();
      }
    },
    handleSwitchStatus(value) {
      value.status = !value.status;
    }
  }
}
</script>