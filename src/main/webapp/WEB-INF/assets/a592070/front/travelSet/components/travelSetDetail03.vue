<template>

  <v-container style="max-width: 1200px;">
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
            label="# 取 個 名 子 吧 ..."
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
<!--                      <v-card-title class="title">-->
<!--                        {{selectItem.name}}-->
<!--                      </v-card-title>-->

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


<!--                      <v-card-text class="white text&#45;&#45;primary">-->
<!--                        <p>{{selectItem.description}}</p>-->
<!--                      </v-card-text>-->

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
<!--                        <v-btn-->
<!--                            :disabled="selectItem.sn === 0"-->
<!--                            color="red lighten-2"-->
<!--                            class="mx-0"-->
<!--                            outlined-->
<!--                            @click="comment()"-->
<!--                        >-->
<!--                          加 入-->
<!--                        </v-btn>-->

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

<!--                        <v-expand-transition>-->
<!--                          <div v-show="showItemDetail">-->
                            <v-divider></v-divider>

<!--                            <v-card-text>-->
<!--                              {{item.description}}-->
<!--                            </v-card-text>-->
                            <v-card-text>
                              {{item.attraction.description}}
                            </v-card-text>
<!--                          </div>-->
<!--                        </v-expand-transition>-->
<!--                        </template>-->
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
      // if (this.e1 > val) {
      //   this.e1 = val
      // }
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
    // selectItemDialog: function (){
    //   this.selectItemDialog1 = this.selectItemDialog;
    // }
  },
  computed: {
    // timeline () {
    //   console.log(this.travelSetDateMap);
    //   console.log(this.e1);
    //   // if(this.dates.length > 0){
    //   //   let event = this.travelSetDateMap[this.e1];
    //   //   return event.slice().reverse()
    //   // }
    //   let event = this.travelSetDateMap[this.e1];
    //   return event.slice().reverse()
    // },
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
    // steps(){
    //   return this.dateNum;
    // },
    travelSetLength() {
      return this.travelSetDateMap.length;
    },

    ...Vuex.mapState(["selectItemDialog", 'regions', 'selectRegion', 'selectItem', 'isSortDetailData', 'travelSetDetailSortDate', 'travelSetDetail', 'noLogin']),
  },
  created: function (){
    this.$store.dispatch("initRegionsData");
  },
  methods: {
    changeStep(){
      console.log(this.e1);
      this.setTimeline();
    },
    openDialog () {
      // this.count += 2
      this.dialog = true
    },
    selectDate(){
      // this.dates.sort((a,b)=>new Date(a).getTime()-new Date(b).getTime());
      this.$refs.dateModal.save(this.dates);

      // let eventDates = Object.keys(this.travelSetDateMap);
      // for (let i = 0; i < eventDates.length; i++) {
      //   if(this.dates.indexOf(eventDates[i]) == -1){
      //     delete this.travelSetDateMap[eventDates[i]]
      //   }
      // }
      //
      // // this.travelSetDateMap = {};
      // for (let date of this.dates) {
      //   console.log(date);
      //   this.travelSetDateMap[date] = [];
      // }
      // console.log(this.travelSetDateMap);

      this.travelSetDateMap = {};
      for (let date of this.dates) {
        if(!this.travelSetDateMap[date]){
          this.travelSetDateMap[date] = [];
        }
      }
      // console.log(this.travelSetDateMap);
      let eventDates = Object.keys(this.travelSetDateMap);
      for (let i = 0; i < eventDates.length; i++) {
        if(this.dates.indexOf(eventDates[i]) == -1){
          delete this.travelSetDateMap[eventDates[i]]
        }
      }
      // console.log(this.travelSetDateMap);
      let tmp = this.travelSetDateMap;
      let modify = eventDates.sort().reduce(function(Obj, key) {
        Obj[key] = tmp[key];
        return Obj;
      }, {});

    },
    closePicker: function(v){
      v = v < 10 ? '0'+v : v;
      this.time = v+":00";
      this.timeMenu = false
    },
    comment() {
      let time = this.time;

      let item = this.selectItem;
      // if(this.selectItem.type === 0){
      //   item = {
      //     sn: 0,
      //     type: this.selectItem.type,
      //     time: null,
      //     attraction: {
      //       sn: this.selectItem.sn,
      //       name: this.selectItem.name,
      //       description: this.selectItem.description,
      //     }
      //   }
      // }else if(this.selectItem.type === 1){
      //   item = {
      //     sn: 0,
      //     type: this.selectItem.type,
      //     time: null,
      //     restaurant: {
      //       sn: this.selectItem.sn,
      //       name: this.selectItem.name,
      //       description: this.selectItem.description,
      //     }
      //   }
      // }else if(this.selectItem.type === 2){
      //   item = {
      //     sn: 0,
      //     type: this.selectItem.type,
      //     time: null,
      //     hotel: {
      //       sn: this.selectItem.sn,
      //       name: this.selectItem.name,
      //       description: this.selectItem.description,
      //     }
      //   }
      // }

      item.time = new Date(this.e1);

      item.time.setHours(time.substring(0, 2));
      // console.log(this.e1);
      // console.log(item);

      // this.$nextTick(function () {
      // });
      let events = this.travelSetDateMap[this.e1];

      // console.log("==============");
      // console.log(events)
      // console.log("==============");
      // console.log(item);
      // console.log("==============");

      if(events.length > 0){
        // let isExist = false;
        for (let i = 0; i < events.length; i++) {
          if(events[i].type == item.type && item.type == 0 && events[i].attraction.sn == item.attraction.sn) {
            // console.log('type 0:'+i);
            // events[i].time = item.time;
            // isExist = true;
            events.splice(i, 1);
            break;
          }else if(events[i].type == item.type && item.type == 1 && events[i].restaurant.sn == item.restaurant.sn){
            // console.log('type 1:'+i);
            // events[i].time = item.time;
            // isExist = true;
            events.splice(i, 1);
            break;
          }else if(events[i].type == item.type && item.type == 2 && events[i].hotel.sn == item.hotel.sn){
            // console.log('type 2:'+i);
            // events[i].time = item.time;
            // isExist = true;
            events.splice(i, 1);
            break;
          }
        }

        // console.log(item.time);
        for (let i = 0; i < events.length; i++) {
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
          if(i===events.length) events.push(item);
          // else if(events[i].time < item.time){
          //   // console.log(i+'less')
          //   events.splice(i+1 , 0, item);
          //   break;
          // }
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
      this.$store.dispatch("saveTravelSet", travelSet);

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

    ...Vuex.mapMutations(['setSelectRegion']),
  },
};
</script>
<style>
* {
  font-family: 'Noto Sans TC', sans-serif;
}

</style>