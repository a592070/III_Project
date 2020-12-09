<template>
  <v-app>






  <v-container fluid style="padding: 0; margin: 0;">

    <v-container ref="infoList">
      <div class="row justify-content-start mb-5 pb-3">
        <div class="col-md-7 heading-section">
          <span class="subheading">特別推薦</span>
          <h2 class="mb-4"><strong>熱 門</strong> 景 點</h2>
        </div>

        <div style=" height: 100vh; overflow:auto">

          <el-scrollbar style="height: 100%;">
            <ul class="infinite-list" v-infinite-scroll="load" style="padding-right: 10% ;">
              <li v-for="i in count" class="infinite-list-item">
                <div class="row">
                  <div class="col-md-6 col-lg-3" v-for="index in 4">
                    <div class="destination">

                      <div class="img img-2 d-flex justify-content-center align-items-center">
                        <el-image
                            :src="images[0]"
                            :preview-src-list="images">
                        </el-image>
                      </div>


                      <div class="text p-3">
                        <h3><a href="#">Luxury Restaurant</a></h3>
                        <p class="rate">
                          <i class="icon-star"></i>
                          <i class="icon-star"></i>
                          <i class="icon-star"></i>
                          <i class="icon-star"></i>
                          <i class="icon-star-o"></i>
                          <span>8 Rating</span>
                        </p>
                        <p>Far far away, behind the word mountains, far from the countries</p>
                        <hr>
                        <p class="bottom-area d-flex">
                          <span><i class="icon-map-o"></i> San Franciso, CA</span>
                          <span class="ml-auto">
                          <a type="button" @click="$vuetify.goTo(toDetailInfo, options)">Discover</a></span>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </el-scrollbar>

        </div>
      </div>
    </v-container>


    <div ref="detailInfoDirect"></div>

<!--    <section class=" testimony-section bg-light">-->
    <v-container fluid ref="detailInfo" style="padding: 0; margin: 0; background-color: #ECEFF1">

      <div class="row justify-content-center mb-5 pb-3">
        <div class="col-md-7 text-center heading-section ">
          <attraction-detail></attraction-detail>
        </div>
      </div>
    </v-container>
<!--    </section>-->

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
    "attraction-detail": httpVueLoader(context + '/assets/a592070/font/js/components/attraction/attractionDetail.vue'),
    'attraction-info': httpVueLoader(context + '/assets/a592070/font/js/components/attraction/attractionInfo.vue')
  },
  data() {
    return {
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
    }
  },
  computed: {
    toInfoList() {
      return this.$refs['infoList'];
    },
    toDetailInfo() {
      return this.$refs['detailInfoDirect'];
    },
    options () {
      return {
        duration: 1000,
        offset: 100,
        easing: 'easeInOutCubic'
      }
    },
  },
  mounted(){
    window.addEventListener("scroll", this.scrollToTop, true);
  },
  destroyed(){
    window.removeEventListener("scroll", this.scrollToTop, true);
  },
  methods: {
    getFirstImage(){
    },
    load () {
      this.count += 1
    },
    scrollTo() {
      let scrollTop =
          window.pageYOffset ||
          document.documentElement.scrollTop ||
          document.body.scrollTop;
      this.scrollTop = scrollTop;
      let target =  this.$refs['infoList'].offsetTop;
      console.log(target);
      console.log(scrollTop);
      if (this.scrollTop > target) {
        this.scrollFlag = true;
      }
    },
    backTop() {
      const that = this;
      let timer = setInterval(() => {
        let ispeed = Math.floor(-that.scrollTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop =
            that.scrollTop + ispeed;
        if (that.scrollTop === 0) {
          clearInterval(timer);
        }
      }, 16);
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
    }
  }

};

</script>
<style>
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
</style>
