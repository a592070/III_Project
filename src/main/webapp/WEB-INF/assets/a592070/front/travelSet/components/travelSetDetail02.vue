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
              Cancel
            </v-btn>
            <v-btn
                text
                color="primary"
                @click="selectDate"
            >
              OK
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
                          v-model="selectItemDialog"
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
                            <v-icon>mdi-plus</v-icon>
                          </v-btn>
                        </template>
                        <select-item></select-item>
                      </v-dialog>
                    </template>
                    <v-card
                        color="red lighten-2"
                        dark
                    >
                      <v-card-title class="title">
                        {{selectItem.name}}
                      </v-card-title>
                      <v-card-text class="white text--primary">
                        <p>{{selectItem.description}}</p>
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
                            :disabled="selectItem.sn === 0"
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
                    <v-timeline-item
                        v-for="item in timeline"
                        :key="item.sn"
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
                            {{item.name}}
                          </h2>
                        </v-card-title>
                        <v-card-text class="headline font-weight-bold">
                          {{item.time.toLocaleString()}}
                        </v-card-text>
                        <v-card-actions>
                          <v-btn
                              color="orange lighten-2"
                              text
                              @click="showItemDetail = !showItemDetail"
                          >
                            詳細
                          </v-btn>
                          <v-spacer></v-spacer>
                          <v-btn
                              class="mx-2"
                              fab
                              dark
                              small
                              color="primary"
                              @click="removeItem(item)"
                          >
                            <v-icon dark>
                              mdi-minus
                            </v-icon>
                          </v-btn>
                        </v-card-actions>

                        <v-expand-transition>
                          <div v-show="showItemDetail">
                            <v-divider></v-divider>

                            <v-card-text>
                              {{item.description}}
                            </v-card-text>
                          </div>
                        </v-expand-transition>
                      </v-card>
                    </v-timeline-item>
                  </v-slide-x-transition>
                </v-timeline>
              </v-card>


              <v-btn
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
      timeline: []
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
    dateRangeText () {
      return this.dates.join('  #')
    },
    dateNum(){
      if(this.dates.length > 1) {
        return this.dates.length;
      }
      this.steps = this.dates[0];
      return 1;
    },
    // steps(){
    //   return this.dateNum;
    // },
    travelSetLength() {
      return this.travelSetDateMap.length;
    },

    ...Vuex.mapState(["selectItemDialog", 'regions', 'selectRegion', 'selectItem', 'isSortDetailData', 'travelSetDetailSortDate']),
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
      this.dates.sort((a,b)=>new Date(a).getTime()-new Date(b).getTime());
      this.$refs.dateModal.save(this.dates);

      let eventDates = Object.keys(this.travelSetDateMap);
      for (let i = 0; i < eventDates.length; i++) {
        if(this.dates.indexOf(eventDates[i]) != -1){

        }
      }

      // this.travelSetDateMap = {};
      for (let date of this.dates) {
        console.log(date);
        this.travelSetDateMap[date] = [];
      }
      console.log(this.travelSetDateMap);

    },
    closePicker: function(v){
      v = v < 10 ? '0'+v : v;
      this.time = v+":00";
      this.timeMenu = false
    },
    comment() {
      let time = this.time;

      let item = {
        type: this.selectItem.type,
        sn: this.selectItem.sn,
        name: this.selectItem.name,
        description: this.selectItem.description,
        time: null
      }

      item.time = new Date(this.e1);

      item.time.setHours(time.substring(0, 2));
      // console.log(this.e1);
      // console.log(item);

      // this.$nextTick(function () {
      // });
      let events = this.travelSetDateMap[this.e1];

      // console.log(events);

      if(events.length > 0){
        for (let i = 0; i < events.length; i++) {
          if(events[i].time > item.time){
            events.splice(i , 0, item);
            break;
          }else if(events[i].time < item.time){
            events.push(item);
            break;
          }
        }
      }else{
        events.push(item)
      }

      // console.log(events);
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
    },
    addTravelSetItem () {

      this.$store.commit('toggleSelectItemDialog', true);
    },
    saveTravelSet () {

      console.log(this.travelSetDateMap);
      // let convertedTravelSet = this.convertToTravelSet(this.travelSetByDate);
      // console.log(convertedTravelSet);
      // this.$store.dispatch("saveTravelSet", convertedTravelSet);


    },
    handleSelectedRegion(){
      this.setSelectRegion(this.region);
    },

    convertToTravelSet(data){
      let tmp = {
        travelSetInfo: {
          sn: 0,
          name: this.inputName,
          description: this.inputDescription,
        },
        travelSetAttractions: [],
        travelSetRestaurants: [],
        travelSetHotels: [],
      };
      for (let i = 0; i < data.length; i++) {
        let event = data[i];

        for (let j = 0; j < event.length; j++) {
          if(event[j].type === 0){
            tmp.travelSetAttractions.push({
              sn: 0,
              time: event[j].time,
              attraction: {
                sn: event[j].sn,
              }
            })
          }else if(event[j].type === 1){
            tmp.travelSetRestaurants.push({
              sn: 0,
              time: event[j].time,
              restaurant: {
                sn: event[j].sn,
              }
            })
          }else if(event[j].type === 2){
            tmp.travelSetHotels.push({
              sn: 0,
              time: event[j].time,
              hotel: {
                sn: event[j].sn,
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