<template>
  <v-app>
    <travel-detail></travel-detail>
    <travel-info v-if="travelSetInfoDialog"></travel-info>
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

    <travel-detail-edit-item></travel-detail-edit-item>
    <v-fab-transition>
      <v-btn
          v-show="!travelSetEditItemDialog"
          key="mdi-plus"
          color="red"
          fab
          dark
          fixed
          bottom
          left
          @click="handleOpenTravelSetEditItem"
          class="v-btn--example"
      >
        <v-icon>mdi-chevron-right</v-icon>
      </v-btn>
    </v-fab-transition>
  </v-app>
</template>

<script>
module.exports = {
  components: {
    'travel-info': httpVueLoader(context + '/assets/a592070/front/travelSet/components/travelSetInfo.vue'),
    'travel-detail': httpVueLoader(context + '/assets/a592070/front/travelSet/components/travelSetDetail03.vue'),
    'travel-detail-edit-item': httpVueLoader(context + '/assets/a592070/front/travelSet/components/travelSetEditItem.vue'),
  },
  data() {
    return {
    }
  },
  watch: {

  },
  computed: {
    ...Vuex.mapState(["selectItemDialog", 'regions', 'selectRegion', 'selectItem', 'travelSetInfoDialog', 'travelSetEditItemDialog', 'travelSetDetail']),
  },
  created: function (){
  },
  methods: {
    handleOpenTravelSetInfo(){
      this.$store.commit("setTravelSetInfoDialog", true);
    },
    handleOpenTravelSetEditItem(){
      this.$store.commit("setTravelSetEditItemDialog", true);
      console.log(this.travelSetDetail);
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