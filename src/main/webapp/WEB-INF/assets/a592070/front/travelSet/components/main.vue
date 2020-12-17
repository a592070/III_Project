<template>
  <v-app>
    <v-container style="max-width: 1200px;">
      <v-card class="mb-4">
        <v-card-text>
          <v-select
              v-model="steps"
              :items="[2, 3, 4, 5, 6]"
              label="# 選 擇 天 數"
          ></v-select>
          <v-select
              v-model="selectRegion"
              :items="['全部', '台北', '高雄', '桃園', '台中']"
              label="# 選 擇 地 區"
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
          <template v-for="n in steps">
            <v-stepper-step
                :key="`${n}-step`"
                :complete="e1 > n"
                :step="n"
                editable
            >
              第 {{ n }} 日
            </v-stepper-step>

            <v-divider
                v-if="n !== steps"
                :key="n"
            ></v-divider>
          </template>
        </v-stepper-header>

        <v-stepper-items>
          <v-stepper-content
              v-for="n in steps"
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

                  <v-text-field
                      v-model="input"
                      hide-details
                      flat
                      label="留下點什麼..."
                      solo
                      @keydown.enter="comment"
                  >
                    <template v-slot:append>
                      <v-btn
                          class="mx-0"
                          depressed
                          @click="comment"
                      >
                        Post
                      </v-btn>
                    </template>
                  </v-text-field>
                </v-timeline-item>

                <v-slide-x-transition
                    group
                >
                  <v-timeline-item
                      v-for="event in timeline"
                      :key="event.id"
                      class="mb-4"
                      color="pink"
                      small
                  >
                    <v-row justify="space-between">
                      <v-col
                          cols="7"
                          v-text="event.text"
                      ></v-col>
                      <v-col
                          class="text-right"
                          cols="5"
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
      events: [],
      input: null,
      nonce: 0,

      travelSet: [],
      e1: 1,
      steps: 2,
      inputName: null,
      inputDescription: null,


    }
  },
  watch: {
    steps (val) {
      if (this.e1 > val) {
        this.e1 = val
      }
    },
  },
  computed: {
    timeline () {
      return this.events.slice().reverse()
    },
    ...Vuex.mapState(["selectItemDialog"])
  },

  methods: {
    openDialog () {
      // this.count += 2
      this.dialog = true
    },
    comment () {
      const time = (new Date()).toTimeString()
      this.events.push({
        id: this.nonce++,
        text: this.input,
        time: time.replace(/:\d{2}\sGMT-\d{4}\s\((.*)\)/, (match, contents, offset) => {
          return ` ${contents.split(' ').map(v => v.charAt(0)).join('')}`
        }),
      })

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
      if (n === this.steps) {
        this.e1 = 1
      } else {
        this.e1 = n + 1
      }
    },



    handleItemClick(id){
      console.log(id);
    },
  },
};
</script>
<style>
* {
  font-family: 'Noto Sans TC', sans-serif;
}

</style>