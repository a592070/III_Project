<template>
  <v-app>

    <v-container fluid style="padding: 0; margin: 0;">


          <v-container fluid >
            <v-row>
              <v-spacer></v-spacer>
              <v-col md="12" :align="'center'">
                <v-data-iterator
                    :items="attractionList"
                    hide-default-footer
                >
                  <template v-slot:header >
                    <v-toolbar
                        dark
                        color="blue darken-3"
                        class="mb-1"
                        ref="infoList"
                        :absolute="true"
                    >
                      <v-text-field
                          v-model="search"
                          v-on:keyup="handleSelectedKeyword"
                          clearable
                          flat
                          solo-inverted
                          hide-details
                          prepend-inner-icon="mdi-magnify"
                          label="Search"
                      ></v-text-field>
                      <template v-if="$vuetify.breakpoint.mdAndUp">
                        <v-spacer></v-spacer>

                        <el-select v-model="selectRegion" placeholder="選擇地區" @change="handleSelectedRegion(selectRegion)">
                          <el-option label="--請選擇--" disabled :value="null"></el-option>
                          <el-option v-for="ele in regions" v-bind:key="ele" :value="ele" ></el-option>
                        </el-select>
                        <v-spacer></v-spacer>
                      </template>
                    </v-toolbar>
                  </template>

                  <template v-slot:default="props">

                    <v-container style="height: 100vh; overflow:auto">
                      <el-scrollbar style="height: 100%;" ref="scrollbar">
                        <ul class="align-center"
                            :v-infinite-scroll="load"
                            :infinite-scroll-disabled="disabled"
                            :infinite-scroll-distance="300"
                            style="padding-right: 10% ;"
                        >
                          <template v-for="item in attractionList">
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


                                    <v-flex xs7 >


                                      <div class="text p-3">
                                        <h3><a href="javascript:0" @click="handleItemClick(item.sn)">{{item.name}}</a></h3>
                                        <el-rate
                                            v-model="item.rating"
                                            disabled
                                            show-score
                                            text-color="#ff9900"
                                            score-template="{value}">
                                        </el-rate>
                                        <p>{{item.description}}</p>
                                        <hr>
                                        <p class="bottom-area d-flex">
                                          <span><i class="icon-map-o"></i>{{item.address}}</span>
                                          <span class="ml-auto">
                                  <el-button type="success" round @click="handleItemClick(item.sn)">選 擇</el-button>
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
                        <div class="gotop-a">
                          <a href="javascript:;" class="el-icon-caret-top" @click="scrollbarToTop"></a>
                        </div>
                          <p v-if="selectListLoading"><strong>加 載 中 ...</strong></p>
                          <p v-if="noMore"><strong>沒有更多了</strong></p>
                      </el-scrollbar>
                    </v-container>

                  </template>
                </v-data-iterator>
              </v-col>
              <v-spacer></v-spacer>
            </v-row>
          </v-container>


    </v-container>

  </v-app>
</template>

<script>
module.exports = {
  components: {
  },
  data() {
    return {
      isActive: true,
      barHeight: '100%',

      detailImage: false,
      show: true,
      scrollFlag: false,
      absolute: true,
      overlay: false,
      hidden: false,
      btnFlag: false,

      noPic: context+'/assets/nopic.jpg',
      selectRegion: '全部',
      search: '',

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
      return this.selectListLoading || this.noMore
    },
    ...Vuex.mapState(['attractionList', 'selectListLoading', 'pageData', 'regions'])
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
      this.$store.dispatch("initRegionsData");
      this.$store.dispatch("initAttractionListData");
    },
    load () {
      this.$store.commit("addPage");
      this.$store.dispatch("appendAttractionListData", {region: this.selectRegion, keyword: this.search});

    },
    handleSelectedKeyword(){
      this.selectData();
    },
    handleSelectedRegion(region){
      this.selectRegion = region;
      this.selectData();
    },
    selectData(){
      console.log(this.selectRegion, this.search);
      this.$store.commit('toggleSelectListLoading', true);
      this.$store.dispatch("selectedAttractionListData", {region: this.selectRegion, keyword:this.search})
          .then(() => {
            this.scrollbarToTop();
            this.$store.commit('toggleSelectListLoading', false);
          })
    },

    scrollbarToTop(){
      // this.$refs['scrollbar'].wrap.scrollTop = 0;

      let timer = setInterval(() => {
        let scrollTop = this.$refs['scrollbar'].wrap.scrollTop;
        let ispeed = Math.floor(-scrollTop / 5);
        this.$refs['scrollbar'].wrap.scrollTop = scrollTop + ispeed;
        // document.documentElement.scrollTop = document.body.scrollTop =
        //     this.scrollTop + ispeed;
        if (scrollTop === 0) {
          clearInterval(timer);
        }
      }, 16);

      this.$vuetify.goTo(this.toInfoList, this.options)
    },

    handleItemClick(id){
      console.log(id);
    }


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
  position: absolute;
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
