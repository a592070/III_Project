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

      <v-overlay
          :absolute="true"
          :opacity="0.8"
          :value="noEditItem"
      >
        <v-btn
            class="white--text"
            color="teal"
            @click="beforeTravelSetEditItemClose"
        >
          沒 有 任 何 東 西
        </v-btn>
      </v-overlay>

        <el-tabs type="border-card" style="height:100%; overflow-y:auto;overflow-x:hidden;">
          <el-tab-pane label="景點規劃">
            <el-form :model="travelSetDetail.travelSetAttractions" >
              <template v-for="(item, index) in travelSetDetail.travelSetAttractions" >
                <el-row>
                  <el-col :span="8">
                    <el-form-item label="ID:" :label-width="formLabelWidth">
                      <el-input v-model="item.attraction.sn" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="11">
                    <el-form-item label="名稱:" :label-width="formLabelWidth">
                      <el-input v-model="item.attraction.name" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="1" ><p></p></el-col>
                  <el-col :span="4">
                    <el-button type="primary" icon="el-icon-plus"
                               @click.prevent="addTravelSetFormItem(item, 0)">
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
                  <el-col :span="8">
                    <el-form-item label="ID:" :label-width="formLabelWidth">
                      <el-input v-model="item.restaurant.sn" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="11">
                    <el-form-item label="名稱:" :label-width="formLabelWidth">
                      <el-input v-model="item.restaurant.name" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="1" ><p></p></el-col>
                  <el-col :span="4">
                    <el-button type="primary" icon="el-icon-plus"
                               @click.prevent="addTravelSetFormItem(item, 1)">
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
                  <el-col :span="8">
                    <el-form-item label="ID:" :label-width="formLabelWidth">
                      <el-input v-model="item.hotel.sn" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="11">
                    <el-form-item label="名稱:" :label-width="formLabelWidth">
                      <el-input v-model="item.hotel.name" disabled></el-input>
                    </el-form-item>
                  </el-col>
                  <el-col :span="1" ><p></p></el-col>
                  <el-col :span="4">
                    <el-button type="primary" icon="el-icon-plus"
                               @click.prevent="addTravelSetFormItem(item, 2)">
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
  computed: Vuex.mapState(['travelSetDetail', 'travelSetDetailLoading', 'travelSetEditItemDialog', 'noEditItem']),
  methods: {
    beforeTravelSetEditItemClose(){
      this.$store.commit('setTravelSetEditItemDialog', false)

    },
    addTravelSetFormItem(item, type){
      item.type = type;
      item.time = null;
      item.sn = 0;

      console.log(item);
      console.log(type);

      this.$store.commit('setSelectItemType', type);
      this.$store.commit('setSelectItemFromEdit', item);

      this.$store.commit('setTravelSetEditItemDialog', false)
    }
  }



}
</script>