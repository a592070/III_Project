<template>
  <v-card
      tile
  >
    <v-toolbar
        flat
        dark
        color="primary"
    >
      <v-btn
          icon
          dark
          @click="() => {this.$store.commit('toggleSelectItemDialog', false);}"
      >
        <v-icon>mdi-close</v-icon>
      </v-btn>
      <v-toolbar-title>選擇旅程項目</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-select
          v-model="type"
          :items="itemType"
          chips
          label="Type"
          color="blue-grey lighten-2"
          solo
          @change="handleSelectItemType"
      ></v-select>
      <v-spacer></v-spacer>
      <v-text-field
          v-if="selectItemType+1"
          v-model="search"
          v-on:keyup="handleSelectedKeyword"
          clearable
          flat
          solo-inverted
          hide-details
          prepend-inner-icon="mdi-magnify"
          label="Search"
      ></v-text-field>
      <template v-if="selectItemType+1 && $vuetify.breakpoint.mdAndUp">
        <v-spacer></v-spacer>

        <el-select v-model="region" placeholder="選擇地區" @change="handleSelectedRegion(region)">
          <el-option label="--請選擇--" disabled :value="null"></el-option>
          <el-option v-for="ele in regions" v-bind:key="ele" :value="ele"></el-option>
        </el-select>
        <v-spacer></v-spacer>
      </template>
    </v-toolbar>
    <v-card-text>
  <div v-if="selectItemType+1">
    <v-spacer ref="scrollTopDiv"></v-spacer>
    <el-scrollbar style="height: 100%;" ref="scrollbar">
    <ul class="align-center"
        v-infinite-scroll="load"
        :infinite-scroll-disabled="disabled"
        style="padding-right: 10% ;"

    >
      <template v-for="item in itemList">
        <li type="none">
          <v-hover v-slot="{ hover }">
            <v-card
                :elevation="hover ? 12 : 2"
                :class="{ 'on-hover': hover }"
            >
              <v-layout>
                <v-flex xs5>
                  <el-image
                      :src="item.images[0]"
                      :preview-src-list="item.images"
                      :fit="'contain'"
                  >
                    <el-image
                        slot="error"
                        :src="noPic"
                        :fit="'contain'"
                    >
                    </el-image>
                  </el-image>

                </v-flex>


                <v-flex xs7>


                  <div class="text p-3">
                    <h3><a href="javascript:0" @click="handleItemClick(item.sn)">{{ item.name }}</a></h3>
                    <el-rate
                        v-model="item.rating"
                        disabled
                        show-score
                        text-color="#ff9900"
                        score-template="{value}">
                    </el-rate>
                    <p>{{ item.description }}</p>
                    <hr>
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i>{{ item.address }}</span>
                      <span class="ml-auto">
                                  <el-button type="success" round @click="handleItemClick(item)">選 擇</el-button>
                                </span>
                    </p>
                  </div>

                </v-flex>

              </v-layout>
              <hr/>
            </v-card>
          </v-hover>
        </li>

      </template>

    </ul>
    </el-scrollbar>
    <div class="gotop-a">
        <a href="javascript:;" class="el-icon-caret-top" @click="scrollbarToTop"></a>
      </div>
      <p v-if="selectListLoading"><strong>加 載 中 ...</strong></p>
      <p v-if="noMore"><strong>沒有更多了</strong></p>
  </div>
    </v-card-text>
<!--    <div style="flex: 1 1 auto;"></div>-->

  </v-card>

</template>

<script>
module.exports = {
  components: {
  },
  data() {
    return {
      noPic: context+'/assets/nopic.jpg',
      search: '',

      region: this.selectRegion,
      type: 0

      // selectType: this.selectItemType,
      // itemTypes: [
      //   { text: '景點', value: 0},
      //   { text: '餐廳', value: 1},
      //   { text: '旅館', value: 2},
      // ],
    }
  },
  computed: {
    toScrollbar(){
      return this.$refs['scrollbar'];
    },
    options () {
      return {
        duration: 1000,
        offset: 100,
        easing: 'easeInOutCubic'
      }
    },
    noMore () {
      return this.pageData.currentPage >= this.pageData.totalPageCount;
    },
    disabled () {
      return this.noMore
    },
    ...Vuex.mapState(['itemList', 'selectListLoading', 'pageData', 'selectRegion', 'regions', 'selectItemType', 'itemType', 'selectItemDialog', 'selectItem'])
  },
  created: function (){
  },
  mounted(){
    this.init();
  },
  destroyed(){
  },
  methods: {
    init(){
      this.$store.commit('toggleSelectListLoading', true);

      // this.$store.dispatch("initRegionsData");
      this.$store.dispatch("initItemListData")
          .then(() => {
            this.$store.commit('toggleSelectListLoading', false);
          });
    },
    load () {
      console.log("load...")
      if(!this.selectListLoading){
        this.$store.commit('toggleSelectListLoading', true);
        this.$store.commit("addPage");
        this.$store.dispatch("appendItemListData", {region: this.selectRegion, keyword: this.search})
            .then(() => {
              this.$store.commit('toggleSelectListLoading', false);
            })
      }
    },
    handleSelectItemType(){
      console.log(this.type);
      this.scrollbarToTop();
      this.$store.commit('setSelectItemType', this.type)

      this.init();
    },
    handleSelectedKeyword(){
      this.selectData();
    },
    handleSelectedRegion(region){
      // this.selectRegion = region;
      this.$store.commit('setSelectRegion', this.region);

      this.selectData();
    },
    selectData(){
      console.log(this.selectRegion, this.search);
      this.scrollbarToTop();
      this.$store.commit('toggleSelectListLoading', true);
      this.$store.dispatch("selectedItemListData", {region: this.selectRegion, keyword:this.search})
          .then(() => {
            this.$store.commit('toggleSelectListLoading', false);
          })
    },

    scrollbarToTop(){
      let timer = setInterval(() => {
        let scrollTop = this.$refs['scrollbar'].wrap.scrollTop;
        let ispeed = Math.floor(-scrollTop / 5);
        this.$refs['scrollbar'].wrap.scrollTop = scrollTop + ispeed;
        if (scrollTop === 0) {
          clearInterval(timer);
        }
      }, 16);
    },

    handleItemClick(obj){
      console.log(obj);
      this.$store.commit('setSelectItem', {sn: obj.sn, name: obj.name, description: obj.description});
      this.$store.commit('toggleSelectItemDialog', false);
    },


  }

};

</script>
<style>
* {
  font-family: 'Noto Sans TC', sans-serif;
}

.gotop-a {

  left: 4px;
  bottom: 200px;
  position: fixed;
  background-color: #fff;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  color: #409eff;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  box-shadow: 0 0 10px rgba(0,0,0,.5);
  cursor: pointer;
  z-index: 5;
}
</style>
