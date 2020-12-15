<template>
  <v-app>


  <v-container fluid style="padding: 0; margin: 0;">

    <v-container ref="infoListHead">
      <div class="row justify-content-start mb-5 pb-3" >
        <div class="col-md-7 heading-section">
          <span class="subheading">特別推薦</span>
          <h2 class="mb-4"><strong>熱 門</strong> 景 點</h2>
        </div>


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
<!--                  <v-select-->
<!--                      v-model="selectRegion"-->
<!--                      flat-->
<!--                      solo-inverted-->
<!--                      hide-details-->
<!--                      :items="regions"-->
<!--                      prepend-inner-icon="mdi-magnify"-->
<!--                      label="Region"-->
<!--                      @change="handleSelectedRegion(selectRegion)"-->
<!--                  >-->
<!--                    <template v-slot:prepend-item>-->
<!--                      <v-list-item disabled :value="null">&#45;&#45;請選擇&#45;&#45;</v-list-item>-->
<!--                      <v-list-item :value="'all'">全部</v-list-item>-->
<!--                    </template>-->
<!--                  </v-select>-->
                  <el-select v-model="selectRegion" placeholder="選擇地區" @change="handleSelectedRegion(selectRegion)">
                    <el-option label="--請選擇--" disabled :value="null"></el-option>
                    <el-option v-for="ele in regions" v-bind:key="ele" :value="ele" ></el-option>
                  </el-select>
                  <v-spacer></v-spacer>
                </template>
              </v-toolbar>
            </template>

            <template v-slot:default="props">
<!--              <v-container style="height: 100vh; overflow:auto">-->
<!--                <el-scrollbar style="height: 100%;">-->
<!--                  <v-row v-infinite-scroll="load">-->
<!--                  <v-col-->
<!--                    v-for="item in props.items"-->
<!--                    :key="item.name"-->
<!--                    cols="12"-->
<!--                    sm="6"-->
<!--                    md="4"-->
<!--                    lg="3"-->
<!--                >-->
<!--                  <v-card>-->
<!--                    <v-card-title class="subheading font-weight-bold">-->
<!--                      {{ item.name }}-->
<!--                    </v-card-title>-->

<!--                    <v-divider></v-divider>-->

<!--                    <v-list dense>-->
<!--                      <v-list-item-->
<!--                          v-for="(key, index) in filteredRegions"-->
<!--                          :key="index"-->
<!--                      >-->
<!--                        <v-list-item-content :class="{ 'blue&#45;&#45;text': sortBy === key }">-->
<!--                          {{ key }}:-->
<!--                        </v-list-item-content>-->
<!--                        <v-list-item-content-->
<!--                            class="align-end"-->
<!--                            :class="{ 'blue&#45;&#45;text': sortBy === key }"-->
<!--                        >-->
<!--                          {{ item[key.toLowerCase()] }}-->
<!--                        </v-list-item-content>-->
<!--                      </v-list-item>-->
<!--                    </v-list>-->
<!--                  </v-card>-->
<!--                </v-col>-->
<!--              </v-row>-->
<!--                </el-scrollbar>-->
<!--              </v-container>-->
<!--              <v-card>-->
<!--                <template v-for="(beer, index) in beers">-->
<!--                  <v-layout-->
<!--                      :key="index"-->
<!--                      @click=""-->
<!--                  >-->
<!--                    <v-flex xs5>-->
<!--                      <v-img-->
<!--                          :src="beer.img"-->
<!--                          height="125px"-->
<!--                          contain-->
<!--                      ></v-img>-->
<!--                    </v-flex>-->
<!--                    <v-flex xs7>-->
<!--                      <v-card-title primary-title>-->
<!--                        <div>-->
<!--                          <div class="headline" v-html="beer.name"></div>-->
<!--                          <div v-html="beer.tagline"></div>-->
<!--                        </div>-->
<!--                      </v-card-title>-->
<!--                    </v-flex>-->
<!--                  </v-layout>-->
<!--                </template>-->
<!--                <div v-if="beers.length === 0">-->
<!--                  <v-progress-circular-->
<!--                      indeterminate-->
<!--                      color="primary"-->
<!--                      class="bottom"-->
<!--                  />-->
<!--                </div>-->
<!--              </v-card>-->

                <v-container style="height: 100vh; overflow:auto">
                  <el-scrollbar style="height: 100%;" ref="scrollbar">
                    <ul class="align-center"
                        v-infinite-scroll="load"
                        infinite-scroll-disabled="disabled"
                        infinite-scroll-distance="300"
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
                              <h3><a href="javascript:0" @click="toDetail(item.sn)">{{item.name}}</a></h3>
                              <el-rate
                                  v-model="item.rating"
                                  disabled
                                  show-score
                                  text-color="#ff9900"
                                  score-template="{value}">
                              </el-rate>
<!--                              <p class="rate">-->
<!--                                <i class="icon-star"></i>-->
<!--                                <i class="icon-star"></i>-->
<!--                                <i class="icon-star"></i>-->
<!--                                <i class="icon-star"></i>-->
<!--                                <i class="icon-star-o"></i>-->
<!--                                <span>8 Rating</span>-->
<!--                              </p>-->
                              <p>{{item.description}}</p>
                              <hr>
                              <p class="bottom-area d-flex">
                                <span><i class="icon-map-o"></i>{{item.address}}</span>
                                <span class="ml-auto">
                                  <el-button type="success" round @click="toDetail(item.sn)">Discover</el-button>
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
                    <v-container>
                      <p v-if="selectListLoading"><strong>加 載 中 ...</strong></p>
                      <p v-if="noMore"><strong>沒有更多了</strong></p>
                    </v-container>
                  </el-scrollbar>
                </v-container>

            </template>
          </v-data-iterator>
            </v-col>
            <v-spacer></v-spacer>
          </v-row>
        </v-container>

<!--        <v-container class="ma-7 pa-5" >-->
<!--          <v-row>-->
<!--          <v-spacer></v-spacer>-->
<!--          <v-col md="10" :align="'center'" style="height: 100vh; overflow:auto">-->

<!--          <el-scrollbar style="height: 100%;">-->
<!--            <ul class="align-center" v-infinite-scroll="load" style="padding-right: 10% ;">-->
<!--              <li v-for="i in count" type="none">-->
<!--                <div class="row">-->
<!--                  <div class="col-md-6 col-lg-3" v-for="index in 4">-->
<!--                    <div class="destination">-->

<!--                      <div class="img img-2 d-flex justify-content-center align-items-center">-->
<!--                        <el-image-->
<!--                            :src="images[0]"-->
<!--                            :preview-src-list="images">-->
<!--                        </el-image>-->
<!--                      </div>-->


<!--                      <div class="text p-3">-->
<!--                        <h3><a href="#">Luxury Restaurant</a></h3>-->
<!--                        <p class="rate">-->
<!--                          <i class="icon-star"></i>-->
<!--                          <i class="icon-star"></i>-->
<!--                          <i class="icon-star"></i>-->
<!--                          <i class="icon-star"></i>-->
<!--                          <i class="icon-star-o"></i>-->
<!--                          <span>8 Rating</span>-->
<!--                        </p>-->
<!--                        <p>Far far away, behind the word mountains, far from the countries</p>-->
<!--                        <hr>-->
<!--                        <p class="bottom-area d-flex">-->
<!--                          <span><i class="icon-map-o"></i> San Franciso, CA</span>-->
<!--                          <span class="ml-auto">-->
<!--                          <a type="button" @click="$vuetify.goTo(toDetailInfo, options)">Discover</a></span>-->
<!--                        </p>-->
<!--                      </div>-->
<!--                    </div>-->
<!--                  </div>-->
<!--                </div>-->
<!--              </li>-->
<!--            </ul>-->
<!--          </el-scrollbar>-->
<!--          </v-col>-->
<!--          <v-spacer></v-spacer>-->
<!--          </v-row>-->
<!--        </v-container>-->
      </div>
    </v-container>


    <div ref="detailInfoDirect"></div>

    <v-lazy
        v-model="isActive"
        :options="{
          threshold: .5
        }"
        min-height="200"
        transition="fade-transition"
    >
<!--    <section class=" testimony-section bg-light">-->
    <v-container fluid ref="detailInfo" style="padding: 0; margin: 0; background-color: #ECEFF1">

      <div class="row justify-content-center mb-5 pb-3">
        <div class="col-md-7 text-center heading-section ">
          <attraction-detail></attraction-detail>
        </div>
      </div>
    </v-container>
<!--    </section>-->
    </v-lazy>

    <v-fab-transition>
      <v-btn
          v-show="btnFlag"
          class="mx-2"
          fab
          icon
          bottom
          right
          large
          fixed
          dark
          style="background-color: #90CAF9"
          @click="$vuetify.goTo(toInfoList, options)">
        <v-icon x-large>
          mdi-arrow-up-drop-circle
        </v-icon>
      </v-btn>
    </v-fab-transition>
  </v-container>

  </v-app>
</template>

<script>
module.exports = {
  components: {
    "attraction-detail": httpVueLoader(context + '/assets/a592070/front/attraction/components/attractionDetail.vue'),
    // 'attraction-info': httpVueLoader(context + '/assets/a592070/front/attraction/components/attractionInfo.vue')
  },
  data() {
    return {
      isActive: true,
      barHeight: '100%',
      images: [
          context+'/assets/attraction/1/179ac12b-892f-355d-8f6a-17b605ec7894.jpg',
          context+'/assets/attraction/1/08299ea3-9700-317d-b8c5-dd9de05ff5ca.jpg',
          context+'/assets/attraction/1/ceff9e32-2c81-3176-9415-7ade0c9a0719.jpg',
      ],
      count: 0,
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
    toInfoList() {
      return this.$refs['infoList'];
    },
    toInfoListHead() {
      return this.$refs['infoListHead'];
    },
    toDetailInfo() {
      return this.$refs['detailInfoDirect'];
    },
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
    window.addEventListener("scroll", this.scrollToTop, true);
    this.init();
  },
  destroyed(){
    window.removeEventListener("scroll", this.scrollToTop, true);
  },
  methods: {
    init(){
      this.$store.dispatch("initRegionsData");
      this.$store.dispatch("initAttractionListData");
      this.$store.dispatch('initAttractionData', 1);
    },
    load () {
      this.$store.commit("addPage");
      this.$store.dispatch("appendAttractionListData", {region: this.selectRegion, keyword:this.search});
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
    scrollToTop() {
      const that = this;
      let scrollTop =
          window.pageYOffset ||
          document.documentElement.scrollTop ||
          document.body.scrollTop;
      that.scrollTop = scrollTop;
      if (that.scrollTop > 30) {
        that.btnFlag = true;
      } else {
        that.btnFlag = false;
      }
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



    toDetail(id){
      this.$vuetify.goTo(this.toDetailInfo, this.options);
      this.$store.dispatch('initAttractionData', id);
    }


  }

};

</script>
<style>
* {
  font-family: 'Noto Sans TC', sans-serif;
}

.box {
  width: 200px;
  height: 100px;
  background: aliceblue;
}

.el-scrollbar {
  height: 100%;
}
.el-scrollbar__wrap {
  overflow: scroll;
  width: 110%;
  height: 120%;
}
.gotop-a {
  /*display: block;*/
  /*width: 1.5rem;*/
  /*height: 5rem;*/
  /*!*background: url(~@/assets/images/icon-top.gif) no-repeat 0 0;*!*/
  /*background-size: 0.5rem;*/
  /*margin: auto;*/
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
