<template>
  <div class="content row">
    <div class="col-12">
      <h1>HIHI</h1>
      <h1>{{getStoreData}}</h1>
      <travel-set-info></travel-set-info>

    </div>
  </div>
</template>

<script>

// import TravelSetDetail from "./travelSetDetail";
// import TravelSetInfo from "./travelSetInfo";
module.exports = {
  components: {
    "travel-set-info": httpVueLoader(context+'/assets/a592070/js/components/travelSetInfo.vue'),
    // "travel-set-detail": httpVueLoader(context+'/assets/a592070/js/components/travelSetDetail.vue')
    },
  data() {
    return{
      storeData: "123"
    }
  },
  computed: {
    getStoreData(){
      return this.$store.state.storeData;
    }
  }
}

</script>