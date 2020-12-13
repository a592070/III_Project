<template>
  <v-app>


  <v-container fluid style="padding: 0; margin: 0;">

    <v-container ref="infoList">
      <div class="row justify-content-start mb-5 pb-3" >
        <div class="col-md-7 heading-section">
          <span class="subheading">特別推薦</span>
          <h2 class="mb-4"><strong>熱 門</strong> 景 點</h2>
        </div>


        <v-container fluid>
          <v-data-iterator
              :items="items"
              :search="search"
              :sort-by="sortBy.toLowerCase()"
              :sort-desc="sortDesc"
              hide-default-footer
          >
            <template v-slot:header>
              <v-toolbar
                  dark
                  color="blue darken-3"
                  class="mb-1"
              >
                <v-text-field
                    v-model="search"
                    clearable
                    flat
                    solo-inverted
                    hide-details
                    prepend-inner-icon="mdi-magnify"
                    label="Search"
                ></v-text-field>
                <template v-if="$vuetify.breakpoint.mdAndUp">
                  <v-spacer></v-spacer>
                  <v-select
                      v-model="sortBy"
                      flat
                      solo-inverted
                      hide-details
                      :items="keys"
                      prepend-inner-icon="mdi-magnify"
                      label="Sort by"
                  ></v-select>
                  <v-spacer></v-spacer>
                  <v-btn-toggle
                      v-model="sortDesc"
                      mandatory
                  >
                    <v-btn
                        large
                        depressed
                        color="blue"
                        :value="false"
                    >
                      <v-icon>mdi-arrow-up</v-icon>
                    </v-btn>
                    <v-btn
                        large
                        depressed
                        color="blue"
                        :value="true"
                    >
                      <v-icon>mdi-arrow-down</v-icon>
                    </v-btn>
                  </v-btn-toggle>
                </template>
              </v-toolbar>
            </template>

            <template v-slot:default="props">
              <v-row>
                <v-col
                    v-for="item in props.items"
                    :key="item.name"
                    cols="12"
                    sm="6"
                    md="4"
                    lg="3"
                >
                  <v-card>
                    <v-card-title class="subheading font-weight-bold">
                      {{ item.name }}
                    </v-card-title>

                    <v-divider></v-divider>

                    <v-list dense>
                      <v-list-item
                          v-for="(key, index) in filteredKeys"
                          :key="index"
                      >
                        <v-list-item-content :class="{ 'blue--text': sortBy === key }">
                          {{ key }}:
                        </v-list-item-content>
                        <v-list-item-content
                            class="align-end"
                            :class="{ 'blue--text': sortBy === key }"
                        >
                          {{ item[key.toLowerCase()] }}
                        </v-list-item-content>
                      </v-list-item>
                    </v-list>
                  </v-card>
                </v-col>
              </v-row>
            </template>
          </v-data-iterator>
        </v-container>

        <v-container class="ma-7 pa-5" >
          <v-row>
          <v-spacer></v-spacer>
          <v-col md="10" :align="'center'" style="height: 100vh; overflow:auto">

          <el-scrollbar style="height: 100%;">
            <ul class="align-center" v-infinite-scroll="load" style="padding-right: 10% ;">
              <li v-for="i in count" type="none">
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
          </v-col>
          <v-spacer></v-spacer>
          </v-row>
        </v-container>
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
    "attraction-detail": httpVueLoader(context + '/assets/a592070/front/attraction/components/attractionDetail.vue'),
    'attraction-info': httpVueLoader(context + '/assets/a592070/front/attraction/components/attractionInfo.vue')
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
      itemsPerPageArray: [4, 8, 12],
      search: '',
      filter: {},
      sortDesc: false,
      page: 1,
      itemsPerPage: 4,
      sortBy: 'name',
      keys: [
        'Name',
        'Calories',
        'Fat',
        'Carbs',
        'Protein',
        'Sodium',
        'Calcium',
        'Iron',
      ],
      items: [
        {
          name: 'Frozen Yogurt',
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          sodium: 87,
          calcium: '14%',
          iron: '1%',
        },
        {
          name: 'Ice cream sandwich',
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          sodium: 129,
          calcium: '8%',
          iron: '1%',
        },
        {
          name: 'Eclair',
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0,
          sodium: 337,
          calcium: '6%',
          iron: '7%',
        },
        {
          name: 'Cupcake',
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3,
          sodium: 413,
          calcium: '3%',
          iron: '8%',
        },
        {
          name: 'Gingerbread',
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9,
          sodium: 327,
          calcium: '7%',
          iron: '16%',
        },
        {
          name: 'Jelly bean',
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0,
          sodium: 50,
          calcium: '0%',
          iron: '0%',
        },
        {
          name: 'Lollipop',
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0,
          sodium: 38,
          calcium: '0%',
          iron: '2%',
        },
        {
          name: 'Honeycomb',
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5,
          sodium: 562,
          calcium: '0%',
          iron: '45%',
        },
        {
          name: 'Donut',
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9,
          sodium: 326,
          calcium: '2%',
          iron: '22%',
        },
        {
          name: 'KitKat',
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          sodium: 54,
          calcium: '12%',
          iron: '6%',
        },
      ],
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
    numberOfPages () {
      return Math.ceil(this.items.length / this.itemsPerPage)
    },
    filteredKeys () {
      return this.keys.filter(key => key !== 'Name')
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
