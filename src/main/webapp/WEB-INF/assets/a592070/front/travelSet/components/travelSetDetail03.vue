<template>

  <v-container style="max-width: 1200px;">
    <v-btn
        text
        color="primary"
        @click="importDemoData"
    >
      帶入資料
    </v-btn>

    <v-card class="mb-4">
      <v-card-text>

        <v-dialog
            ref="dateModal"
            v-model="dateModal"
            :return-value.sync="dates"
            persistent
            width="290px"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-text-field
                v-model="dateRangeText"
                label="# 選 擇 日 期"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
              v-model="dates"
              scrollable
              multiple
              :min="new Date().toISOString()"
              locale="zh-tw"
          >
            <v-spacer></v-spacer>
            <v-btn
                text
                color="primary"
                @click="dateModal = false"
            >
              取消
            </v-btn>
            <v-btn
                text
                color="primary"
                @click="selectDate"
            >
              選擇
            </v-btn>
          </v-date-picker>
        </v-dialog>
        <v-text-field
            :value="dateNum"
            hide-details
            flat
            readonly
            label="# 選 擇 天 數"
        ></v-text-field>

        <v-select
            v-model="region"
            :items="regions"
            label="# 選 擇 地 區"
            @change="handleSelectedRegion"
        ></v-select>
        <v-text-field
            v-model="inputName"
            hide-details
            flat
            label="# 取 個 名 字 吧 ..."
        ></v-text-field>
        <v-text-field
            v-model="inputDescription"
            hide-details
            flat
            label="# 加 點 備 註 ..."
        ></v-text-field>
      </v-card-text>
    </v-card>

    <div class="text-center ma-2">
      <v-snackbar
          v-model="selectItemTimeRepeat"
      >
        {{ text }}

        <template v-slot:action="{ attrs }">
          <v-btn
              color="pink"
              text
              v-bind="attrs"
              @click="selectItemTimeRepeat = false"
          >
            Close
          </v-btn>
        </template>
      </v-snackbar>
    </div>

    <v-container>
      <v-stepper v-model="e1" @change="changeStep">
        <v-stepper-header>
          <template v-for="(eventDates, index) in travelSetDateMap">
            <v-stepper-step
                complete
                :step="index"
                editable
            >
              {{index}}
            </v-stepper-step>

            <v-divider
                v-if="index !== dates[dates.length-1]"
                :key="index"
            ></v-divider>
          </template>
        </v-stepper-header>

        <v-stepper-items>
          <template v-for="(eventDates, index) in travelSetDateMap">
            <v-stepper-content
                :step="index"
            >
              <v-card
                  class="mb-12"
                  color="grey lighten-1"
              >
                <v-timeline
                    dense
                    clipped
                >
                  <v-timeline-item
                      fill-dot
                      class="white--text mb-12"
                      large
                  >
                    <template v-slot:icon>
                      <v-dialog
                          v-model="selectItemDialog1"
                          fullscreen
                          hide-overlay
                          transition="dialog-bottom-transition"
                          ref="scrollBarTop"
                      >
                        <template v-slot:activator="{ on }">
                          <v-btn
                              color="pink"
                              fab
                              @click="addTravelSetItem"
                              v-on="on"
                          >
                            <v-icon>mdi-magnify</v-icon>
                          </v-btn>
                        </template>
                        <select-item v-if="selectItemDialog1"></select-item>
                      </v-dialog>
                    </template>
                    <v-card
                        color="red lighten-2"
                        dark
                    >

                      <v-card-title class="title" v-if="selectItem.attraction">
                        {{selectItem.attraction.name}}
                      </v-card-title>
                      <v-card-title class="title" v-else-if="selectItem.restaurant">
                        {{selectItem.restaurant.name}}
                      </v-card-title>
                      <v-card-title class="title" v-else-if="selectItem.hotel">
                        {{selectItem.hotel.name}}
                      </v-card-title>
                      <v-card-title class="title" v-else>
                        請選擇
                      </v-card-title>


                      <v-card-text class="white text--primary" v-if="selectItem.attraction">
                        <p>{{selectItem.attraction.description}}</p>
                      </v-card-text>
                      <v-card-text class="white text--primary" v-else-if="selectItem.restaurant">
                        <p>{{selectItem.restaurant.description}}</p>
                      </v-card-text>
                      <v-card-text class="white text--primary" v-else-if="selectItem.hotel">
                        <p>{{selectItem.hotel.description}}</p>
                      </v-card-text>
                      <v-card-text class="white text--primary" v-else>
                        <p></p>
                      </v-card-text>


                      <v-card-text>
                        <el-time-select
                            v-model="time"
                            :picker-options="{
                            start: '07:00',
                            step: '01:00',
                            end: '20:30'
                          }"
                            placeholder="選擇時間">
                        </el-time-select>
                      </v-card-text>
                      <v-card-text class="white text--primary">

                        <v-btn
                            v-if="selectItem.attraction"
                            color="red lighten-2"
                            class="mx-0"
                            outlined
                            @click="comment()"
                        >
                          加 入
                        </v-btn>
                        <v-btn
                            v-else-if="selectItem.restaurant"
                            color="red lighten-2"
                            class="mx-0"
                            outlined
                            @click="comment()"
                        >
                          加 入
                        </v-btn>
                        <v-btn
                            v-else-if="selectItem.hotel"
                            color="red lighten-2"
                            class="mx-0"
                            outlined
                            @click="comment()"
                        >
                          加 入
                        </v-btn>
                        <v-btn
                            v-else
                            disabled
                            color="red lighten-2"
                            class="mx-0"
                            outlined
                            @click="comment()"
                        >
                          加 入
                        </v-btn>


                      </v-card-text>
                    </v-card>

                  </v-timeline-item>

                  <v-slide-x-transition
                      group
                  >
                    <template v-for="(item,index) in timeline">

                      <v-timeline-item
                        v-if="item.attraction"
                        :key="item.attraction.sn"
                        :color="itemColor[item.type]"
                        fill-dot
                        right
                    >
                      <v-card>
                        <v-card-title
                            :class="itemColor[item.type]">
                          <v-icon
                              class="mr-4"
                              dark
                              size="42"
                          >
                            mdi-calendar-text
                          </v-icon>

                          <h2 class="display-1 white--text font-weight-light" >
                            {{item.attraction.name}}
                          </h2>
                        </v-card-title>
                        <v-card-text class="headline font-weight-bold">
                          {{item.time.toLocaleString()}}
                        </v-card-text>
                        <v-card-actions>

                          <v-spacer></v-spacer>
                          <v-btn
                              class="mx-2"
                              fab
                              dark
                              small
                              color="danger"
                              @click="removeItem(item)"
                          >
                            <v-icon dark>
                              mdi-minus
                            </v-icon>
                          </v-btn>
                        </v-card-actions>

                            <v-divider></v-divider>

                            <v-card-text>
                              {{item.attraction.description}}
                            </v-card-text>
                      </v-card>
                    </v-timeline-item>

                      <v-timeline-item
                          v-else-if="item.restaurant"
                          :key="item.restaurant.sn"
                          :color="itemColor[item.type]"
                          fill-dot
                          right
                      >
                        <v-card>
                          <v-card-title
                              :class="itemColor[item.type]">
                            <v-icon
                                class="mr-4"
                                dark
                                size="42"
                            >
                              mdi-calendar-text
                            </v-icon>

                            <h2 class="display-1 white--text font-weight-light">
                              {{item.restaurant.name}}
                            </h2>

                          </v-card-title>
                          <v-card-text class="headline font-weight-bold">
                            {{item.time.toLocaleString()}}
                          </v-card-text>
                          <v-card-actions>

                            <v-spacer></v-spacer>
                            <v-btn
                                class="mx-2"
                                fab
                                dark
                                small
                                color="danger"
                                @click="removeItem(item)"
                            >
                              <v-icon dark>
                                mdi-minus
                              </v-icon>
                            </v-btn>
                          </v-card-actions>

                          <v-divider></v-divider>

                          <v-card-text>
                            {{item.restaurant.description}}
                          </v-card-text>
                        </v-card>
                      </v-timeline-item>

                      <v-timeline-item
                          v-else-if="item.hotel"
                          :key="item.hotel.sn"
                          :color="itemColor[item.type]"
                          fill-dot
                          right
                      >
                        <v-card>
                          <v-card-title
                              :class="itemColor[item.type]">
                            <v-icon
                                class="mr-4"
                                dark
                                size="42"
                            >
                              mdi-calendar-text
                            </v-icon>
                            <h2 class="display-1 white--text font-weight-light" >
                              {{item.hotel.name}}
                            </h2>

                          </v-card-title>
                          <v-card-text class="headline font-weight-bold">
                            {{item.time.toLocaleString()}}
                          </v-card-text>
                          <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn
                                class="mx-2"
                                fab
                                dark
                                small
                                color="danger"
                                @click="removeItem(item)"
                            >
                              <v-icon dark>
                                mdi-minus
                              </v-icon>
                            </v-btn>
                          </v-card-actions>
                          <v-divider></v-divider>
                          <v-card-text >
                            {{item.hotel.description}}
                          </v-card-text>
                        </v-card>
                      </v-timeline-item>


                    </template>
                  </v-slide-x-transition>
                </v-timeline>
              </v-card>


              <v-btn
                  :disabled="noLogin"
                  color="primary"
                  @click="saveTravelSet"

              >
                保 存
              </v-btn>

              <v-btn text>
                取 消
              </v-btn>
            </v-stepper-content>
          </template>
        </v-stepper-items>
      </v-stepper>
    </v-container>


  </v-container>

</template>

<script>
module.exports = {
  components: {
    'select-item': httpVueLoader(context + '/assets/a592070/front/travelSet/components/selectItem02.vue'),
  },
  data() {
    return {
      selectItemTimeRepeat:false,
      text: '選擇的時間點重複了',
      dates: [],
      dateArray: [],
      dateMenu: false,
      dateModal: false,
      events: [],
      input: null,
      nonce: 0,

      region: this.selectRegion,

      travelSetByDate: [],
      travelSetDateMap: {},
      e1: 1,
      steps: this.dateNum,
      inputName: null,
      inputDescription: null,

      // item: this.selectItem,

      time: '08:00',
      timeMenu: false,

      itemColor: [
        'green lighten-1',
        'red lighten-1',
        'cyan lighten-1'
      ],
      showItemDetail: false,
      timeline: [],


      // selectItemDialog1: false
    }
  },
  watch: {
    steps (val) {
      console.log(this.e1);
      this.e1 = val;
    },
    travelSetDetailSortDate: function () {
      this.travelSetDateMap = this.travelSetDetailSortDate.events
      this.inputName = this.travelSetDetailSortDate.name;
      this.inputDescription = this.travelSetDetailSortDate.description;
    },
    travelSetDetail: function () {
      this.inputName = this.travelSetDetail.travelSetInfo.name;
      this.inputDescription = this.travelSetDetail.travelSetInfo.description;
    },

  },
  computed: {

    selectItemDialog1 (){
      return this.selectItemDialog
    },
    dateRangeText () {
      return this.dates.join('  #')
    },
    dateNum(){
      if(this.dates.length > 1) {
        this.dates.sort((a,b)=>new Date(a).getTime()-new Date(b).getTime());
        this.steps = this.dates.length;

        return this.dates.length;
      }
      this.steps = this.dates.length;
      return 1;
    },

    travelSetLength() {
      return this.travelSetDateMap.length;
    },

    ...Vuex.mapState(["selectItemDialog", 'regions', 'selectRegion', 'selectItem', 'isSortDetailData', 'travelSetDetailSortDate', 'travelSetDetail', 'noLogin']),
  },
  created: function (){
    this.$store.dispatch("initRegionsData");
    this.checkLogin();
  },
  methods: {
    checkLogin(){
      axios.get(context+'/travelSet/checkLogin')
          .then(response => {
            this.$store.commit('setNoLogin', response.data);
          });
    },
    changeStep(){
      console.log(this.e1);
      this.setTimeline();
    },
    openDialog () {
      // this.count += 2
      this.dialog = true
    },
    selectDate(){
      this.dates.sort((a,b)=>new Date(a).getTime()-new Date(b).getTime());
      console.log(this.dates);
      this.$refs.dateModal.save(this.dates);

      for (let date of this.dates) {
        if(!this.travelSetDateMap[date]){
          this.travelSetDateMap[date] = [];
        }
      }
      // console.log(this.travelSetDateMap);


      let eventDates = Object.keys(this.travelSetDateMap);


      this.$nextTick(function () {
        for (let eventDate of eventDates) {
          if(this.dates.indexOf(eventDate) === -1){
            console.log("del dates"+eventDate)
            delete this.travelSetDateMap[eventDate];
          }
        }
      })

      let tmp = this.travelSetDateMap;
      // console.log(this.travelSetDateMap);
      let modify = eventDates.sort().reduce(function(Obj, key) {
        Obj[key] = tmp[key];
        return Obj;
      }, {});
      console.log(modify);
      this.travelSetDateMap = modify;
      this.$store.commit('setTravelSetDetailSortDateEvents', this.travelSetDateMap);


    },
    closePicker: function(v){
      v = v < 10 ? '0'+v : v;
      this.time = v+":00";
      this.timeMenu = false
    },
    comment() {
      let time = this.time;
      console.log(time);

      let item = this.selectItem;

      item.time = new Date(this.e1);

      item.time.setHours(time.substring(0, 2));

      let events = this.travelSetDateMap[this.e1];

      if(events.length > 0){
        // let isExist = false;
        for (let i = 0; i < events.length; i++) {
          if(events[i].type == item.type && item.type == 0 && events[i].attraction.sn == item.attraction.sn) {

            events.splice(i, 1);
            break;
          }else if(events[i].type == item.type && item.type == 1 && events[i].restaurant.sn == item.restaurant.sn){

            events.splice(i, 1);
            break;
          }else if(events[i].type == item.type && item.type == 2 && events[i].hotel.sn == item.hotel.sn){

            events.splice(i, 1);
            break;
          }
        }

        // console.log(item.time);
        for (let i = 0; i < events.length; i++) {
          console.log(events[i].time.getTime() + "======" + item.time.getTime())
          if(events[i].time.getTime() === item.time.getTime()){

            this.$message({
              showClose: true,
              message: this.text,
              type: 'error'
            });
            break;
          }
          // console.log('index:'+i+'=======>'+events[i].time)
          if(events[i].time > item.time ){
            // console.log(i+'more')
            events.splice(i , 0, item);
            break;
          }

          if(i===events.length-1) {
            events.push(item);
            break;
          }
        }
        if(events.length == 0) events.push(item);

      }else{
        events.push(item)
      }

      console.log(events);
      // console.log(this.travelSetDateMap);
      // this.timeline = this.travelSetDateMap[this.e1].slice().reverse()
      this.setTimeline();
    },
    setTimeline(){
      this.timeline = this.travelSetDateMap[this.e1].slice().reverse()
    },
    removeItem: function (item) {
      let event = this.travelSetDateMap[this.e1];
      let index = event.indexOf(item);
      console.log(index);

      event.splice(index, 1);
      this.setTimeline();
    },
    addTravelSetItem () {

      this.$store.commit('toggleSelectItemDialog', true);
    },
    saveTravelSet () {

      this.travelSetDetailSortDate.name = this.inputName;
      this.travelSetDetailSortDate.description = this.inputDescription;
      // console.log(this.travelSetDateMap);
      this.$store.commit('setTravelSetDetailSortDateEvents', this.travelSetDateMap);
      // console.log(this.travelSetDetailSortDate);
      // let convertedTravelSet = this.convertToTravelSet(this.travelSetByDate);
      // this.$store.dispatch("saveTravelSetSortDate", this.travelSetDetailSortDate);
      // console.log(convertedTravelSet);
      let travelSet = this.convertToTravelSet(this.travelSetDetailSortDate);
      // console.log(travelSet);
      this.$store.dispatch("saveTravelSet", travelSet)
          .then((response) => {
            if(response.message === 0){
              this.$message({
                showClose: true,
                message: '請先登錄',
                type: 'error'
              });
            }else if(response.message === 1){
              this.$message({
                showClose: true,
                message: '保存失敗',
                type: 'error'
              });
            }else if(response.message === 2){
              this.$message({
                showClose: true,
                message: '保存成功',
                type: 'success'
              });
            }
          });

    },
    handleSelectedRegion(){
      this.setSelectRegion(this.region);
    },

    convertToTravelSet(data){
      let tmp = {
        travelSetInfo: {
          sn: data.sn,
          name: data.name,
          description: data.description,
        },
        travelSetAttractions: [],
        travelSetRestaurants: [],
        travelSetHotels: [],
      };
      for (let eventDate in data.events) {
        let event = data.events[eventDate];

        for (let i = 0; i < event.length; i++) {
          if(event[i].type === 0){
            tmp.travelSetAttractions.push({
              sn: event[i].sn === 0? null: event[i].sn,
              time: event[i].time,
              attraction: {
                sn: event[i].attraction.sn,
              }
            })
          }else if(event[i].type === 1){
            tmp.travelSetRestaurants.push({
              sn: event[i].sn === 0? null: event[i].sn,
              time: event[i].time,
              restaurant: {
                sn: event[i].restaurant.sn,
              }
            })
          }else if(event[i].type === 2){
            tmp.travelSetHotels.push({
              sn: event[i].sn === 0? null: event[i].sn,
              time: event[i].time,
              hotel: {
                sn: event[i].hotel.sn,
              }
            })
          }
        }
      }

      return tmp;
    },
    convertFromTravelSet(data){

    },
    importDemoData(){
      this.dates=['2020-12-25'];
      this.selectDate();
      this.region = '桃園市'
      this.handleSelectedRegion();
      this.inputName = '桃園在地大推薦';
      this.inputDescription = '私房景點看這裡，桃園在地大推薦!';

      let addItem01 = {
        sn: 0,
        time: new Date(2020,11,25,14),
        type: 0,
        attraction: {
          sn: 3432,
          name: '雅聞魅力博覽館',
          description: '歐風玫瑰花園、峇里島發呆亭、香氛步道走廊，讓人一踏進園區就有滿滿度假感，館內另規劃沐浴球、香氛娃娃DIY，小巧可愛適合當紀念品。'
        }
      }
      let addItem02 = {
        sn: 0,
        time: new Date(2020,11,25,18),
        type: 1,
        restaurant: {
          sn: 88,
          name: "和東燒肉屋",
          description: "提供專業炭火燒肉與新鮮多樣的蔬菜，讓您放心吃肉同時沒有負擔，重視店內愉快放鬆的氛圍，對待顧客如同家人一般，我們用心在每個細節上，希望能帶給每位顧客一份簡單卻深刻的感動"
        }
      }
      let addItem03 = {
        sn: 0,
        time: new Date(2020,11,25,20),
        type: 2,
        hotel: {
          sn: 203,
          name: "景鴻汽車旅館",
          description: "本公司自成立以來，「創新、求變、多元」的企業文化，努力深耕台灣市場，追求企業永續經營及成長，成為最卓越的旅館領導品牌，將朝多元化的經營模式邁進。以提供最便利的服務為宗旨，並善盡良好社會責任。TY MOTEL 的市場擁有與其他旅館不同化之處。時時引進各種新式設備，不斷連結消費者體驗的產品策略，亦是 TY MOTEL 和其他產品的區隔，更是能持續引領業界，以及保持領導品牌地位與未來的核心競爭能力主要原因。"
        }
      }

      this.travelSetDateMap[this.dates[0]].push(addItem01);
      this.travelSetDateMap[this.dates[0]].push(addItem02);
      this.travelSetDateMap[this.dates[0]].push(addItem03);

      this.$store.commit('addTravelSetDetailAttraction', {sn: addItem01.attraction.sn, name: addItem01.attraction.name, description: addItem01.attraction.description});
      this.$store.commit('addTravelSetDetailRestaurant', {sn: addItem02.restaurant.sn, name: addItem02.restaurant.name, description: addItem02.restaurant.description});
      this.$store.commit('addTravelSetDetailHotel', {sn: addItem03.hotel.sn, name: addItem03.hotel.name, description: addItem03.hotel.description});

      this.$store.commit('setNoEditItem', false);

      this.$store.commit('setTravelSetDetailSortDateEvents', this.travelSetDateMap);

    },

    ...Vuex.mapMutations(['setSelectRegion']),
  },
};
</script>
<style>
* {
  font-family: 'Noto Sans TC', sans-serif;
}

</style>