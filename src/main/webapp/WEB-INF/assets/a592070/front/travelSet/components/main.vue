<template>
  <v-app>
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
                range
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
                  @click="$refs.dateModal.save(dates)"
              >
                OK
              </v-btn>
            </v-date-picker>
          </v-dialog>
          <v-text-field
              v-model="dateNum"
              hide-details
              flat
              readonly
              label="# 總 天 數"
          ></v-text-field>
<!--          <v-select-->
<!--              v-model="steps"-->
<!--              :items="[2, 3, 4, 5, 6]"-->
<!--              label="# 選 擇 天 數"-->
<!--          ></v-select>-->
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
              label="# 增 加 點 描 述 吧..."
          ></v-text-field>
        </v-card-text>
      </v-card>

      <v-container>
      <v-stepper v-model="e1">
        <v-stepper-header>
          <template v-for="n in dateNum">
            <v-stepper-step
                :key="`${n}-step`"
                :complete="e1 > n"
                :step="n"
                editable
            >
              第 {{ n }} 日
            </v-stepper-step>

            <v-divider
                v-if="n !== dateNum"
                :key="n"
            ></v-divider>
          </template>
        </v-stepper-header>

        <v-stepper-items>
          <v-stepper-content
              v-for="n in dateNum"
              :key="`${n}-content`"
              :step="n"
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
                            @click="addTravelSet"
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
                      <v-menu
                          v-model="timeMenu"
                          max-width="290px"
                          min-width="290px"
                      >
                        <template v-slot:activator="{ on }">
                          <v-text-field
                              :value="time"
                              label="選擇時間"
                              readonly
                              v-on="on"
                          ></v-text-field>
                        </template>
                        <v-time-picker
                            v-if="timeMenu"
                            :value="time"
                            @click:hour="closePicker"
                        ></v-time-picker>
                      </v-menu>
                    </v-card-text>
                    <v-card-text class="white text--primary">
                      <v-btn
                          color="red lighten-2"
                          class="mx-0"
                          outlined
                          @click="comment(dateNum[n])"
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
                      v-for="event in timeline"
                      :key="event.sn"
                      class="mb-4"
                      color="pink"
                      small
                  >
                    <v-row justify="space-between">
                      <v-col
                          cols="4"
                          v-text="event.name"
                      ></v-col>
                      <v-col
                          cols="4"
                          v-text="event.description"
                      ></v-col>
                      <v-col
                          class="text-right"
                          cols="4"
                          v-text="event.time"
                      ></v-col>
                    </v-row>
                  </v-timeline-item>
                </v-slide-x-transition>

                <v-timeline-item
                    class="mb-6"
                    hide-dot
                >
                  <span>TODAY</span>
                </v-timeline-item>

              </v-timeline>


            </v-card>


            <v-btn
                color="primary"
                @click="nextStep(n)"
            >
              Continue
            </v-btn>

            <v-btn text>
              Cancel
            </v-btn>
          </v-stepper-content>
        </v-stepper-items>


      </v-stepper>





      </v-container>
    </v-container>
  </v-app>
</template>

<script>
module.exports = {
  components: {
    'select-item': httpVueLoader(context + '/assets/a592070/front/travelSet/components/selectItem02.vue'),
    'infinite-scroll': httpVueLoader(context + '/assets/a592070/front/travelSet/components/testScroll.vue'),
  },
  data() {
    return {
      dates: [],
      dateMenu: false,
      dateModal: false,
      events: [],
      input: null,
      nonce: 0,

      region: this.selectRegion,

      travelSet: [],
      e1: 1,
      steps: this.dateNum,
      inputName: null,
      inputDescription: null,

      item: this.selectItem,

      time: '08:00',
      timeMenu: false
    }
  },
  watch: {
    dateNum (val) {
      if (this.e1 > val) {
        this.e1 = val
      }
    },
  },
  computed: {
    timeline () {
      return this.events.slice().reverse()
    },
    dateRangeText () {
      return this.dates.join(' ~ ')
    },
    dateNum(){
      if(this.dates.length > 1) {
        console.log(this.dates);
        console.log(new Date(this.dates[1]));
        console.log(new Date(this.dates[0]));

        let num = (new Date(this.dates[1]) - new Date(this.dates[0])) / 1000 / 60 / 60 / 24 + 1;
        let dateArray = [];

        let beginDate = new Date(this.dates[0]);
        let endDate = new Date(this.dates[1]);

        dateArray.push(beginDate);
        let tmpDate = beginDate;
        for (let i = 1; i <num; i++) {
          let plusDate = tmpDate;
          plusDate.setDate(plusDate.getDate()+1);
          dateArray.push(plusDate);
          tmpDate = plusDate;
        }

        console.log(dateArray)

        return
      }else {
        return 1;
      }
    },

    ...Vuex.mapState(["selectItemDialog", 'regions', 'selectRegion', 'selectItem']),
  },
  created: function (){
    this.$store.dispatch("initRegionsData");
  },
  methods: {
    allowedHours: v => v % 2,
    allowedMinutes: v => v >= 10 && v <= 50,
    allowedStep: m => m % 10 === 0,
    openDialog () {
      // this.count += 2
      this.dialog = true
    },
    closePicker: function(v){
      v = v < 10 ? '0'+v : v;
      this.time = v+":00";
      this.timeMenu = false
    },
    comment (day) {
      console.log(day);
      let time = this.time;

      if(this.events.length > 0){
        for (let i = 0; i < this.events.length; i++) {
          if(this.events[i].time > time){
            this.events.push(this.selectItem)
          }
        }
      }else{
        this.events.push(this.selectItem)
      }

      console.log(this.events);


      // this.events.push({
      //   id: this.nonce++,
      //   text: this.input,
      //   time: time.replace(/:\d{2}\sGMT-\d{4}\s\((.*)\)/, (match, contents, offset) => {
      //     return ` ${contents.split(' ').map(v => v.charAt(0)).join('')}`
      //   }),
      // })

      this.input = null
    },
    addTravelSet () {
      // const time = (new Date()).toTimeString()
      // this.travelSet.push({
      //   id: this.nonce++,
      //   text: this.input,
      //   time: time.replace(/:\d{2}\sGMT-\d{4}\s\((.*)\)/, (match, contents, offset) => {
      //     return ` ${contents.split(' ').map(v => v.charAt(0)).join('')}`
      //   }),
      // })
      //
      // this.input = null
      // this.overlay = ! this.overlay;
      // this.dialog = ! this.dialog;
      this.$store.commit('toggleSelectItemDialog', true);
    },
    nextStep (n) {
      if (n === this.dateNum) {
        this.e1 = 1
      } else {
        this.e1 = n + 1
      }
    },
    handleSelectedRegion(){
      this.setSelectRegion(this.region);
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