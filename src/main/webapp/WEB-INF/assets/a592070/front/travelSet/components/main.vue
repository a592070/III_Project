<template>
  <v-app>
    <travel-detail></travel-detail>
    <travel-info></travel-info>
    <v-fab-transition>
      <v-btn
          v-show="!travelSetInfoDialog"
          key="mdi-pencil"
          color="red"
          fab
          large
          dark
          fixed
          bottom
          right
          @click="handleOpenTravelSetInfo"
          class="v-btn--example"
      >
        <v-icon>mdi-pencil</v-icon>
      </v-btn>
    </v-fab-transition>
  </v-app>
</template>

<script>
module.exports = {
  components: {
    'travel-info': httpVueLoader(context + '/assets/a592070/front/travelSet/components/travelSetInfo.vue'),
    'travel-detail': httpVueLoader(context + '/assets/a592070/front/travelSet/components/travelSetDetail.vue'),
  },
  data() {
    return {

    }
  },
  watch: {

  },
  computed: {
    ...Vuex.mapState(["selectItemDialog", 'regions', 'selectRegion', 'selectItem', 'travelSetInfoDialog']),
  },
  created: function (){
  },
  methods: {
    handleOpenTravelSetInfo(){
      this.$store.commit("setTravelSetInfoDialog", true);
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