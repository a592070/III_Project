<template>
  <v-container>
    <el-drawer
        title="title!"
        :visible.sync="travelSetEditItemDialog"
        :before-close="beforeTravelSetEditItemClose"
        direction="ltr"
        :with-header="false"
        wrapperClosable
        size="30%">
        <el-tabs type="border-card" style="height:100%; overflow-y:auto;overflow-x:hidden;">
          <el-tab-pane label="景點規劃">
            <el-form :model="travelSetDetail.travelSetAttractions" >
              <template v-for="(item, index) in travelSetDetail.travelSetAttractions" >
                <el-row>
                  <el-col :span="6">
                    <el-form-item label="ID:" :label-width="formLabelWidth">
                      <el-input v-model="item.attraction.sn" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="10">
                    <el-form-item label="名稱:" :label-width="formLabelWidth">
                      <el-input v-model="item.attraction.name" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="2" ><p></p></el-col>
                  <el-col :span="6">
                    <el-button type="primary" icon="el-icon-plus"
                               @click.prevent="addTravelSetFormItem(travelSetDetail.travelSetAttractions, 0)">
                      添 加
                    </el-button>
                  </el-col>
                </el-row>
              </template>
            </el-form>
          </el-tab-pane>


          <el-tab-pane label="餐廳規劃" >
            <el-form :model="travelSetDetail.travelSetRestaurants" >
              <template v-for="(item, index) in travelSetDetail.travelSetRestaurants">
                <el-row>
                  <el-col :span="6">
                    <el-form-item label="ID:" :label-width="formLabelWidth">
                      <el-input v-model="item.restaurant.sn" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="10">
                    <el-form-item label="名稱:" :label-width="formLabelWidth">
                      <el-input v-model="item.restaurant.name" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="2" ><p></p></el-col>
                  <el-col :span="6">
                    <el-button type="primary" icon="el-icon-plus"
                               @click.prevent="addTravelSetFormItem(travelSetDetail.travelSetRestaurants, 1)">
                      添 加
                    </el-button>
                  </el-col>
                </el-row>
              </template>
            </el-form>
          </el-tab-pane>


          <el-tab-pane label="旅館規劃" >
            <el-form :model="travelSetDetail.travelSetHotels" >
              <template v-for="(item, index) in travelSetDetail.travelSetHotels">
                <el-row>
                  <el-col :span="6">
                    <el-form-item label="ID:" :label-width="formLabelWidth">
                      <el-input v-model="item.hotel.sn" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="10">
                    <el-form-item label="名稱:" :label-width="formLabelWidth">
                      <el-input v-model="item.hotel.name" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="2" ><p></p></el-col>
                  <el-col :span="6">
                    <el-button type="primary" icon="el-icon-plus"
                               @click.prevent="addTravelSetFormItem(travelSetDetail.travelSetHotels, 2)">
                      添 加
                    </el-button>
                  </el-col>
                </el-row>
              </template>
            </el-form>
          </el-tab-pane>
        </el-tabs>
    </el-drawer>
  </v-container>
</template>
<script>
module.exports = {
  data() {
    return {
      loading: true,
      formLabelWidth: '80px',
    }
  },
  computed: Vuex.mapState(['travelSetDetail', 'travelSetDetailLoading', 'travelSetEditItemDialog']),
  methods: {
    beforeTravelSetEditItemClose(){
      this.$store.commit('setTravelSetEditItemDialog', false)

    },
    addTravelSetFormItem(items, type){

    }
  }



}
</script>